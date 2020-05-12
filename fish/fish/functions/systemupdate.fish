function systemupdate
    yay -Syu --noconfirm
    flatpak update -y
    omf update
    nvim +PlugUpdate +PlugClean +PlugUpdate +UpdateRemotePlugins +qall
end
