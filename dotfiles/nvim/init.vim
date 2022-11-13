""" General setup 
syntax on
" Fix tabstop
set shiftwidth=4
set nocompatible
filetype plugin on
" have relative numbers, rather than absolute
set relativenumber number
" don't draw when macros are running (faster)
set lazyredraw
" wrap words not characters
set wrap linebreak
set splitbelow splitright

" source vim plug
source $HOME/.config/nvim/vim-plug/plugins.vim 

" NEW SHELL COMMAND (shell output into new window)
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

" GENERAL MAPPINGS
" go to next pointer 
inoremap ;; <Esc>/<++><Enter>"_c4l
" toggle goyo 
map <Space>f :Goyo<CR>
" open terminal
map <Space>t :term<CR>
" use j and k to scroll through soft-wrapped lines
noremap j gj
noremap k gk


" FILETYPE MAPPINGS 

" GROFF (MS) MAPPINGS
" set filetype
autocmd BufRead,BufNewFile *.ms set filetype=groff
" bold
autocmd FileType groff inoremap ;b <Esc>o.B 
" italic
autocmd FileType groff inoremap ;i <Esc>o.I 
" multi-line EQN
autocmd FileType groff inoremap ;e <Esc>o.EQ<Esc>o.EN<Esc>O
" autocompile
autocmd FileType groff noremap <Space>c :!/home/jojito/.config/groff/makegroff.bash %<CR>

" LATEX MAPPINGS
" set the filetype (doesnt do that automatically)
autocmd BufRead,BufNewFile *.tex set filetype=tex
" bold text
autocmd FileType tex inoremap ;b \textbf{}<Space><++><Esc>F{a
" emphatic text
autocmd FileType tex inoremap ;e \emph{}<Space><++><Esc>F{a
" underline
autocmd FileType tex inoremap ;u \underline{}<Space><++><Esc>F{a
" autocompile 
autocmd BufWritePost *.tex :! pdflatex %

" RUST MAPPINGS
" syntax highlighting
syntax enable
filetype plugin indent on
" compile at save
autocmd FileType rust noremap <Space>c :!rustc %<CR>

" JAVA MAPPINGS
" create class
autocmd FileType java inoremap ;c public class {<++>}<Esc>F{i
" compile
autocmd FileType java noremap <Space>c :Shell javac %<CR>

" IMPLEMENTING TEMPLATES
" shell script
autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/skeleton.sh
autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/skeleton.tex
autocmd BufNewFile *.ms 0r ~/.config/nvim/templates/skeleton.ms
" autocmd BufNewFile *.rs 0r ~/.config/nvim/templates/skeleton.rs
