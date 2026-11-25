# KodeOS — Ubuntu Developer Edition

This directory is the Ubuntu-based KodeOS implementation. It is separate from the older Debian prototype in `linux-distro/`.

## Target

- Ubuntu 24.04 LTS (Noble), x86_64
- 4 GB RAM target with a lightweight XFCE desktop
- Live USB boot
- Calamares-based permanent installation entry point
- Offline-first developer tools installed into the image
- Windows build launcher (WSL2) and native Ubuntu/Linux build script

## Build on Ubuntu

A clean Ubuntu 24.04 build host with internet access is needed to download the Ubuntu base system and build dependencies:

```bash
sudo bash scripts/build.sh
```

The ISO is written to `output/KodeOS-Ubuntu-amd64.iso`.

## Build on Windows

Install WSL2 and Ubuntu 24.04 once, then run `BUILD_KODEOS.bat` from this repository. The first build needs internet access inside WSL to download Ubuntu packages. The finished ISO can boot offline.

## GitHub Actions

Open **Actions → Build KodeOS Ubuntu ISO → Run workflow**. The workflow uploads the ISO and SHA256 checksum as a 14-day workflow artifact. A successful artifact is a build output, not yet a certified release.

## Kimi K3 / offline AI

The repository can integrate the `k3-in-c` inference engine source, but the engine is not the model weights. The full Kimi K3 checkpoint is far beyond the 256 GB / 4 GB target. This build does not pretend to bundle full Kimi K3. A small compatible local model can be added as a separate optional model pack after licensing, memory use and redistribution size are verified.

## Current status and safety

This is an early development build. The build script and installer integration must be tested in QEMU/VirtualBox before physical installation. Calamares is included as the installer UI, but its partitioning, bootloader and target-system module configuration must be validated before treating permanent installation as production-ready. Do not install on a real disk until this validation is complete. Back up important data first.

The ISO build itself never flashes a USB drive or modifies the build host's disks.

## License

Original KodeOS scripts and configuration are MIT-licensed. Ubuntu and third-party packages retain their upstream licenses.
