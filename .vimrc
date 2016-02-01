set nocompatible
filetype off
filetype plugin indent off
set runtimepath+=$GOBIN
set runtimepath+=~/.vim/bundle/dart-vim-plugin

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" start vundle
Plugin 'gmarik/vundle'

" My bundles
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'ervandew/supertab'
Plugin 'sjl/gundo.vim'
Plugin 'reinh/vim-makegreen'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-scripts/Rainbow-Parenthesis'
Plugin 'kien/ctrlp.vim'
Plugin 'benmills/vimux'
Plugin 'vim-scripts/ZoomWin'
Plugin 'vim-scripts/Jinja'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'ap/vim-buftabline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/Align'
Plugin 'godlygeek/tabular'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jceb/vim-orgmode'
Plugin 'mtth/scratch.vim'

" Nerdtree
Plugin 'vim-scripts/The-NERD-tree'

" Multiple Cursors
Plugin 'terryma/vim-multiple-cursors'

" Markdown
Plugin 'tpope/vim-markdown'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter.git'
Plugin 'int3/vim-extradite'

" Language-spec
Plugin 'klen/python-mode'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'robertkluin/vim-handy-highlights'
Plugin 'jeroenbourgois/vim-actionscript'
Plugin 'mxw/vim-jsx'
Plugin 'raichoo/purescript-vim'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'jimenezrick/vimerl'

"Clojure
Plugin 'tpope/vim-classpath'
Plugin 'vim-scripts/paredit.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'

" Less
Plugin 'groenewege/vim-less'

" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Twinside/vim-hoogle'
Plugin 'lukerandall/haskellmode-vim'

"Plugin 'lukerandall/haskellmode-vim'
"Plugin 'dag/vim2hs'

" Rust
Plugin 'wting/rust.vim'


" GOLANG
"Plugin 'dgryski/vim-godef'
"set rtp+=/usr/local/go/misc/vim
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
"nmap <F4> :TagbarToggle<CR>
"" Need to make sure bash_profile as GOROORT set to HOME/go
"" go get -v code.google.com/p/rog-go/exp/cmd/godef
"" go install -v code.google.com/p/rog-go/exp/cmd/godef
"let g:godef_split=0
"let g:godef_same_file_in_same_window=1
Plugin 'fatih/vim-go'
Plugin 'benmills/vimux-golang'

call vundle#end()

filetype plugin indent on

" The basics
syntax on
set showcmd
set hidden
set cursorline
set ruler
set backspace=2
set number
set laststatus=2
set history=1000
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set dictionary=/usr/share/dict/words
set mouse=a

set wildmode=longest:full
set wildmenu

" TABS, SPACING
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set textwidth=80
set colorcolumn=80

" backups
set backup
set noswapfile
set undolevels=999
set undofile
set undoreload=10000
set undodir=/var/tmp/vim/undo//     " undo files
set backupdir=/var/tmp/vim/backup// " backups
set directory=/var/tmp/vim/swap//   " swap files

set hlsearch

set nowrap

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" KEY REMAPPING

" leader
let mapleader = ","
let maplocalleader = "\\"

" Made D behave
nnoremap D d$

" It's 2011.
noremap j gj
noremap k gk

" Destroy infuriating keys
" Fuck you, help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" Fuck you too, manual key.
nnoremap K <nop>

" Stop it, hash key.
inoremap # X<BS>#

" Less chording
map ; :
noremap ;; ;

" Faster Esc
inoremap jj <esc>

" toggle current column highlight shortcut
map <leader>c :set cursorcolumn!<cr>

" Gundo
nnoremap <leader>g :GundoToggle<CR>

" toggle between relative and absolute line numbers.
map <leader>l :exec "set " &nu ? "rnu": "nu"<cr>

" toggle paste mode.
map <leader>e :set paste!<CR>

" toggle spell mode.
map <leader>p :set spell!<cr>


" SEARCHING
" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap / /\v
vnoremap / /\v

" Search for selected word
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Moving around
" quick buffer list
:nnoremap <C-t> :buffers<CR>:buffer<Space>

" Buffer movement.
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprev<CR>

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has("autocmd")
    " Enable file type detection
    filetype on

    " Turn spellcheck on for gitcommit by default.
    autocmd FileType gitcommit set spell

    " mako syntax highlighting
    autocmd BufRead *.mako set filetype=mako

    " haskell
    autocmd BufRead *.hs set filetype=haskell

    " Docker
    autocmd BufRead *.Dockerfile set filetype=sh

    " make jinja, jst, and handlebars templates use html syntax highlighting
    autocmd BufRead *.jinja,*.jst,*.handlebars,*.mustache set filetype=html

    " Set html, coffee, and javascript indent depths to 2-space.
    autocmd FileType coffee,html,javascript,mako.yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

    " Flex syntax highlighting
    autocmd BufRead *.as set filetype=actionscript
    autocmd BufRead *.mxml set filetype=mxml

    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

    " Customisations base on preference
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
    
    " Flex syntax highlighting
    autocmd BufRead *.as set filetype=actionscript
    autocmd BufRead *.mxml set filetype=mxml

    " Clojure
    au BufNewFile,BufRead *.cljs set filetype=clojure
endif

" EDITING"
" **************************************************
"au BufWritePost *.go,*.c,*.cpp,*.h silent! !ctags -R &

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" auto complete
set omnifunc=syntaxcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS noci
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType mustache set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType mako set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType jst set omnifunc=htmlcomplete#CompleteTags noci
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags noci
autocmd FileType c set omnifunc=ccomplete#Completej noci
set completeopt=menuone


" Substitute
nnoremap <leader>s :%s//<left>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" FILE MANAGEMENT
" ***************************************************

" wild menu
set wildignore+=*.py[co]                         " Python byte code

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Make leader leader switch between last 2 buffers
nnoremap <leader><leader> <c-^>

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l


" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" COLOR SCHEME
syntax on
set background=dark
colorscheme mymolokai
set t_Co=256

hi Normal ctermbg=235
hi NonText ctermbg=235
"hi Statement ctermbg=235
hi Visual ctermbg=60
hi StatusLine ctermfg=246 ctermbg=234
hi StatusLineNC ctermfg=238 ctermbg=187
hi Todo ctermfg=30
hi Exception ctermfg=187 ctermbg=235

" highlight groups
hi CursorLine  cterm=NONE ctermbg=236
hi CursorColumn  cterm=NONE ctermbg=236
hi ColorColumn  cterm=NONE ctermbg=232



" ABBREVATIONS AND SPELLING
abbr teh the
abbr nad and
abbr adn and
abbr becasue because
abbr becuase because
abbr taht that
abbr refactor reorganize
abbr prase parse
abbr sefl self
abbr pathc patch
abbr udpate update

" PLUGINS

" Align
" Stop Align plugin from forcing its mappings on us
let g:loaded_AlignMapsPlugin=1
" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align

" Task list
map <leader>td <Plug>TaskList


" Haskell Interrogation {{{

set completeopt+=longest

" Use buffer words as default tab completion
let g:SuperTabDefaultCompletionType = '<c-x><c-p>'

" But provide (neco-ghc) omnicompletion
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1
" Resolve ghcmod base directory
au FileType haskell let g:ghcmod_use_basedir = getcwd()

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
nmap <silent> <leader>hc :SyntasticCheck hdevtools<CR>

" Haskell Lint
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>

" Options for Haskell Syntax Check
let g:syntastic_haskell_hdevtools_args = '-g-Wall'

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle 

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo 

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>

" }}}

" Tags {{{

set tags=tags;/,codex.tags;/

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Generate haskell tags with codex and hscope
map <leader>tg :!codex update --force<CR>:call system("git-hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>

map <leader>tt :TagbarToggle<CR>

set csprg=hscope
set csto=1 " search codex tags first
set cst
set csverb
nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>
" Automatically make cscope connections
function! LoadHscope()
  let db = findfile("hscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/hscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /*.hs call LoadHscope()

" }}}


" Control P
" *****************************************************************************
" *****************************************************************************
"let g:ctrlp_cmd = 'CtrlPMixed'                        " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_working_path_mode = 'r'        " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 0                " show the match window at the top of the screen
"let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 10                                " maxiumum height of match window
"let g:ctrlp_switch_buffer = 'et'                " jump to a file if it's open already
let g:ctrlp_use_caching = 1                                " enable caching
let g:ctrlp_clear_cache_on_exit=1                  " speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250                                 " number of recently opened files
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

" TODO: add javascript and some other languages who doesn't have ctags support
" coffee: https://gist.github.com/michaelglass/5210282
" go: http://stackoverflow.com/a/8236826/462233 
" objc:  http://www.gregsexton.org/2011/04/objective-c-exuberant-ctags-regex/
" rust: https://github.com/mozilla/rust/blob/master/src/etc/ctags.rust
let g:ctrlp_buftag_types = {
\ 'go'                : '--language-force=go --golang-types=ftv',
\ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
\ 'markdown'   : '--language-force=markdown --markdown-types=hik',
\ 'objc'       : '--language-force=objc --objc-types=mpci',
\ 'rc'         : '--language-force=rust --rust-types=fTm'
\ }
" *****************************************************************************
" *****************************************************************************


" Fugitive
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
" set statusline+=%{fugitive#statusline()}\    " Git branch
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


" NERD Tree
map <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
"inoremap <F2> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '.*\.pyc$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 30

" Searching
let g:gitgreprg="grep\\ -n\\ -R\\ --exclude='*.{xml}'"
let g:gitgrepprg="grep\\ -n\\ -R\\ --include='*.py'"
let g:gitgrepprgclass="grep\\ -n\\ -R\\ --include='*.py'\\ class\\"
let g:gitgrepprgfunction="grep\\ -n\\ -R\\ --include='*.py\\ def\\'"

function! GitGrep(args)
    redraw
    echo "Searching..."
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgreprg
    execute "silent! grep " . a:args . " *"
    let &grepprg=grepprg_bak
    botright copen
    redraw!
endfunction
command! -nargs=* -complete=file G call GitGrep(<q-args>)

function! GitGrepClass(args)
    redraw
    echo "Searching..."
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprgclass
    execute "silent! grep " . a:args . " *"
    let &grepprg=grepprg_bak
    botright copen
    redraw!
endfunction
command! -nargs=* -complete=file Gc call GitGrepClass(<q-args>)

function! GitGrepFunction(args)
    redraw
    echo "Searching..."
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprgfunction
    execute "silent! grep " . a:args . " *"
    let &grepprg=grepprg_bak
    botright copen
    redraw!
endfunction
command! -nargs=* -complete=file Gf call GitGrepFunction(<q-args>)

function! GitGrepWord()
    normal! "zyiw
    call GitGrep(getreg('z'))
endfunction
nmap <leader>gw :call GitGrepWord()<CR>"

" Selecta
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>

" LANGUAGE STUFF

augroup ft_haskell
    au!

    autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>:SyntasticReset<cr>
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    let g:haddock_browser = "open"
    au Bufenter *.hs compiler ghc

    " 1 tab == 2 spaces
    set shiftwidth=2
    set tabstop=2

    " Pretty unicode haskell symbols
    let g:haskell_conceal_wide = 1
    let g:haskell_conceal_enumerations = 1
    let hscoptions="𝐒𝐓𝐄𝐌xRtB𝔻w"

    set ai "Auto indent
    set si "Smart indent
    set wrap "Wrap lines

augroup END

augroup ft_javascript
    au!

    let g:syntastic_javascript_checkers = ['jsxhint']

augroup END

augroup ft_python
    au!

    au FileType python setlocal omnifunc=pythoncomplete#Complete

    " Flake 8

    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_python_flake8_args='--ignore=W391'
    au FileType python nnoremap <leader>s :SyntasticCheck<CR>
    au FileType python nnoremap zj :lnext<CR>zz
    au FileType python nnoremap zk :lprev<CR>zz

    " Python
    " Rope
    let g:pymode_folding=0
    let g:pymode_lint_ignore = "W391"
    let g:pymode_lint = 0
    let g:pymode_lint_cwindow = 0
    let g:pymode_run = 0

    "let g:pymode_rope_guess_project = 0

    " Pyflakes
    let g:pyflakes_use_quickfix = 1

    " Full python syntax highlighting
    let python_highlight_all=1

    " Makegreen
    au FileType python map <localleader>t :call MakeGreen()<cr>
    au FileType python let g:makegreen_stay_on_file=1
    "autocmd BufNewFile,BufRead *.py compiler nose
    " For now set all tests to nose. But we'll probably want something better long
    " term. Like using a make file...
    au FileType python autocmd BufNewFile,BufRead *.* compiler nose

augroup END

augroup ft_go
    au!

    map <localleader>t :wa<CR> :GolangTestCurrentPackage<CR>
    map <localleader>tf :wa<CR> :GolangTestFocused<CR>

    " Import package under cursor.
    au FileType go nmap <Leader>i <Plug>(go-import)

    " Open Godoc for word.
    "au FileType go nmap <Leader>d <Plug>(go-doc)
    au FileType go nmap <C-c>d <Plug>(go-doc)

    " Run go <command>
    au FileType go nmap <localleader>r <Plug>(go-run)
    au FileType go nmap <localleader>b <Plug>(go-build)
    "au FileType go nmap <localleader>t <Plug>(go-test)

    " Goto declaration for word under cursor.
    "au FileType go nmap gd <Plug>(go-def)
    au FileType go nmap <C-c>g <Plug>(go-def)

    " Open declaration for word under curos in split, vertical, tab
    au FileType go nmap <C-c>gs <Plug>(go-def-split)
    au FileType go nmap <C-c>gv <Plug>(go-def-vertical)
    au FileType go nmap <C-c>gt <Plug>(go-def-tab)

    let g:go_fmt_command = "goimports"

augroup END


" Environments GUI
if has('gui_running')
    "set guifont=Inconsolota:h11
    set guifont=Inconsolota-dz for Pow:h11

    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor
else
    " Non-MacVim GUI, like Gvim
    hi ColorColumn ctermbg=0 guibg=#1c1c1c
    hi CursorLine ctermbg=236 guibg=#DDDDDD

    hi Normal guibg=#cccccc ctermbg=233
    hi NonText guibg=#cccccc ctermbg=233

    " Vimux
    function! VimuxSlime()
      call VimuxSendText(@v)
      call VimuxSendKeys("Enter")
    endfunction

    vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>
    nmap <LocalLeader>vs vip<LocalLeader>vs<CR>

    " Vim TMUx
    map <Leader>vp :VimuxPromptCommand <CR>
    " Run last command executed by RunVimTmuxCommand
    map <Leader>vl :RunLastVimTmuxCommand<CR>
    " Inspect runner pane
    map <Leader>vi :InspectVimTmuxRunner<CR>

    let VimuxHeight = "28"
    let VimuxUseNearestPane = 1
    let g:VimuxOrientation = "h"

    " for tmux to automatically set paste and nopaste mode at the time pasting (as
    " happens in VIM UI)

    function! WrapForTmux(s)
      if !exists('$TMUX')
        return a:s
      endif

      let tmux_start = "\<Esc>Ptmux;"
      let tmux_end = "\<Esc>\\"

      return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
    endfunction

    let &t_SI .= WrapForTmux("\<Esc>[?2004h")
    let &t_EI .= WrapForTmux("\<Esc>[?2004l")

    function! XTermPasteBegin()
      set pastetoggle=<Esc>[201~
      set paste
      return ""
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
endif

function! ZoomMode()
    if exists("t:zoom_mode_enabled")
        " If zoom mode is on, make windows a size usable for coding as we jump
        " between them.
        set winwidth=90

        " We have to have a winheight bigger than we want to set winminheight.
        " But if we set winheight to be huge before winminheight, the
        " winminheight set will fail.
        set winheight=15
        set winminheight=15
        set winheight=999

        " Mark ZoomMode as off.
        unlet t:zoom_mode_enabled

        echo "  zoom"
    else
        " If zoom mode is not on, set resize limits much lower.
        set winwidth=20
        set winheight=15
        set winminheight=1
        set winheight=1

        " Mark that ZoomMode is on.
        let t:zoom_mode_enabled = 1

        echo "nozoom"
    endif
endfunction

" Toggle zoom mode on/off.
map <leader>z :call ZoomMode()<cr>

" NEO VIM PARTS
if !has('nvim')
    set ttymouse=xterm2
endif

if exists(':tnoremap')
    tnoremap <Esc> <C-\><C-n>
endif
