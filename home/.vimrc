""""""""""""
" Pathogen "
""""""""""""

runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()


""""""""""""""""""""""""""""
" Saving and vim internals "
""""""""""""""""""""""""""""

" move vim's temporary files
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swp//

" move vim's undo files
set undofile
set undodir=~/.vim/tmp/undo//

" reload vimrc when you save it
if !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au! BufWritePost .vimrc source %

  " enable autosave
  au FocusLost * silent! wa

  " remove trailing whitespace on save
  au BufWritePre * :%s/\s\+$//e
endif

" save a buffer when focus is lost (switching splits,
" or switching applications if using iTerm2)
autocmd BufLeave,FocusLost * silent! wall

" set the leader key
let mapleader = ','

" remap ; to : in normal mode to stop hitting shift
noremap ; :

" fugitive github domain
let g:fugitive_github_domains = ['https://github.com']


"""""""""""""""""
" Editing style "
"""""""""""""""""

" allow syntax highlighting
syntax on
syntax enable

" figure out file types
filetype plugin on
filetype indent on

" match the indentation level of the previous line
set autoindent

" disable autowrapping and column breaks
set nowrap
set tw=0

" line numbers
set number

" list disables linebreak
set nolist

" no beeping or flashing
set noerrorbells
set novisualbell


""""""""""""""""""
" Theme and font "
""""""""""""""""""

" irblack theme: https://github.com/wgibbs/vim-irblack
set t_Co=256
set background=dark
colorscheme ir_black

" I set the font in iterm preferences, but this would be for guis like MacVim
"set guifont=Droid_Sans_Mono_for_Powerline:h13


"""""""""""""
" Powerline "
"""""""""""""

" powerline: use patched font
let g:Powerline_symbols = 'fancy'

" powerline: always show statusline
set laststatus=2


""""""""
" Tabs "
""""""""

" use tabs, display as 2 columns. a good overview of these settings:
" http://tedlogan.com/techblog3.html

" tab size
:set tabstop=2

" help backspace/delete figure out which spaces are tabs
:set softtabstop=2

" indent/outdent size
:set shiftwidth=2

" do not convert tabs to spaces
:set noexpandtab


"""""""""""""
" Searching "
"""""""""""""

" highlight search
set hlsearch

" case for search: ignore the case, unless you have something capitalized in
" your query
set ignorecase
set smartcase


"""""""""""""
" Shortcuts "
"""""""""""""

" remap escape key to delete, handy on kinesis advantage
vnoremap <Del> <esc>
noremap! <Del> <esc>

" jump splits with ctrl and navigation keys in any mode
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
imap <C-h> <esc><C-w>h
imap <C-l> <esc><C-w>l
imap <C-j> <esc><C-w>j
imap <C-k> <esc><C-w>k

" noop the function keys I use for itunes
imap <F9> <nop>
imap <F10> <nop>
imap <F11> <nop>

map <Leader>g  :Gstatus<cr>
map <Leader>n  :NERDTreeToggle<cr>
map <Leader>nf :NERDTreeFind<cr>
map <Leader>p  :set paste<cr>
map <Leader>np :set nopaste<cr>

" leader-c toggles 80-column highlight
:highlight ColorColumn ctermbg=1
nnoremap <Leader>c :execute "set colorcolumn=".(&colorcolumn != 80 ? 80 : 0)<cr>

" textmate-style comment shortcut
map <C-C> <Leader>ci

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q


""""""""""""""""""""""""""""""""""""
" Ignore files for indexing/ctrl-p "
""""""""""""""""""""""""""""""""""""

" Ignore compiled files
set wildignore+=*.o,*.class,*.rbc,*.pyc

" Ignore version control directories
set wildignore+=.git,.svn,.hg

" Ignore temp/cached files
set wildignore+=*.swp,*.un~,vendor/gems/*,*/tmp/cache/*,CACHE/*,*/CACHE/*

" Ignore backups
set wildignore+=backups


"""""""""""""""""""
" Ctrl-P settings "
"""""""""""""""""""

" general settings
set wildmenu
set wildmode=list:longest,list:full
let g:ctrlp_working_path_mode = 'a'

" settings for git projects
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif


"""""""""""""""
" Moving text "
"""""""""""""""

" Indent, outdent, and bubble using y-u-i-o (think h-j-k-l, but up a row)

" indent and outdent while keeping your selection in visual mode
vmap <C-O> >gv
vmap <C-Y> <gv

nmap <C-O> >>
nmap <C-Y> <<

omap <C-O> >>
omap <C-Y> <<

imap <C-O> <Esc>>>i
imap <C-Y> <Esc><<i

" bubble single lines
nmap <C-U> ]e
nmap <C-I> [e

" bubble multiple lines
vmap <C-U> ]egv
vmap <C-I> [egv


"""""""""""""""""""""""
" Syntax highlighting "
"""""""""""""""""""""""

" hamstache files: just set to haml
au Bufread,BufNewFile *.hamstache set filetype=haml

" toffee files
autocmd BufNewFile,BufRead *.toffee set filetype=toffee

" jinja
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.j2 set ft=jinja

" pub
let fullpath = getcwd() . bufname("%")
if match(fullpath, "okcontent") != -1
	autocmd BufNewFile,BufRead *.email,*.html,*.pub,*.lib,*.dict set filetype=pub
endif

" arduino
au BufNewFile,BufRead *.ino set ft=c


"""""""""""
" Imports "
"""""""""""

" load okcupid settings
set rtp+=/home/u1/share/vim
