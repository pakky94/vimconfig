if !exists('g:vscode')
    set runtimepath^=~/dotfiles/vim runtimepath+=~/dotfiles/vim/after
    let &packpath = &runtimepath
    source ~/dotfiles/vim/vimrc
endif
