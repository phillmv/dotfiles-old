set nocompatible               " VIM extensions, not very VI compatible;
                               "   this setting must be set because when vim
                               "   finds a .vimrc on startup, it will set
                               "   itself as "compatible" with vi

if has("syntax")
	syntax on
endif

map  BdW
imap  BdWi 

if has('cmdline_info')
    set ruler                  " show the ruler
    " a ruler on steroids
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd                " show partial commands in status line and
                               " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=1           " show statusline only if there are > 1 windows
    " a statusline, also on steroids
    set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P
endif

filetype on                    " enable filetype detection
filetype plugin indent on

set wrap                       " wrap long lines
set autoindent                 " indent at the same level of the previous line
"set smartindent                " Do smart indenting...
set shiftwidth=2               " use indents of 2 spaces
set smarttab                   " Smart tabbing, makes backspace be nice.
set comments=sO:*-,mO:*,exO:*/,s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:-
set formatoptions+=tcq         " basic formatting of text and comments
set matchpairs+=<:>            " match, to be used with % 

auto BufNewFile,BufRead *.[CcHh] set cindent expandtab si ai tabstop=4 shiftwidth=4

auto BufNewFile,BufRead *.[js] set cindent expandtab ai tabstop=2 shiftwidth=2

auto BufNewFile,BufRead *.java,*.jsp set expandtab si ai tabstop=4 shiftwidth=4 comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:- sts=4
auto BufNewFile,BufRead *.php set expandtab si ai tabstop=4 shiftwidth=4 comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:-  sts=4
auto BufNewFile,BufRead *.pl,*.py set expandtab si ai tabstop=4 shiftwidth=4 comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:-  sts=4
auto BufNewFile,BufRead *.pyt set filetype=xml
auto BufNewFile,BufRead Scons* set filetype=python
auto BufNewFile,BufRead *.hs set expandtab si ai tabstop=4 shiftwidth=4 sts=4
auto FileType mail set tw=74

auto BufNewFile,BufRead [cC]apfile set filetype=ruby
auto BufNewFile,BufRead Gemfile set filetype=ruby
auto BufNewFile,BufRead *.ru set filetype=ruby
auto BufNewFile,BufRead *.erb set filetype=eruby shiftwidth=4 tabstop=4
auto BufNewFile,BufRead *.sc set filetype=scheme

set showmatch
set autowrite
set backspace=2

colorscheme reslate
set hlsearch
set number

set hidden
set incsearch

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>1 :NERDTree<CR>
map <Leader>r :exe "CommandT" b:rails_root<CR>
map <Leader>t :CommandT<CR>
map <Leader>tr :CommandTFlush<CR>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,rails :cd b:rails_root<CR>:pwd<CR>

set wildignore+=*.log,*.jpg,*.png,*.gif,*.swp,vendor/rails/**
let g:CommandTMatchWindowAtTop=1

set guifont=Bitstream\ Vera\ Sans\ Mono:h12

set guioptions-=T 

nmap <Down> gj
vmap <Down> gj
imap <Down> <C-O>gj

nmap <Up> gk
vmap <Up> gk
imap <Up> <C-O>gk

inoremap jj <Esc>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

