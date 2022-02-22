#!/bin/bash
c() {
	clear
}
c
setup_storage() {
if [ -d ~/storage ]; then
	echo ""
else
	echo "setting up storage permission..."
	echo ""
	echo "please press allow to setup storage"
	sleep 2
	termux-setup-storage
fi
setup_storage
}
install_pkgs() {
pkg1="python"
pkg2="mpv"
pkg3="aria2"
pkg4="ffmpeg"
pip="pip3"
pip1="yt-dlp"
pip2="youtube-dl"

if [ $(command -v ${pkg1}) ]; then
	echo "${pkg1} already installed"
	sleep 1
	c
else
	echo "installing ${pkg1}"
	sleep 1 
	c
	pkg up -y && pkg i ${pkg1} -y
fi

if [ $(command -v ${pkg2}) ]; then
	echo "${pkg2} already installed"
	sleep 1
	c
else
	echo "installing ${pkg2}"
	sleep 1 
	c
	pkg up -y && pkg i ${pkg2} -y
fi

if [ $(command -v aria2c) ]; then
	echo "${pkg3} already installed"
	sleep 1
	c
else
	echo "installing ${pkg3}"
	sleep 1
	c
	pkg up -y && pkg i ${pkg3} -y
fi


 
if [ $(command -v ${pkg4}) ]; then
	echo "${pkg4} already installed"
	sleep 1
	c
else
	echo "installing ${pkg4}"
	sleep 1
	c
	pkg up -y && pkg i ${pkg4} -y
fi

if [ $(command -v ${pip}) ]; then
	echo "${pip} already installed"
	sleep 1
	c
else
	echo "installing ${pip}"
	sleep 1 
	c
	aria2c https://bootstrap.pypa.io/get-pip.py && python get-pip.py && rm get-pip.py
fi


if [ $(command -v ${pip1}) ]; then
	echo "${pip1} already installed"
	sleep 1
	c
else
	echo "installing ${pkg2}"
	sleep 1 
	c
	pip3 install ${pip1}
fi


if [ $(command -v ${pip2}) ]; then
	echo "${pip1} already installed"
	sleep 1
	c
else
	echo "installing ${pkg2}"
	sleep 1 
	c
	pip3 install ${pip2}
fi
}
setup_tuo() {
c
dir="~/bin"
file="~/bin/termux-url-opener"
ytdir="/sdcard/YouTube"
cdir="~/.config/yt-dlp"
cfile="${cdir}/config"
pdir="~/ytpro"
if [ -d ${dir} ]; then
	echo ""
else
	echo "creating ${dir}"
	mkdir ${dir}
	sleep 1
	c
fi

if [ -d ${ytdir} ]; then
	echo ""
else
	echo "creating ${ytdir}
	mkdir ${ytdir}
	sleep 1
	c
fi

if [ -f ${file} ]; then
	mv ${file} ${file}.bak
	cp ${pdir}/termux-file-opener ${dir} && chmod +x ${file}
else
	cp ${pdir}/termux-file-opener ${dir} && chmod +x ${file}

if [ -d ${cdir} ]; then
	if [ -f ${cfile}]; then
		mv ${cfille} ${cfile}.bak && cp ${pdir}/config ${cfile}
	else
		cp ${pdir}/config ${cfile}
	fi
else
	mkdir -p  ${cdir} && cp ${pdir}/config ${cfile}
fi
}

install_pkgs
setup_tuo
