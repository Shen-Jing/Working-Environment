#! /bin/bash
function gdrive_download () {
  CONFIRM=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate "https://docs.google.com/uc?export=download&id=$1" -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')
  wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$CONFIRM&id=$1" -O $2
  rm -rf /tmp/cookies.txt
}

# download files
mkdir /usr/share/lsf_distrib
cd /usr/share/lsf_distrib
gdrive_download 1JtAPGvxUHEG3CXp0S026kSyuA_y77bd4 total.tar
tar -zxvf lsf9.1.1_lsfinstall_linux_x86_64.tar.Z

# download configs
cd /usr/share/lsf_distrib/lsf9.1.1_lsfinstall
gdrive_download 1c5rtFa4HwJ18fVNFWaxsyEOkjG4EGJa2 install.config

./lsfinstall -f install.config