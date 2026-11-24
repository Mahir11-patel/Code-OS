# KodeOS roadmap

## Phase 0 — distribution scaffold
- [x] Debian Live Build configuration
- [x] XFCE low-memory desktop package set
- [x] Developer toolchain package list
- [x] GitHub Actions ISO build workflow
- [ ] First successful ISO build and VM boot test

## Phase 1 — usable offline workstation
- [ ] Validate live boot and Debian installer on BIOS and UEFI
- [ ] Test Wi-Fi, audio, graphics, suspend and storage on target laptops
- [ ] Add offline documentation bundles (Python, C/C++, Git, shell)
- [ ] Add a signed local APT repository and package metadata to installation media
- [ ] Verify installed development tools with network disconnected

## Phase 2 — Kode applications
- [ ] Kode Studio launcher and curated editor integration
- [ ] Kode Store GUI backed by APT, with clear offline package status
- [ ] Kode Terminal profile, aliases and project templates
- [ ] Kode Welcome app and hardware diagnostics

## Phase 3 — optional local AI
- [ ] Package a small local inference runtime
- [ ] Provide separately downloadable, checksum-verified model packs
- [ ] Add a low-memory model preset for 4 GB systems
- [ ] Make AI fully optional and never block boot or core development

## Release criteria
- Boots from USB on supported x86_64 hardware
- Live session usable with 4 GB RAM
- Installer can install to disk with explicit user confirmation
- Local coding and compilation work without internet
- ISO checksum published with every build
- No destructive USB flashing or disk partitioning in CI
