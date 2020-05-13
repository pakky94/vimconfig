#!/bin/bash
# Avoids getting multiple password requests for sudo
trap "exit" INT TERM; trap "kill 0" EXIT; sudo -v || exit $?; sleep 1; while true; do sleep 60; sudo -nv; done 2>/dev/null &

yay -Syu --noconfirm
flatpak update -y
fish -c "omf update"
nvim +PlugUpdate +PlugClean +PlugUpdate +UpdateRemotePlugins +qall
