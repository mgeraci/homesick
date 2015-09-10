" load pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" allow syntax highlighting, filetype plugins, and indenting
syntax on
filetype plugin on
filetype indent on
set autoindent

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

" theme and font
" irblack theme: https://github.com/wgibbs/vim-irblack
set t_Co=256
set background=dark
colorscheme ir_black
syntax on
syntax enable
" set the font in iterm preferences, but this would be for guis
"set guifont=Droid_Sans_Mono_for_Powerline:h13

" powerline: use patched font
let g:Powerline_symbols = 'fancy'

" powerline: always show statusline
set laststatus=2

" tab indetation - use tabs, display as 2 columns
" (good overview: http://tedlogan.com/techblog3.html)
:set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" remap escape key to delete, handy on kinesis advantage
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

" remap ; to : in normal mode to stop hitting shift
noremap ; :

" do not use the fkeys I use for itunes
imap <F9> <nop>
imap <F10> <nop>
imap <F11> <nop>

let mapleader = ','

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

" ctrl-p settings
set wildmenu
set wildmode=list:longest,list:full

" filetypes to ignore for ctrl-p
set wildignore+=*.un~,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,*/tmp/cache/*,*.swp,*.pyc,CACHE/*,*/CACHE/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|sql)$',
  \ }
let g:ctrlp_working_path_mode = 'a'

" ctrl-p settings for git projects
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" No beeping
set noerrorbells
set novisualbell

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q


" Move text around (indent and outdent, bubbling)
" using y-u-i-o (similar to h-j-k-l but up a row)
"""""""""""""""""""""""""""""""""""""""""""""""""

" indenting and outdenting while keeping the
" original selection in visual mode
vmap <C-O> >gv
vmap <C-Y> <gv

nmap <C-O> >>
nmap <C-Y> <<

omap <C-O> >>
omap <C-Y> <<

imap <C-O> <Esc>>>i
imap <C-Y> <Esc><<i

" Text bubbling
" Bubble single lines
nmap <C-U> ]e
nmap <C-I> [e

" Bubble multiple lines
vmap <C-U> ]egv
vmap <C-I> [egv


" disable autowrapping and column breaks
set nowrap
set tw=0

" list disables linebreak
set nolist

" fugitive github domain
let g:fugitive_github_domains = ['https://github.com']

" highlight search
set hlsearch

" line numbers
set number

" move vim's temporary files
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swp//

" undo files
set undofile
set undodir=~/.vim/tmp/undo//

" case for search
set ignorecase
set smartcase


"" Syntax highlighting for odd file types

" syntax highlighting for hamstache files
" just set as haml
au Bufread,BufNewFile *.hamstache set filetype=haml

" syntax highlighting for toffee files
" just set as coffee
"au Bufread,BufNewFile *.toffee set filetype=coffee
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

" load okcupid settings
set rtp+=/home/u1/share/vim
