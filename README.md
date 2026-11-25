# KodeOS — Developer Operating System

KodeOS is an open-source developer OS project.

## Ubuntu edition (active direction)

The Ubuntu-based implementation is being developed in [kodeos-ubuntu/](./kodeos-ubuntu/). It targets Ubuntu 24.04 LTS, x86_64 PCs, a 4 GB RAM class lightweight desktop, Windows/WSL and native Linux build paths, and a bootable ISO workflow.

- [Ubuntu edition build guide](./kodeos-ubuntu/README.md)
- [Ubuntu package selection](./kodeos-ubuntu/packages.list)
- [Ubuntu ISO build script](./kodeos-ubuntu/scripts/build.sh)
- [Windows build launcher](./BUILD_KODEOS.bat)
- [GitHub Actions ISO workflow](./.github/workflows/build-kodeos-ubuntu.yml)

The Ubuntu ISO workflow is a development build. The first successful build, live boot, Calamares installation, and hardware validation must be confirmed before publishing a stable release.

## Existing prototypes

- **KodeOS Linux Debian prototype** — the earlier Debian Live Build scaffold in [linux-distro/](./linux-distro/). It is retained for reference and is not the Ubuntu edition.
- **CodeOS Web Desktop** — the existing browser-based desktop prototype in `codeos.html`.

## Important constraints

- A bootable live image and a tested permanent installer are separate milestones. Do not install an unvalidated image on a physical disk.
- Full Kimi K3 weights do not fit the 4 GB RAM / 256 GB storage target. The `k3-in-c` inference engine source is not the same thing as the model weights. KodeOS will need a small model for the 4 GB edition; full K3 requires substantially more storage and memory.
- The first ISO build downloads packages while building. Once all selected packages and model files are present locally, the installed OS can run offline. The current image is not yet a complete offline mirror of every developer package.

## License

Original KodeOS scripts and configuration are MIT-licensed. Third-party packages and components retain their respective upstream licenses.
