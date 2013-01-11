set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" start vundle
Bundle 'gmarik/vundle'

" My bundles
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ervandew/supertab'
Bundle 'sjl/gundo.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'Townk/vim-autoclose'
Bundle 'vim-scripts/Rainbow-Parenthesis'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'kien/ctrlp.vim'
Bundle 'benmills/vimux'
Bundle 'klen/python-mode'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/Jinja'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'Lokaltog/vim-powerline'
Bundle 'xolox/vim-notes'
Bundle 'duff/vim-scratch'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'jnwhiteh/vim-golang'

filetype plugin indent on

" The basics
syn on
set encoding=utf-8
set modelines=0
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set nonumber
set norelativenumber
set laststatus=2
set history=1000
set undolevels=999
set undofile
set undoreload=10000
set cpoptions+=J
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿
set ttimeout
set notimeout
set nottimeout
set autowrite
set shiftround
set autoread
set title
set dictionary=/usr/share/dict/words
set mouse=a
set number
set noswapfile
set backup

set wildmode=longest:full
set wildmenu

" TABS, SPACING
set smarttab
set nosmartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1
set copyindent

" backups
set undodir=/var/tmp/vim/undo//     " undo files
set backupdir=/var/tmp/vim/backup// " backups
set directory=/var/tmp/vim/swap//   " swap files

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

" KEY REMAPPING

" leader
let mapleader = ","
let maplocalleader = "\\"

" Made D behave
nnoremap D d$

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

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
nnoremap ; :

" Faster Esc
inoremap jj <esc>

" toggle current column highlight shortcut
map <leader>c :set cursorcolumn!<cr>

" Gundo
nnoremap <leader>g :GundoToggle<CR>

" toggle between relative and absolute line numbers.
map <leader>l :exec "set " &nu ? "rnu": "nu"<cr>

" toggle paste mode.
map <leader>p :set paste!<CR>


" SEARCHING
" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap / /\v
vnoremap / /\v

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <localleader>e :edit %%
map <leader>v :view %%

" ,e to fast finding files. just type beginning of a name and hit TAB
nmap <leader>e :e **/

" Rename current file
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

" Moving around
" quick buffer list
:nnoremap <C-b> :buffers<CR>:buffer<Space>

if has("autocmd")
    " Enable file type detection
    filetype on

    " Syntax of these languages is fussy over tabs vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    " Customisations base on preference
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType mustache setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType less setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType coffeescript setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType mako setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType jst setlocal ts=2 sts=2 sw=2 noexpandtab
    
endif


" EDITING"
" **************************************************

" auto complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType mustache set omnifunc=htmlcomplete#CompleteTags
autocmd FileType mako set omnifunc=htmlcomplete#CompleteTags
autocmd FileType jst set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Completej
set completeopt=menuone

" Clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" Dammit, Slimv
map <leader>WW :%s/\s\+$//<cr>:let @/=''<CR>

" Substitute
nnoremap <leader>s :%s//<left>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Sudo to write
cmap w!! w !sudo tee % >/dev/null

" FILE MANAGEMENT
" ***************************************************

" wild menu
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.py[co]                         " Python byte code

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Resize windows depending on foucs
"set winwidth=84
"" We have to have a winheight bigger than we want to set winminheight. But if
"" we set winheight to be huge before winminheight, the winminheight set will
"" fail.
"set winheight=15
"set winminheight=15
"set winheight=999


" sudo from inside vim if forgot
cmap w!! w !sudo tee % >/dev/null

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Make leader leader switch between last 2 buffers
nnoremap <leader><leader> <c-^>

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v

" tabs
for i in range(1, 9) 
    exec "nnoremap <D-".i."> ".i."gt" 
endfor"

" FONT

" Try to get nicer font render on OS X
if has("unix")
    set antialias
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" COLOR SCHEME
syntax on
set background=dark
colorscheme jellybeans
"colorscheme tomorrow_night
set t_Co=256

" Enable fancy mode 
let g:Powerline_symbols = 'fancy'   " Powerline

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

" LANGUAGE STUFF

" Python
" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>d :RopeShowDoc<CR>
let ropevim_enable_shortcuts = 0
let ropevim_guess_project = 1
let ropevim_global_prefix = '<C-c>p'

let g:pymode_folding = 0
let g:pymode_lint = 0

" Pyflakes
let g:pyflakes_use_quickfix = 0

" Full python syntax highlighting
let python_highlight_all=1

augroup ft_python
    au!

    au Filetype python noremap  <buffer> <localleader>rr :RopeRename<CR>
    au Filetype python vnoremap <buffer> <localleader>rm :RopeExtractMethod<CR>
    au Filetype python noremap  <buffer> <localleader>ri :RopeOrganizeImports<CR>
    au Filetype python noremap  <buffer> <localleader>ra :RopeCodeAssist<CR>
    au Filetype python noremap  <buffer> <localleader>ro :RopeFindOccurrences<CR>
    au Filetype python noremap  <buffer> <localleader>rs :RopeShowCalltip<CR>
    au Filetype python noremap  <buffer> <localleader>rf :RopeFindFile<CR>
    au Filetype python noremap  <buffer> <localleader>rg :RopeJumpToGlobal<CR>

    au FileType python setlocal omnifunc=pythoncomplete#Complete
    au FileType python setlocal define=^\s*\\(def\\\\|class\\)
    au FileType man nnoremap <buffer> <cr> :q<cr>
augroup END

" PLUGINS

" Task list
map <leader>td <Plug>TaskList

" Makegreen
map <localleader>t :call MakeGreen()<cr>

" Fugitive
set statusline=%{fugitive#statusline()}

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

if has("autocmd")

    " Auto-close fugitive buffers
    autocmd BufReadPost fugitive://* set bufhidden=delete

    " Navigate up one level from fugitive trees and blobs
    autocmd User fugitive
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endifugitive://* set bufhidden=delete

endif

" HTML5
let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

" NERD Tree
map <leader>n :NERDTreeToggle<CR> :NERDTreeMirror<CR>
inoremap <F2> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'db.db']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 30

" Rainbox Parentheses
nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

" Searching
let g:gitgrepprg="grep\\ -n\\ -R\\ --include='*.py'"
let g:gitgrepprgclass="grep\\ -n\\ -R\\ --include='*.py'\\ class\\"
let g:gitgrepprgfunction="grep\\ -n\\ -R\\ --include='*.py\\ def\\'"

function! GitGrep(args)
    redraw
    echo "Searching..."
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
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

" Ctrlp
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$|\bin$\|\test-reports$\|\.externalToolBuilders$\|\.idea$\|\.ropeproject$\',
    \ 'file': '\.exe$\|\.mxml$\|\.dll$|\.pyc$\|\.swc$\',
\ }

" Notes
let g:notes_suffix = ".txt"
let g:notes_directory = "~/Dropbox/Notes/vim"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit " . filenames[0]
  for filename in filenames[1:]
    exec "sp " . filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()


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

    " Vim TMUx
    map <Leader>rt :call RunVimTmuxCommand("clear; wft " . bufname("%"))<CR>
    map <Leader>rs :call RunVimTmuxCommand("clear; wfrs " . bufname("%"))<CR>
    " Prompt for a command to run
    map <Leader>rp :VimuxPromptCommand <CR>
    " Run last command executed by RunVimTmuxCommand
    map <Leader>rl :RunLastVimTmuxCommand<CR>
    " Inspect runner pane
    map <Leader>ri :InspectVimTmuxRunner<CR>
    " Close all other tmux panes in current window
    map <Leader>rx :CloseVimTmuxPanes<CR>
    " If text is selected, save it in the v buffer and send that buffer it to tmux
    vmap <LocalLeader>vs "vy :call RunVimTmuxCommand(@v)<CR>
    " Select current paragraph and send it to tmux
    nmap <LocalLeader>vs vip<LocalLeader>vs<CR>

    let VimuxHeight = "28"
    let VimuxUseNearestPane = 1
    let g:VimuxOrientation = "h"
endif
