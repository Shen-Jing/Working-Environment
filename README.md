# Working-Environment
such as Linux Shell scripts,
     Dockerfile,
     /home directory settings

## Dockerfile
```bash
docker run -itd --privileged --name kevin -p 56137:22 -p 56138:8888 -v /var/run/docker.sock:/var/run/docker.sock -v /home/nfs_home/kevin:/home/kevin -v /mnt/project_warehouse3/godzilla/kevin:/mnt/godzilla/kevin kevin_fedora:30v1.7
```
1. linux package
    - util-linux-user: `chsh`
    - net-tools: `netstat`
    - iputils: `ping`
        - iputils-ping (ubuntu)
    - procps-ng: `free`, `pidof`
    - patch: (for radare2 on Fedora)
    - bzip2: for solving `bzip2: Cannot exec: No such file or directory`
    - drive-google
	    - [vaughan/drive-google](https://copr.fedorainfracloud.org/coprs/vaughan/drive-google/)
    - fuzzy finder: `fzf` (and install for [fz](https://github.com/changyuheng/fz/blob/master/README-zh.md))
    - vcsh + myrepos: for HOME settings
2. Programming Language
    - python: python2 (for some zsh plugins such as `autojump`)
    - golang: Go
	    - [odeke-em/drive](https://github.com/odeke-em/drive)
    - gdb, cgdb
    - clang: for ale linter (include clang++)
    - cppcheck: static analysis tool for C/C++ code
    - pylint

## install_others (.sh)
1. python module
    - numpy
    - matplot
    - ipython: more interactively python CLI