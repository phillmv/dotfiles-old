set nocompatible

call pathogen#infect()
syntax on
filetype on               " enable filetype detection
filetype plugin indent on

" -------------------------------
"  opções
" -------------------------------
set wrap                  " wrap long lines
set autoindent            " indent at the same level of the previous line

set tabstop=4
set shiftwidth=2          " when reindenting how far?
set softtabstop=2
set expandtab
set backspace=2           " allow backspacing over everything in insert mode

" Searching
set hlsearch              " highlight search
set incsearch
set ignorecase    
set smartcase             " ... unless they contain at least one capital letter
set showmatch             " show matching parens, etc

set autoread              " load file when it changes
" no hidden, no autowrite
" everything buffer wise that happens is 'intentional'

set number
set ruler
set visualbell            " shut the fuck up

" VERA SANS MONO FO LIFE
set guifont=Bitstream\ Vera\ Sans\ Mono:h12
set guioptions-=T         " no macvim toolbar

set wildignore+=*.log,*.jpg,*.png,*.gif,*.swp,vendor/rails/**
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

colorscheme reslate

if has('cmdline_info')
    set ruler             " show the ruler
    " a ruler on steroids
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd           " show partial commands in status line and
                          " selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2     
    " a statusline, also on steroids
    set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P[%b]
endif

if has("gui_macvim") && has("gui_running")
    set macmeta           " Necessary for using meta key in mappings on OSX
    let macvim_skip_cmd_opt_movement = 1 " Prevent MacVim from mapping fake HOME/END to M-arrow keys.
    let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
    

    " alas I am still a fan of the SYSTEM WIDE DEFAULT OS BEHAVIOUR
    map <D-right> $
    map <D-left> 0
    imap <D-right> <Esc>$a
    imap <D-left> <Esc>0i

    imap <M-left> <Esc>Bi
    imap <M-right> <Esc>lWi
    imap <M-backspace> <Esc>B"_dwi

    " taken from janus:

    " Map command-[ and command-] to indenting or outdenting
    " while keeping the original selection in visual mode
    vmap <D-]> >gv
    vmap <D-[> <gv

    nmap <D-]> >>
    nmap <D-[> <<

    omap <D-]> >>
    omap <D-[> <<

    imap <D-]> <Esc>>>i
    imap <D-[> <Esc><<i

    " Bubble single lines
    nmap <D-Up> [e
    nmap <D-Down> ]e
    nmap <D-k> [e
    nmap <D-j> ]e

    " Bubble multiple lines
    vmap <D-Up> [egv
    vmap <D-Down> ]egv
    vmap <D-k> [egv
    vmap <D-j> ]egv


    " allow for switching between tabs
    map  <D-0> 0gt
    imap <D-0> <Esc>0gt
    map  <D-1> 1gt
    imap <D-1> <Esc>1gt
    map  <D-2> 2gt
    imap <D-2> <Esc>2gt
    map  <D-3> 3gt
    imap <D-3> <Esc>3gt
    map  <D-4> 4gt
    imap <D-4> <Esc>4gt
    map  <D-5> 5gt
    imap <D-5> <Esc>5gt
    map  <D-6> 6gt
    imap <D-6> <Esc>6gt
    map  <D-7> 7gt
    imap <D-7> <Esc>7gt
    map  <D-8> 8gt
    imap <D-8> <Esc>8gt
    map  <D-9> 9gt
    imap <D-9> <Esc>9gt

    " NERDCommenter
    vmap <D-">  <Plug>NERDCommenterAlignBoth
    vmap <D-\>  <Plug>NERDCommenterToggle
    nmap <D-\>  <Plug>NERDCommenterToggle

  else

    " Map command-[ and command-] to indenting or outdenting
    " while keeping the original selection in visual mode
    vmap <A-]> >gv
    vmap <A-[> <gv

    nmap <A-]> >>
    nmap <A-[> <<

    omap <A-]> >>
    omap <A-[> <<

    imap <A-]> <Esc>>>i
    imap <A-[> <Esc><<i

    " Bubble single lines
    nmap <C-Up> [e
    nmap <C-Down> ]e
    nmap <C-k> [e
    nmap <C-j> ]e

    " Bubble multiple lines
    vmap <C-Up> [egv
    vmap <C-Down> ]egv
    vmap <C-k> [egv
    vmap <C-j> ]egv

    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>

    " Map Control-# to switch tabs
    map  <C-0> 0gt
    imap <C-0> <Esc>0gt
    map  <C-1> 1gt
    imap <C-1> <Esc>1gt
    map  <C-2> 2gt
    imap <C-2> <Esc>2gt
    map  <C-3> 3gt
    imap <C-3> <Esc>3gt
    map  <C-4> 4gt
    imap <C-4> <Esc>4gt
    map  <C-5> 5gt
    imap <C-5> <Esc>5gt
    map  <C-6> 6gt
    imap <C-6> <Esc>6gt
    map  <C-7> 7gt
    imap <C-7> <Esc>7gt
    map  <C-8> 8gt
    imap <C-8> <Esc>8gt
    map  <C-9> 9gt
    imap <C-9> <Esc>9gt
endif

" Common file types.
auto BufNewFile,BufRead [cC]apfile set filetype=ruby
auto BufNewFile,BufRead Gemfile set filetype=ruby
auto BufNewFile,BufRead *.ru set filetype=ruby
auto BufNewFile,BufRead *.erb set filetype=eruby
auto BufNewFile,BufRead *.sc set filetype=scheme
auto BufNewFile,BufRead *.json set ft=javascript
au FileType make set noexpandtab


" ----------------------------------
" MAPPINGS
" ----------------------------------

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>1 :NERDTree<CR>

" make commandT go from the root project folder
map <Leader>r :exe "CommandT" b:rails_root<CR>
map <Leader>t :CommandT<CR>
map <Leader>tr :CommandTFlush<CR>

" Dealing with splits - thanks, Andrey
map <M-right> <C-w>l
map <M-left> <C-w>h
map <M-down> <C-w>j
map <M-up> <C-w>k

map <M-,> :split<CR> " Horizontal split
map <M-.> :vsplit<CR> " Vertical split
map <M-/> :close<CR> 

map <M-<> <C-w>K " Convert vertical to horizontal split
map <M->> <C-w>L " Convert horizontal to vertical split

""" Buffers
map <M-]> :bnext<CR>
map <M-[> :bprev<CR>
map <M-backspace> :bdelete<CR>


nnoremap <leader>rails :cd b:rails_root<CR>:pwd<CR>

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
vmap <left> h
vmap <right> l

inoremap jj <Esc>

" also taken from Janus:
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" upper/lower word
" selection reversed from Janus
nmap <leader>U mQviwU`Q
nmap <leader>L mQviwu`Q

" upper/lower first char of word
nmap <leader>u mQgewvU`Q
nmap <leader>l mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" -------------------
" MISC FUN
" -------------------

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" set up default nerdtree settings
autocmd vimenter * NERDTree " open by default
autocmd vimenter * if !argc() | NERDTree | endif " open even if no files are selected
autocmd VimEnter * wincmd p     " set focus on opened buffer and not nerdtree
" quit when nerdtree is the last buffer standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
