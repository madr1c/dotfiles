" ==============
" vim configuration
" ==============

" Vundle setup
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
" Restart vim after saving your .vimrc and execute
" :PluginInstall
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'

call vundle#end()

" Filetype detection
filetype plugin indent on
" Display commands at the bottom of the screen
set showcmd

" Syntastic configuration
let g:syntastic_javascript_checkers = ['jshint']

" Syntax highlighting
syntax on

" Solarized theme
" Make sure your termimal supports the colors
" You could use the Solarized theme for iTerm 2 on OS X, for example
set background=light
colorscheme solarized

" Automatic indentation 
set smartindent

" Tab width: four characters
set shiftwidth=4
set tabstop=4

" Spaces are better than tabs
set expandtab

" Smart identation
set smarttab

" Line numbers and length
set number
set nowrap      " Do not wrap on load
set fo-=t       " Do not wrap when typing

" Instead of using colorcolumn and textwidth
" we use this little snippet
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" Remap arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>
noremap <Left> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>

" Make split switching easier
noremap <C-j> <C-W><C-J>
noremap <C-h> <C-W><C-H>
noremap <C-k> <C-W><C-K>
noremap <C-l> <C-W><C-L>

" Utility mappings
noremap gh mg0i//<Esc>`g        " Press gh to comment line with //
noremap gj :s;//*;;<Return>     " Press gj to remove comments

" Status line
set laststatus=2
" File name
set statusline=%f
" File type
set statusline+=\ %y
" Modified flag
set statusline+=%m
" Separator
set statusline+=%=
" Percentage
set statusline+=%p%%\ 
" Line numbers
set statusline+=%L
set statusline+=L\ 
" Column
set statusline+=\[%3c\]
" Git branch
set statusline+=\ %{fugitive#statusline()}

" Show diff for unsaved changes
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()


" Make backspace very awesome
set backspace=2
