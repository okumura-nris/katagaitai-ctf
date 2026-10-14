#!/bin/bash

export PIP_BREAK_SYSTEM_PACKAGES=1

# 必要なパッケージのインストール
sudo apt update
sudo apt update && sudo apt install -y python3 python3-pip git docker.io docker-compose
sudo apt install -y python3 gdb python3-pip openjdk-25-jdk unzip

# Ghidraのインストール
echo "[*]install ghidra"
GHIDRA_URL="https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_12.1.4_build/ghidra_12.1.4_PUBLIC_20260921.zip"
wget $GHIDRA_URL -O ghidra.zip
unzip ghidra.zip -d ~
rm ghidra.zip
echo 'export PATH="$PATH:$HOME/ghidra_12.1.4_PUBLIC"' >> ~/.bashrc

# pwntools
echo "[*] install pwntools"
pip3 install pwntools

# ROPgadget
echo "[*] install ROPgadget"
pip3 install ROPgadget

# Gef（uv版インストーラ。一般ユーザー用に ~/.gef へインストールされる。）
echo "[*] install GEF"
wget -qO- https://raw.githubusercontent.com/bata24/gef/dev/install-uv.sh | sh

# QEMU
echo "[*] install QEMU"
sudo apt install -y qemu-system

# PyCryptodome
pip3 install pycryptodome

# Gmpy2
sudo apt install -y libgmp-dev libmpfr-dev libmpc-dev
pip3 install gmpy2

echo "[*] Done!"
