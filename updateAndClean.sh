#!/bin/env zsh
set -uo pipefail

printf "Running reflector for best mirrors\n"
sudo reflector -p https -c Germany -a 12 -l 10 --sort rate --save /etc/pacman.d/mirrorlist

printf "Running keyring update\n"
sudo pacman -Sy archlinux-keyring

printf "Running pacman update...\n"
sudo paru -Syu;

printf "Removing orphans...\\n"
sudo pacman -Rns $(pacman -Qtdq)

sudo pacdiff

printf "Cleaning up pacman cache...\\n"
sudo pacman -Sc
printf "Done\\n\\n"

printf "Cleaning journal..\n"
printf "Before journal\n"
journalctl --disk-usage
printf "Cleaning\n”"
sudo journalctl --vacuum-time=7d
printf "After journal\n"
journalctl --disk-usage
