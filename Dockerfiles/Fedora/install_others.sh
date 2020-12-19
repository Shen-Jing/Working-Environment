#!/bin/bash

# [Other]

# Latex

wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar zxvf install-tl-unx.tar.gz
rm install-tl-unx.tar.gz
cd $(ls -d install-tl*/)
sudo perl install-tl

# [Shell]

# [Trivial]