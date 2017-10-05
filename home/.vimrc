set nocompatible

call pathogen#infect()
syntax on
filetype on               " enable filetype detection
filetype plugin indent on
" set omnifunc=syntaxcomplete#Complete
set encoding=utf-8

" -------------------------------
"  vim options
" -------------------------------
set wrap                  " wrap long lines
set autoindent            " indent at the same level of the previous line

set tabstop=2
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


set wildignore+=*.log,*.jpg,*.png,*.gif,*.swp,vendor/rails/**
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*.pdf,*.jpg,*.jpeg

" ctags
set tags+=gems.tags
set tags+=stdlib.tags

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.

colorscheme reslate


""
"" STATUS
""

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
    set statusline=%m
    set statusline+=%t
    set statusline+=%<\ 
    set statusline+=[%{strlen(&ft)?&ft:'none'},
    set statusline+=\ %{strlen(&fenc)?&fenc:'none'},
    set statusline+=\ %{&ff}]
    set statusline+=%=
    set statusline+=:\b%n
    set statusline+=%{fugitive#statusline()}
    set statusline+=%r%w\ %l,%c%V\ [%b,0x%-8B]
    set statusline+=%P
endif

""
"" KEY BINDINGS
""

" I forget. I think this changes the mode macvim goes into
" when you select text with the mouse. (I want visual)
set selectmode=
imap <S-up> <Esc>vk
imap <S-down> <Esc>vj
imap <S-left> <Esc>vh
imap <S-right> <Esc>vl

map <S-up> <Esc>vk
map <S-down> <Esc>vj
map <S-left> <Esc>vh
map <S-right> <Esc>vl

vmap <S-up> k
vmap <S-down> j
vmap <S-left> h
vmap <S-right> l


if has("gui_macvim") && has("gui_running")

    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
    " VERA SANS MONO FO LIFE
    set guifont=Bitstream\ Vera\ Sans\ Mono:h12
    set guioptions-=T         " no macvim toolbar

    set macmeta           " Necessary for using meta key in mappings on OSX
    let macvim_skip_cmd_opt_movement = 1 " Prevent MacVim from mapping fake HOME/END to M-arrow keys.
    "let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys


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

    " TComment

    nmap <D-'>  :TComment<CR>
    vmap <D-'>  :TComment<CR>
    imap <D-'>  <Esc>:TComment<CR>a
    " vmap <D-">  <Plug>NERDCommenterAlignBoth gv
    " vmap <D-\>  <Plug>NERDCommenterToggle gv
    " nmap <D-\>  <Plug>NERDCommenterToggle

  else

    " I almost never use vim in terminal mode, so this is kind 
    " of broken, alas. Should try to match it up with the above.
    "
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



" ----------------------------------
" MAPPINGS
" ----------------------------------
 " C-i goes 'forwards'
 " C-o goes 'backwards'
 " leader-p brigns up ctags search
map <C-}> <C-w><C-]>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <Leader>1 :NERDTreeFind<CR>
map <Leader>! :NERDTreeToggle<CR>


" Dealing with splits - thanks, Andrey
map <M-right> <C-w>l
map <M-left> <C-w>h
map <M-down> <C-w>j
map <M-up> <C-w>k

map <M-,> :split<CR><C-w>j " Horizontal split
map <M-.> :vsplit<CR><C-w>l " Vertical split
map <M-/> :close<CR> 

map <M-<> <C-w>K " Convert vertical to horizontal split
map <M->> <C-w>L " Convert horizontal to vertical split

""" Buffers
map <M-]> :bnext<CR>
map <M-[> :bprev<CR>
map <M-backspace> :bdelete<CR>

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
" Retain visual select when indenting
vmap > >gv 
vmap < <gv

inoremap jj <Esc>

" also taken from Janus:
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" upper/lower word
" selection reversed from Janus
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" " upper/lower first char of word
" nmap <leader>u mQgewvU`Q
" nmap <leader>l mQgewvu`Q

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
" open files from wd of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" map :etruby :tabe<bar>:set filetype=ruby 

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Underline the current line with '='
nmap <silent> <leader>ul :t.\|s/./=/g\|:nohls<cr>

" set text wrapping toggles
" nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>



""
"" HANDLING FILES
""
" ruby {
  auto BufNewFile,BufRead [cC]apfile set filetype=ruby
  auto BufNewFile,BufRead Gemfile* set filetype=ruby
  auto BufNewFile,BufRead Vagrantfile set filetype=ruby
  auto BufNewFile,BufRead Cheffile set filetype=ruby
  auto BufNewFile,BufRead *.ru set filetype=ruby
  auto BufNewFile,BufRead *.erb set filetype=eruby

  "lol assert pipeline
  autocmd BufNewFile,BufRead *.jsx.erb let b:jsx_ext_found = 1
  autocmd BufNewFile,BufRead *.jsx.erb set filetype=javascript

  "autocomplete pls?
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  au FileType ruby nmap <Leader>i :vsplit<CR> <C-w><C-l><C-]>
  au FileType ruby nmap <Leader>I <C-]>
 
" }


" golang {
  auto BufNewFile,BufRead *.go set ft=go
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>s <Plug>(go-implements)

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>c <Plug>(go-test)
  " au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  "If you change the command used by :GoFmt to goimports, it will also manage your imports (e.g., by inserting the missing “fmt” import in the above example):
  let g:go_fmt_command = "goimports"

  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1

" }

auto BufNewFile,BufRead *.sc set filetype=scheme
auto BufNewFile,BufRead *.json set ft=javascript
au FileType make set noexpandtab


" add certain tags to html indent
let g:html_indent_inctags="section\|dt"


      
" =======
" PLUGINS
" =======

" ctrlp {
    let g:ctrlp_match_window = 'top'
    let g:ctrlp_cmd = 'CtrlPMixed' " Search all the things.
    let g:ctrlp_working_path_mode = '' " disabled 
    let g:ctrlp_lazy_update = 1
    let g:ctrlp_mruf_max = 25
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\.exe$\|\.so$\|\.dll$' }

    let g:ctrlp_user_command = {
        \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
        \ 'fallback': 'find %s -type f'
    \ }
    " Reuse already-open buffers? (Default: 'Et')
    let g:ctrlp_switch_buffer = 100
    let g:ctrlp_reuse_window = 'NERD'

    nnoremap <silent> <leader>t :CtrlP<CR>
    nnoremap <silent> <leader>r :CtrlPClearCache<CR>
    "Ctags integration
    nnoremap <leader>] :CtrlPTag<cr> 
"}

" rainbow parens {
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }

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
"autocmd vimenter * NERDTree " open by default
"autocmd vimenter * if !argc() | NERDTree | endif " open even if no files are selected
" autocmd VimEnter * wincmd p     " set focus on opened buffer and not nerdtree
" quit when nerdtree is the last buffer standing
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <Leader>U :UndotreeToggle<cr>
