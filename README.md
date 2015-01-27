#Install
    touch ~/.vimrc

    git clone git://github.com/vestimir/vim.git ~/.vim
    ln -s ~/.vim/.vimrc ~/.vimrc

    cd ./vim
    git submodule init
    git submodule update

You can update all the submodules to their latest version with `git pull --recurse-submodules`

#NeoVim

Just `ln -s` .vimrc to .nvimrc and .vim to .nvim

#Dependencies
[Ctags](http://ctags.sourceforge.net/)

On Mac: `brew install ctags`

On Fedora: `yum install ctags`
