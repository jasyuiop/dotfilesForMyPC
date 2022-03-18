#!/bin/env zsh
set -uo pipefail

printf "Running keyring update"
sudo pacman -Sy archlinux-keyring

printf "Running pacman update...\n"
sudo pacman -Syu;

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
journalctl --vacuum-time=7d
printf "After journal\n"
journalctl --disk-usage
