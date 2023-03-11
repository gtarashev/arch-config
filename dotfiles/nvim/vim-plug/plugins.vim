" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
    Plug 'uiiaoo/java-syntax.vim'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Distraction free mode
    Plug 'junegunn/goyo.vim'    
    " something
    Plug 'sheerun/vim-polyglot'    
    " rust extra highlighting
    Plug 'arzg/vim-rust-syntax-ext'    
    Plug 'rust-lang/rust.vim'
    " something
    Plug 'gko/vim-coloresque'
    " neoshippet for snippets
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
call plug#end()
