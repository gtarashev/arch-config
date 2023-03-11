" -----Set Leader Key-----
let mapleader=" "


" -----Generic Settings-----
syntax on
filetype plugin on

" Use the system clipboard
set clipboard+=unnamedplus

set shiftwidth=4
set relativenumber number
set lazyredraw
set wrap linebreak
set splitbelow splitright


" -----Plugins-----
source $HOME/.config/nvim/vim-plug/plugins.vim 


" -----General Mappings-----
" Go to the next pointer
inoremap ;; <Esc>/<++><Enter>"_c4l

map <leader>f :Goyo<CR>
map <leader>t :term<CR>

" Remap j and k to scroll through "soft-wrapped" lines
noremap j gj
noremap k gk


" -----Basic Autocmd-----
" Vertically center when entering insert mode
autocmd InsertEnter * norm zz


" -----Filetype Settings-----
" Groff (ms)
autocmd BufRead,BufNewfile *.ms set filetype=ms
" bold
autocmd FileType ms inoremap ;b <Esc>o.B
" italic
autocmd FileType ms inoremap ;i <Esc>o.I 
" multi-line EQN
autocmd FileType ms inoremap ;e <Esc>o.EQ<Esc>o.EN<Esc>O
" autocompile
autocmd FileType ms noremap <leader>c :!/home/jojito/.config/groff/makegroff.sh %<CR>

" Latex
autocmd BufRead,BufNewFile *.tex set filetype=tex
" bold 
autocmd FileType tex inoremap ;b \textbf{}<Space><++><Esc>F{a
" emphatic
autocmd FileType tex inoremap ;e \emph{}<Space><++><Esc>F{a
" underline
autocmd FileType tex inoremap ;u \underline{}<Space><++><Esc>F{a
" autocompile on save
autocmd BufWritePost *.tex :! pdflatex %

" Set spell language when needed
autocmd FileType tex,latex,ms setlocal spell spelllang=en_gb


" -----Templates-----
autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/sh
autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/tex
autocmd BufNewFile *.ms 0r ~/.config/nvim/templates/ms
