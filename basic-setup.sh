#!/bin/sh

cat <<'EOF' | sudo tee /etc/pacman.d/mirrorlist
## Japan
Server = http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/$repo/os/$arch
## Japan
Server = http://mirrors.cat.net/archlinux/$repo/os/$arch
EOF

sudo pacman -Syu --noconfirm
sudo pacman -S base base-devel git vim tmux tcpdump jq linux-headers --noconfirm

aur_pkg_install(){
	REPO=$1
	DIR="${HOME}/aur_pkg_tmp"

	if [ -d ${DIR} ];then
	  rm -rf ${DIR}
	fi
	
	git clone ${REPO} ${DIR}
	cd ${DIR}
	makepkg -si --noconfirm
}

# for aurman gpg
# https://github.com/polygamma/aurman/blob/master/PKGBUILD#L12
gpg --recv-keys 4C3CE98F9579981C21CA1EC3465022E743D71E39
aur_pkg_install https://github.com/polygamma/aurman.git

aurman -S bpftrace-git python-bcc bcc-tools bcc bpf trace-cmd strace perf --noconfirm --skip_news --needed --noedit
echo 'export PATH="$PATH:/usr/share/bcc/tools"' >> $HOME/.bashrc

aurman -S docker ctop --noconfirm --skip_news --needed --noedit

