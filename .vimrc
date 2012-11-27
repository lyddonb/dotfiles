"_get_element_sessions_for_account Beau's vimrc
" some basics and turn on pathogen

call pathogen#runtime_append_all_bundles()
call pathogen#infect()
filetype off
filetype plugin indent on
set nocompatible

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

" KEY REMAPPING

" leader
let mapleader = ","
let maplocalleader = "\\"

" Made D behave
nnoremap D d$

" Don't move on *
nnoremap * *<c-o>

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Fix linewise visual selection of various text objects
nnoremap VV V
nnoremap Vit vitVkoj
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

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

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" toggle current column highlight shortcut
map <leader>b :set cursorcolumn!<cr>

nnoremap <leader>g :GundoToggle<CR>


" SEARCHING
" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap / /\v
vnoremap / /\v

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! --python '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>>")))'"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%


" Moving around
" quick buffer list
:nnoremap <C-b> :buffers<CR>:buffer<Space>


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

" Whitespace
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
  


" EDITING"
" **************************************************

" insert newlines without entering insert mode
nnoremap <M-o>  o<Esc>
nnoremap <M-O>  O<Esc>

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

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Formatting, TextMate-style
nnoremap Q gqip

" Easier linewise reselection
nnoremap <leader>V V`]

" Marks and Quotes
noremap ' `
noremap æ '
noremap ` <C-^>

" Better Completion
set completeopt=longest,menuone,preview

" Sudo to write
cmap w!! w !sudo tee % >/dev/null


" FILE MANAGEMENT
" ***************************************************

" ,e to fast finding files. just type beginning of a name and hit TAB
nmap <leader>e :e **/

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

" Clojure/Leiningen
set wildignore+=classes

" Save when losing focus
au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" sudo from inside vim if forgot
cmap w!! w !sudo tee % >/dev/null

" backups
set undodir=/var/tmp/vim/undo//     " undo files
set backupdir=/var/tmp/vim/backup// " backups
set directory=/var/tmp/vim/swap//   " swap files


" MOVEMENT
" Run this if you need the help of a greater power 
" in breaking the arrow keys addiction.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <pageup> <nop>
nnoremap <pagedown> <nop>
nnoremap <home> <nop>
nnoremap <end> <nop>
vnoremap <home> <nop>
vnoremap <end> <nop>

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

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

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

" Make bad spelling/syntax style prettier
highlight SpellBad term=underline gui=undercurl guisp=Orange
highlight SpellCap term=underline gui=undercurl guisp=Green
highlight SpellLocal term=underline gui=undercurl guisp=Blue
highlight SpellRare term=underline gui=undercurl guisp=Cyan

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight word
nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" Full python syntax highlighting
let python_highlight_all=1

" COLOR SCHEME
syntax on
set background=dark
colorscheme jellybeans
"colorscheme tomorrow_night
set t_Co=256

" Enable fancy mode 
let g:Powerline_symbols = 'fancy'   " Powerline

" ABBREVATIONS AND SPELLING
function! EatChar(pat)
    let c = nr2char(getchar(0))
        return (c =~ a:pat) ? '' : c
endfunction
        
function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

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

" LINE HELPER
nnoremap <leader>l :NumbersToggle<CR>

" LANGUAGE STUFF


" CSS / LESS
augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=css
    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END


" Django
augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR
    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal foldmethod=marker
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal foldmethod=marker
augroup END


" HTML and HTMLDjango
augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au BufNewFile,BufRead *.mustache setlocal filetype=html
    au BufNewFile,BufRead *.mako setlocal filetype=htmldjango
    au BufNewFile,BufRead *.jst setlocal filetype=html

    " HTML tag closing
    nnoremap \hc :call InsertCloseTag()<CR>
    imap <F8> <Space><BS><Esc>\hca

    function! InsertCloseTag()

    if &filetype == 'html' || $filetype == 'mustache' || $filetype == 'mako' || $filetype == 'jst'

        " list of tags which shouldn't be closed:
        let UnaryTags = ' Area Base Br DD DT HR Img Input LI Link Meta P Param '

        " remember current position:
        normal mz

        " loop backwards looking for tags:
        let Found = 0
        while Found == 0
        " find the previous <, then go forwards one character and grab the first
        " character plus the entire word:
        execute "normal ?\<LT>\<CR>l"
        normal "zyl
        let Tag = expand('<cword>')

        " if this is a closing tag, skip back to its matching opening tag:
        if @z == '/'
            execute "normal ?\<LT>" . Tag . "\<CR>"

        " if this is a unary tag, then position the cursor for the next
        " iteration:
        elseif match(UnaryTags, ' ' . Tag . ' ') > 0
            normal h

        " otherwise this is the tag that needs closing:
        else
            let Found = 1

        endif
        endwhile " not yet found match

        " create the closing tag and insert it:
        let @z = '</' . Tag . '>'
        normal `z"zp

    else " filetype is not HTML
        echohl ErrorMsg
        echo 'The InsertCloseTag() function is only intended to be used in HTML ' .
        \ 'files.'
        sleep
        echohl None

    endif " check on filetype

    endfunction " InsertCloseTag()

    au FileType html,jinja,htmldjango,mustache,mako,jst setlocal foldmethod=manual

    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf
    au FileType html,jinja,htmldjango nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    au FileType html,jinja,htmldjango nnoremap <buffer> p :<C-U>YRPaste 'p'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> P :<C-U>YRPaste 'P'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> π :<C-U>YRPaste 'p'<CR>
    au FileType html,jinja,htmldjango nnoremap <buffer> ∏ :<C-U>YRPaste 'P'<CR>

    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>
    au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END

" Python
map <leader>j :RopeGotoDefinition<CR>
map <leader>d :RopeShowDoc<CR>
let g:pymode_folding = 0
let g:pymode_lint = 0

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

" Makegreen
"map <localleader>t <Plug>MakeGreen
map <localleader>t :call MakeGreen()<cr>

" TODO: make it smart enough to know if a "django" based project with manage.py
autocmd BufNewFile,BufRead *.py compiler wftest

" Fugitive
set statusline=%{fugitive#statusline()}

augroup ft_fugitive
    au!

    au BufNewFile,BufRead .git/index setlocal nolist
augroup END

" HTML5
let g:event_handler_attributes_complete = 0
let g:rdfa_attributes_complete = 0
let g:microdata_attributes_complete = 0
let g:atia_attributes_complete = 0

" NERD Tree
map <leader>n :NERDTreeToggle<CR>j
"inoremap <F2> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 22

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

" Rope
let ropevim_enable_shortcuts = 0
let ropevim_guess_project = 1
let ropevim_global_prefix = '<C-c>p'

" Syntastic
nnoremap zj :lnext<CR>zz
nnoremap zk :lprev<CR>zz

" Pyflakes
let g:pyflakes_use_quickfix = 0

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
map <leader>p :CtrlP()<CR>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$|\bin$\|\test-reports$\|\.externalToolBuilders$\|\.idea$\|\.ropeproject$\',
    \ 'file': '\.exe$\|\.mxml$\|\.dll$|\.pyc$\|\.swc$\',
\ }

" Environments GUI
if has('gui_running')
    "set guifont=Inconsolota:h11
    set guifont=Inconsolota-dz for Pow:h11

    set go-=T
    set go-=l
    set go-=L
    set go-=r
    set go-=R

    set fillchars+=vert:│

    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor

    if has("gui_macvim")
        set fuoptions=maxvert,maxhorz
        let macvim_skip_cmd_opt_movement = 1
        no   <D-Left>       <Home>
        no!  <D-Left>       <Home>
        no   <M-Left>       <C-Left>
        no!  <M-Left>       <C-Left>

        no   <D-Right>      <End>
        no!  <D-Right>      <End>
        no   <M-Right>      <C-Right>
        no!  <M-Right>      <C-Right>

        no   <D-Up>         <C-Home>
        ino  <D-Up>         <C-Home>
        imap <M-Up>         <C-o>{

        no   <D-Down>       <C-End>
        ino  <D-Down>       <C-End>
        imap <M-Down>       <C-o>}

        imap <M-BS>         <C-w>
        inoremap <D-BS>     <esc>my0c`y
    endif
else
    " Non-MacVim GUI, like Gvim
    hi ColorColumn ctermbg=0 guibg=#1c1c1c
    hi CursorLine ctermbg=236 guibg=#DDDDDD

    hi Normal guibg=#cccccc ctermbg=233
    hi NonText guibg=#cccccc ctermbg=233
endif


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

let VimuxOrientation = "h"
let VimuxHeight = "25"

