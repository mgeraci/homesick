" load in pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

" reload vimrcwhen you save it
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au! BufWritePost .vimrc source %

  " enable autosave
  au FocusLost * silent! wa

  " remove trailing whitespace
  au BufWritePre * :%s/\s\+$//e
endif


" theme and font
" irblack theme: https://github.com/wgibbs/vim-irblack
:colorscheme ir_black
set guifont=Droid_Sans_Mono:h13

" powerline
" use patched font
let g:Powerline_symbols = 'fancy'
" always show statusline
set laststatus=2

" tab indetation
set expandtab
set shiftwidth=2
set softtabstop=2

" remap escape key to delete
vnoremap <Del> <esc>
noremap! <Del> <esc>

" jumping splits
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
imap <C-h> <esc><C-w>h
imap <C-l> <esc><C-w>l
imap <C-j> <esc><C-w>j
imap <C-k> <esc><C-w>k

" remap ; to : in normal mode
noremap ; :

" do not use the fkeys I use for itunes
imap <F9> <nop>
imap <F10> <nop>
imap <F11> <nop>

let mapleader = ','

map <Leader>g :Gstatus<cr>
map <Leader>n :NERDTreeToggle<cr>

" textmate-style comment shortcut
map <C-C> <Leader>ci

" ignore for ctrl-p
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.un~,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/tmp/cache/*

" No beeping
set noerrorbells
set novisualbell

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" indenting or outdenting
" while keeping the original selection in visual mode
vmap <leader>. >gv
vmap <leader>m <gv

nmap <leader>. >>
nmap <leader>m <<

omap <leader>. >>
omap <leader>m <<

imap <leader>. <Esc>>>i
imap <leader>m <Esc><<i

" Text bubbling
" Bubble single lines
nmap <leader>k [e
nmap <leader>j ]e

" Bubble multiple lines
vmap <leader>k [egv
vmap <leader>j ]egv

" disable autowrapping and column breaks
set nowrap
set tw=0

" list disables linebreak
set nolist

" syntax highlighting for hamstache files
" just set as haml
au Bufread,BufNewFile *.hamstache set filetype=haml

" fugitive github domain
let g:fugitive_github_domains = ['https://github.com']
