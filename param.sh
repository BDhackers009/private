#!/bin/bash

prog="bugH"
# Tool List #
tool_list() {
tools=("nmap","sqlmap","dirb","rustscan")}

#### TOOLS ####
nmap() {
if [ "$(command -v nmap)" ]; then
	echo "nmap is already installed"
	echo ""
else
	i
	pkg up -y && pkg i nmap -y
fi
}

i() {
clear
echo "installing ${1}..."
slee 1
}
about_bugH() {
echo '''
Tool Description:-

bugH is an all in one bug hunting tool installer for Termux.'''
}
help() {
echo '''
options		description

'${prog}' --help - to show this help messege.

'${prog}' --update - to update the tool. 

'${prog}' --uninstall - to uninstall this tool.

'${prog}' --install - to install a tool.

'${prog}' --list  - to see the list of tools available.

'''
}

if [[ "${1}" = "--help" ]]; then
	help
else
	echo " "
fi

if [[ "${1}" = "" ]]; then
	echo "please provide an argument with ${prog}"
	about_bugH
	help
else
	echo ""
fi
