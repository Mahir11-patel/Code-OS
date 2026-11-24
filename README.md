# KodeOS — Developer Operating System

KodeOS is an open-source developer OS project. The repository contains two related projects:

- **KodeOS Linux** — a Debian-based, XFCE live operating system for x86_64 PCs, targeting 4 GB RAM. Its build configuration is in [linux-distro/](./linux-distro/).
- **CodeOS Web Desktop** — the existing browser-based desktop prototype, retained in this repository under its original files.

## Build the Linux live ISO

The Linux distribution uses Debian Live Build and GitHub Actions.

1. Open the **Actions** tab.
2. Select **Build KodeOS ISO**.
3. Choose **Run workflow**.
4. Wait for the build to finish.
5. Download the `kodeos-developer-live-amd64` artifact from the workflow run.

Build locally on Debian 13:

```bash
sudo apt update
sudo apt install -y live-build debootstrap squashfs-tools xorriso \
  grub-pc-bin grub-efi-amd64-bin mtools dosfstools
cd linux-distro
sudo ./scripts/build-local.sh
```

Read the [Linux distribution guide](./linux-distro/README.md) and [roadmap](./linux-distro/ROADMAP.md) before testing.

## KodeOS Linux goals

- Bootable USB live session with a permanent installation option
- Lightweight XFCE desktop for 4 GB RAM target hardware
- Offline local coding with Python, C/C++, Java, JavaScript, Rust and Go toolchains
- Git, terminal, editor and system utilities
- Kode Studio, Kode Store and Kode Terminal as the project matures
- Optional local AI model support; models are distributed separately due to size and RAM constraints
- No mandatory cloud account or internet connection for core local development

**Important:** The first ISO is a development build. Test it in a virtual machine before using it on a real computer. Creating the ISO does not flash a USB drive or install onto a disk. Back up important data before using any installer.

## Project status

The repository currently contains the initial Debian Live Build scaffold and CI workflow. The first successful ISO build, installer validation, offline package repository, Kode applications and hardware testing remain development tasks.

## License

The KodeOS distribution configuration and original scripts are MIT-licensed. Third-party packages and components retain their respective upstream licenses.
