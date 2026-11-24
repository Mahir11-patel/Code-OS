# KodeOS Linux — Developer Live Edition

KodeOS is a Debian-based, offline-first developer operating system targeting x86_64 PCs with 4 GB RAM. This directory contains the real Linux distribution build, separate from the existing browser-based CodeOS project.

## Current build status

This is the initial distribution scaffold. GitHub Actions builds a bootable hybrid ISO from Debian Live Build. It is a development image, not yet a certified release. Test it in a virtual machine before installing on physical hardware.

## Design decisions

- Debian 13 (trixie) base, amd64
- XFCE desktop for modest memory use
- Debian Live with hybrid BIOS/UEFI boot
- Debian live installer workflow
- Core developer tools installed into the image
- No cloud login, telemetry, or network requirement for local coding
- Optional AI model packs; large models are not bundled into the base ISO

## Build locally (Debian 13)

Install build dependencies:

```bash
sudo apt update
sudo apt install -y live-build debootstrap squashfs-tools xorriso   grub-pc-bin grub-efi-amd64-bin mtools dosfstools
```

Then:

```bash
cd linux-distro
sudo lb config --distribution trixie --architectures amd64 \
  --binary-images iso-hybrid --archive-areas "main contrib non-free-firmware" \
  --debian-installer live
sudo lb build
```

The resulting ISO is written in the build directory. Run `sha256sum *.iso` to record its checksum.

## GitHub Actions

Push changes under `linux-distro/` or run the **Build KodeOS ISO** workflow manually. The workflow uploads the ISO and SHA256 checksum as a build artifact. GitHub-hosted runners have finite disk space; if the ISO build exceeds runner capacity, use a self-hosted Debian 13 runner with at least 30 GB free disk.

## Offline behavior and limits

Installed applications and their runtimes work without internet after boot. Network-dependent features (GitHub, online package indexes, remote repositories) naturally need connectivity. The base ISO does not contain every package in Debian's repositories; add a curated offline APT repository in a later release if fully offline package installation is required. Optional AI models are distributed separately so the base image remains practical for 4 GB machines.

## Hardware

- CPU: x86_64 (amd64)
- RAM: 4 GB minimum target; 8 GB recommended for IDEs and browsers
- USB: 8 GB minimum, 16 GB recommended
- Disk: 25 GB recommended for permanent installation and development work

## Safety

The ISO builder only creates an image artifact. It does not flash USB drives, repartition disks, or install the OS on a computer. The installer can erase disks if the user chooses that option; read every installer screen carefully and back up important data first.

## License

Distribution configuration and original KodeOS scripts are MIT-licensed. Debian packages retain their respective upstream licenses. See `LICENSE`.
