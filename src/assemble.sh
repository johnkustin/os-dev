#!/usr/bin/zsh

name="$(echo $1 | cut -d'.' -f1)"

nasm $1 -f bin -o $name.bin
