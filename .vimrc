" utf8 encoding¬
set encoding=utf-8

" vi sucks
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Shougo/neocomplcache'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'honza/dockerfile.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
call vundle#end()

" turn filetype stuff on
filetype plugin indent on

" syntax highlighting
syntax enable

" read man pages in vim using :Man
runtime! ftplugin/man.vim

" solarized
silent! colorscheme solarized
set background=dark
set t_Co=16

" use the mouse
set mouse=a

" better mouse support
if has("mouse_sgr")
    set ttymouse=sgr " supports clicking past the 220th column
else
    set ttymouse=xterm2
end

" use git
set nobackup
set noswapfile

" highlight search terms
set hlsearch

" use incremental search
set incsearch

" shows matching parens
set showmatch

" line numbers
set number

" highlights the 81st column
set colorcolumn=81

" i dont use modelines
set modelines=0
set nomodeline

" line wrapping is not really that useful for coding
set nowrap

" turn on invisible characters
set list

" set the characters to use for invisible characters
set listchars=tab:▸\ ,eol:¬

" highlight whitespace at eol
highlight ExtraWhitespace ctermbg=1
match ExtraWhitespace /\s\+$/

" always shows the status bar
set laststatus=2

" ctrl-s to save files
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" always show git gutter
let g:gitgutter_sign_column_always = 1

" insert mode changes cursor
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" better ctrl+p support
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_map = '<c-h>'

" backspace everywhere
set backspace=2

" mnemonic fugitive interface via ctrl-g
nnoremap <C-G>b :Gbrowse<CR>
nnoremap <C-G>s :Gstatus<CR>
nnoremap <C-G>c :Gcommit<CR>
nnoremap <C-G>d :Gdiff<CR>
nnoremap <C-G>l :Glog<CR>

" gitcommit to be 100% bottom horizontal and with window height at last line
autocmd FileType gitcommit wincmd J
autocmd FileType gitcommit execute line('$') 'wincmd _'
