# Changelog

## [Unreleased]

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