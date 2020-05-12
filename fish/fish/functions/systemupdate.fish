function systemupdate
    yay -Syu --noconfirm
    flatpak update -y
    omf update
    nvim +PlugUpdate +PlugClean +UpdateRemotePlugins +qall
end
