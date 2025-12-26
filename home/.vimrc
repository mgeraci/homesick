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

" ensure that syntax highlightin always reads from the start of a file (this
" fixes syntax highlighting breaking when jumping around large files,
" specifically in pub)
autocmd BufEnter * :syntax sync fromstart

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

" no folding by default
set foldlevel=99

" allow backspace in all contexts
set backspace=indent,eol,start

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" remember info about open buffers on close (required for "return to last edit
" position")
set viminfo^=%


""""""""""""""""""
" Theme and font "
""""""""""""""""""

" irblack theme: https://github.com/wgibbs/vim-irblack
set t_Co=256
set background=dark
colorscheme ir_black

" I set the font in iterm preferences, but this would be for guis like MacVim
"set guifont=Droid_Sans_Mono_for_Powerline:h13


""""""""""""
" NerdTree "
""""""""""""

" explicity set the nerdtree delimiter to a non-breaking space
"let g:NERDTreeNodeDelimiter = "\u00a0"


"""""""""""
" Airline "
"""""""""""

" use patched font
let g:airline_powerline_fonts=1

" show the status line, even when you only have one split open
set laststatus=2

" customization instructions:
" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt

" remove some sections that I don't use
let g:airline_section_b='' "(hunks, branch)
let g:airline_section_y='' "(fileencoding, fileformat)
let g:airline_section_error='' "(ycm_error_count, syntastic, eclim)
let g:airline_section_warning='' "(ycm_warning_count, whitespace)

" customize some of the fancy characters
let g:airline_symbols = {}
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''

" disable this particular airline extension, which was erroring out on start
let g:airline#extensions#vista#enabled = 0


""""""""
" Tabs "
""""""""

" I switched to using tpope's vim-sleuth for auto-defining tab/space settings
" based on the file. but here's what I used to do:
"
" use tabs, display as 2 columns. a good overview of these settings:
" http://tedlogan.com/techblog3.html

" tab size
:set tabstop=2

" help backspace/delete figure out which spaces are tabs
" :set softtabstop=2
"
" indent/outdent size
" :set shiftwidth=2
"
" do not convert tabs to spaces
" :set noexpandtab


"""""""""""""
" Searching "
"""""""""""""

" highlight search
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Black
hi Search cterm=None

" case for search: ignore the case, unless you have something capitalized in
" your query
set ignorecase
set smartcase

" Damian Conway's 'Die Blinkënmatchen': blink the background of a search term
" when the cursor gets to it
nnoremap <silent> n n:call HLNext(0.2)<cr>
nnoremap <silent> N N:call HLNext(0.2)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction


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

map <leader>n  :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>p  :set paste<cr>
map <leader>np :set nopaste<cr>
map <leader>r  :redraw!<cr>
map <leader>ct :checktime<cr>

" copy to system pasteboard (extra cr dismisses the 'enter to continue')
map <leader>c  :w !pbcopy<cr><cr>

" leader-b toggles 80-column highlight
noremap <leader>b :execute "set colorcolumn=".(&colorcolumn != 80 ? 80 : 0)<cr>

" comment shortcut
map <C-C> <Leader>ci

" add spaces after comment
let g:NERDSpaceDelims = 1

" upper/lower first char of word
nmap <leader>u mQgewvU`Q
nmap <leader>l mQgewvu`Q

" upper/lower word
nmap <leader>U mQviwU`Q
nmap <leader>L mQviwu`Q


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


""""""""""""""""""""""""""""""""""""
" Ignore files for indexing/ctrl-p "
""""""""""""""""""""""""""""""""""""

" Ignore compiled files
set wildignore+=*.o,*.class,*.rbc,*.pyc

" Ignore version control directories
set wildignore+=.git,.svn,.hg

" Ignore temp/cached files
set wildignore+=*/.swp,*.swp,*.un~,vendor/gems/*,*/tmp/cache/*,CACHE/*,*/CACHE/*
set wildignore+=*/.tmp/*,.happypack/*,.happypack,*.happypack/*

" Ignore node modules
set wildignore+=node_modules/

" Ignore backups
set wildignore+=backups


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


""""""""""""""""
" Multi-Cursor "
""""""""""""""""

let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-m>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


"""""""""""""""""""""""
" Syntax highlighting "
"""""""""""""""""""""""

" hamstache files: just set to haml
au Bufread,BufNewFile *.hamstache set filetype=haml

" toffee files
autocmd BufNewFile,BufRead *.toffee set filetype=toffee

" arduino
au BufNewFile,BufRead *.ino set ft=c

" scad 3d models
au BufNewFile,BufRead *.scad set ft=c
au BufNewFile,BufRead *.scad set ft=c

" okcupid c++ template files
au BufNewFile,BufRead *.T set ft=c

" allow JSX highlighting in files with just a `.js` extension
let g:jsx_ext_required = 0


""""""""""""
" Prettier "
""""""""""""

" let prettier run on files that have the `@format` header
let g:prettier#autoformat = 1

" let prettier run on files without the `@format` header
let g:prettier#autoformat_require_pragma = 0

" only run prettier in repos where a config file is found
let g:prettier#autoformat_config_present = 1


"""""""
" Coc "
"""""""

let g:coc_global_extensions = ['coc-tsserver']

" background of the floating documentation window
:highlight CocFloating ctermbg=Black

" fixes
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>af  <Plug>(coc-fix-current)

" navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next
