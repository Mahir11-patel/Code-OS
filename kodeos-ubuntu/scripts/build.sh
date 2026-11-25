#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
BUILD_DIR="${BUILD_DIR:-$PROJECT_DIR/work}"
ROOTFS="$BUILD_DIR/rootfs"
ISO_ROOT="$BUILD_DIR/iso"
OUTPUT_DIR="$PROJECT_DIR/output"
CODENAME="noble"
ARCH="amd64"
MIRROR="http://archive.ubuntu.com/ubuntu"

if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo: sudo bash scripts/build.sh" >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive
mkdir -p "$BUILD_DIR" "$OUTPUT_DIR"
apt-get update
apt-get install -y debootstrap squashfs-tools xorriso grub-pc-bin grub-efi-amd64-bin mtools dosfstools rsync

if [[ ! -d "$ROOTFS/etc" ]]; then
  mkdir -p "$ROOTFS"
  debootstrap --arch="$ARCH" --variant=minbase "$CODENAME" "$ROOTFS" "$MIRROR"
fi

mountpoint -q "$ROOTFS/dev" || mount --bind /dev "$ROOTFS/dev"
mountpoint -q "$ROOTFS/dev/pts" || mount --bind /dev/pts "$ROOTFS/dev/pts"
mountpoint -q "$ROOTFS/proc" || mount -t proc proc "$ROOTFS/proc"
mountpoint -q "$ROOTFS/sys" || mount -t sysfs sysfs "$ROOTFS/sys"
mountpoint -q "$ROOTFS/run" || mount --bind /run "$ROOTFS/run"
cp -L /etc/resolv.conf "$ROOTFS/etc/resolv.conf"

cleanup() {
  for p in run sys proc dev/pts dev; do
    mountpoint -q "$ROOTFS/$p" && umount -lf "$ROOTFS/$p" || true
  done
}
trap cleanup EXIT

cat > "$ROOTFS/etc/apt/sources.list" <<EOF
deb $MIRROR $CODENAME main restricted universe multiverse
deb $MIRROR $CODENAME-updates main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu $CODENAME-security main restricted universe multiverse
EOF

cp "$PROJECT_DIR/packages.list" "$ROOTFS/tmp/kodeos-packages.list"
chroot "$ROOTFS" /bin/bash -euxc '
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  grep -Ev "^[[:space:]]*(#|$)" /tmp/kodeos-packages.list | xargs apt-get install -y --no-install-recommends
  useradd -m -s /bin/bash -G sudo,audio,video,plugdev kodeos || true
  passwd -d kodeos
  echo "kodeos ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/kodeos
  chmod 0440 /etc/sudoers.d/kodeos
  mkdir -p /etc/lightdm/lightdm.conf.d
  cat > /etc/lightdm/lightdm.conf.d/50-kodeos.conf <<CONF
[Seat:*]
autologin-user=kodeos
autologin-user-timeout=0
CONF
  systemctl enable lightdm NetworkManager
  echo KodeOS > /etc/hostname
  printf "127.0.0.1 localhost\n127.0.1.1 KodeOS\n" > /etc/hosts
  update-initramfs -c -k all
  apt-get clean
  rm -rf /var/lib/apt/lists/* /tmp/*
'

# Add a clearly labelled installer launcher. Calamares configuration and
# end-to-end partition/bootloader testing are still required before release.
mkdir -p "$ROOTFS/usr/share/applications"
cat > "$ROOTFS/usr/share/applications/kodeos-installer.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Install KodeOS
Comment=Start the KodeOS permanent installer
Exec=pkexec calamares
Icon=system-software-install
Terminal=false
Categories=System;
DESKTOP

cleanup
trap - EXIT

rm -rf "$ISO_ROOT"
mkdir -p "$ISO_ROOT/casper" "$ISO_ROOT/boot/grub" "$ISO_ROOT/.disk"
cp "$ROOTFS/boot/vmlinuz-"* "$ISO_ROOT/casper/vmlinuz"
cp "$ROOTFS/boot/initrd.img-"* "$ISO_ROOT/casper/initrd"
mksquashfs "$ROOTFS" "$ISO_ROOT/casper/filesystem.squashfs" -e boot
du -sx --block-size=1 "$ROOTFS" | cut -f1 > "$ISO_ROOT/casper/filesystem.size"
printf "KodeOS Ubuntu Live\n" > "$ISO_ROOT/.disk/info"

cat > "$ISO_ROOT/boot/grub/grub.cfg" <<'GRUB'
set timeout=8
set default=0
menuentry "Start KodeOS Live" {
    linux /casper/vmlinuz boot=casper quiet splash username=kodeos hostname=kodeos ---
    initrd /casper/initrd
}
menuentry "Start KodeOS Live (safe graphics)" {
    linux /casper/vmlinuz boot=casper nomodeset quiet splash username=kodeos hostname=kodeos ---
    initrd /casper/initrd
}
GRUB

grub-mkrescue -o "$OUTPUT_DIR/KodeOS-Ubuntu-amd64.iso" "$ISO_ROOT"
cd "$OUTPUT_DIR"
sha256sum KodeOS-Ubuntu-amd64.iso | tee SHA256SUMS
echo "Built: $OUTPUT_DIR/KodeOS-Ubuntu-amd64.iso"
