set nocompatible             

call pathogen#infect()
syntax on
filetype on                    " enable filetype detection
filetype plugin indent on

" -------------------------------
"  opções
" -------------------------------
set wrap                 " wrap long lines
set autoindent           " indent at the same level of the previous line

set tabstop=4
set shiftwidth=2	" when reindenting how far?
set softtabstop=2
set expandtab
set backspace=2 	" allow backspacing over everything in insert mode

set hidden

set hlsearch " highlight search
set incsearch
set ignorecase
set showmatch " show matching parens, etc

set autoread  " load file when it changes
set autowrite " when switching files autosave

set number

" VERA SANS MONO FO LIFE
set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set guioptions-=T " no macvim toolbar

set wildignore+=*.log,*.jpg,*.png,*.gif,*.swp,vendor/rails/**


set visualbell             " shut the fuck up


colorscheme reslate

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


"set smartindent                " Do smart indenting...
"set comments=sO:*-,mO:*,exO:*/,s1:/*,mb:*,ex:*/,f://,b:#,:%,:XCOMM,n:>,fb:-
"set formatoptions+=tcq         " basic formatting of text and comments
"set matchpairs+=<:>            " match, to be used with % 

auto BufNewFile,BufRead [cC]apfile set filetype=ruby
auto BufNewFile,BufRead Gemfile set filetype=ruby
auto BufNewFile,BufRead *.ru set filetype=ruby
auto BufNewFile,BufRead *.erb set filetype=eruby
auto BufNewFile,BufRead *.sc set filetype=scheme

" ----------------------------------
" desplante de mulheres novas
" ----------------------------------

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>1 :NERDTree<CR>
map <Leader>r :exe "CommandT" b:rails_root<CR>
map <Leader>t :CommandT<CR>
map <Leader>tr :CommandTFlush<CR>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
nnoremap ,rails :cd b:rails_root<CR>:pwd<CR>

let g:CommandTMatchWindowAtTop=1

" sane movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

inoremap jj <Esc>

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
