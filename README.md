# Working-Environment

- Linux Shell scripts
- Dockerfile
- /home directory settings

## Dockerfile

```bash
docker build -t jhhlab/kevin_fedora:27v1.8 . --no-cache
# If failed at some stage
docker build -t jhhlab/kevin_fedora:27v1.8 .
docker push jhhlab/kevin_fedora:27v1.8
```

### Fedora

I don't know how to install `gcc` < 8.0.0. :cry:
It doesn't compatible with my project (GTEST failed).

#### gcc default version (Fedora)

- 30: 9.3.1
- 28: 8.3.1
- 28: 7.3.0

```bash
docker run -itd --privileged --name kevin -p 56137:22 -p 56138:8888 -v /var/run/docker.sock:/var/run/docker.sock -v /home/nfs_home/kevin:/home/kevin -v /mnt/project_warehouse3/godzilla/kevin:/mnt/godzilla/kevin kevin_fedora:30v1.7
```

### Ubuntu

for support older gcc version (< 8.0.0)

#### gcc default version (Ubuntu)

- 18.04: 7.5.0

```bash
docker run -itd --privileged --name kevin -p 56137:22 -p 56138:8888 -v /var/run/docker.sock:/var/run/docker.sock -v /home/nfs_home/kevin:/home/kevin -v /mnt/project_warehouse3/godzilla/kevin:/mnt/godzilla/kevin kevin_ubuntu:18.04v1.0
```

### linux package

- `chsh`
  - util-linux-user (Fedora)
- `netstat`
  - net-tools
- `ping`
  - iputils-ping (Ubuntu)
- `free`, `pidof`
  - procps-ng
- patch: (for radare2 on Fedora)
- bzip2: for solving `bzip2: Cannot exec: No such file or directory`
- drive-google
  - [vaughan/drive-google](https://copr.fedorainfracloud.org/coprs/vaughan/drive-google/)
- fuzzy finder: `fzf` (and install for [fz](https://github.com/changyuheng/fz/blob/master/README-zh.md))
- `vcsh` + `myrepos`: for HOME settings

### Programming Language

- python: python2 (for some zsh plugins such as `autojump`)
- golang: Go
  - [odeke-em/drive](https://github.com/odeke-em/drive)
- gdb, cgdb
- clang: for ale linter (include clang++)
- cppcheck: static analysis tool for C/C++ code
- pylint

## install_others (.sh)

### python module

- numpy
- matplot
- ipython: more interactively python CLI

## known issues

### 不同 host build image 的下載速度差異大

boost.tar 足足有 100 MB 左右，雖然對交大學術網路而言，下載只是幾秒鐘的事情。
然而不同實體機竟然會有截然不同的下載速度。

因此可在 Fedora 的 Dockerfile 中看到原本使用 `wget -P` 下載，後來又改為 `curl -L -o`（順帶一提，`-L` 重導向實在好重要，避免下載到空檔案），結果出在網路問題。

目前還不知道該怎麼解決，治標解法：

1. 準備個 boost.tar 在當前目錄，用 ADD file 的方式省去下載步驟
2. 換台 host（我主要選擇的方法）