# Changelog

## [Unreleased]

## [3.0.1] - 2020-12-21

### Changed

- Fix: modify pprof installation
  - use older pprof instead of pprof of golang
  - dependency: `aclocal` (automake)

## [3.0] - 2020-12-18

### Changed

- **Fedora** update: 32 ➡️ 33
- C++ boost update: 1.74.0 ➡️ 1.75.0
- Misc: restoring docker installation
- Misc: modify installing path of C++ tools
- New: Google Performance Tools
  - using golang to install
- New: TCMalloc
  - Prerequisite: Bazel (the official build system)

## [2.1.2] - 2020-11-12

### Changed

- Fix locale problem (when installing zsh theme)
- Fix permission of ssh public key (rwx: 600)

## [2.1.1] - 2020-09-05

### Changed

- Add `crontabs`

## [2.1] - 2020-08-17

### Changed

- C++ boost update: 1.73.0 ➡️ 1.74.0
- split shell script (c-c++ ➡️ install_gcc8)
  - *build gcc from source* makes docker image bloated!
  - Default: doesn't install older version of C++