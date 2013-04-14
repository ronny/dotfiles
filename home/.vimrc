"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle-based .vimrc. Order matters.
" Install vundle first: https://github.com/gmarik/vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Essentials
Bundle 'tpope/vim-sensible'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'msanders/snipmate.vim'
Bundle 'majutsushi/tagbar'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-endwise'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ronny/rspec.vim'
Bundle 'jQuery'
Bundle 'lastpos.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-characterize'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'mileszs/ack.vim'
Bundle 'indenthtml.vim'
Bundle 'scrooloose/syntastic'
Bundle 'bufkill.vim'
Bundle 'nathanaelkane/vim-command-w'
Bundle 'CSSMinister'
Bundle 'loremipsum'
Bundle 'exu/pgsql.vim'
Bundle 'VimClojure'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'

" Snippets
Bundle 'ronny/scss-snippets.vim'

" Colour scheme
Bundle 'ronny/birds-of-paradise.vim'

filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variables
"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:ctrlp_tabpage_position = 'al'

"let g:syntastic_ruby_exec = $HOME.'/.rvm/bin/ruby'
let g:syntastic_ruby_exec = $HOME.'/.rbenv/shims/ruby'
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '×'
let g:syntastic_warning_symbol = '!'
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_loc_list = 0

let g:gitgutter_enabled = 0

let NERDTreeIgnore = ['\.pyc$', '^tags$']
"let NERDTreeShowBookmarks = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colour schemes

set background=dark
colorscheme birds-of-paradise

" 'Transparent' gutter background
highlight clear SignColumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Others

set diffopt=filler,iwhite
set noerrorbells
set visualbell
set number
set mouse=a

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set foldmethod=indent
set nofoldenable
set foldnestmax=10
set foldlevel=99

set hlsearch

"set formatprg=par\ -w78j

" where to put swap files
set dir=~/.vim/swapfiles,~/.vim/backups
set backup
set backupdir=~/.vim/backups
set undofile
set undodir=~/.vim/undofiles

set wildignore+=*/tmp/*,*.pyc,*.swp,*.zip,*.so


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings

if has('gui_running')
  map  <D-t> :CtrlPMixed<CR>
  map  <D-r> :FufBufferTag<CR>
else
  map  <Leader>t :CtrlPMixed<CR>
  map  <Leader>r :FufBufferTag<CR>
endif
nmap <Leader>n  <plug>NERDTreeTabsToggle<CR> 
nmap <Leader>nr <plug>NERDTreeFind<CR> 
nmap <Leader>b :TagbarToggle<CR>
map <Leader>gg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nmap <PageUp> <C-b>
nmap <PageDown> <C-f>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto commands

" Remove trailing whitespaces on save
autocmd FileType ruby,py,haml,html,scss,css,erb,js,coffee autocmd BufWritePre <buffer> :%s/\s\+$//e
