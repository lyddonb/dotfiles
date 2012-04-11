" Beau's vimrc
" some basics and turn on pathogen

filetype off
call pathogen#runtime_append_all_bundles()
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



" KEY REMAPPING

" absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set nu
au InsertLeave * :set rnu

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



" SEARCHING
" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap / /\v
vnoremap / /\v

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack for the last search.
nnoremap <silent> <leader>? :execute "Ack! --python '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>>")))'"





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
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    
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
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType c set omnifunc=ccomplete#Completej
set completeopt=menuone

" Clean whitespace
map <leader>W  :%s/\s\+$//<cr>:let @/=''<CR>

" Dammit, Slimv
map <leader>WW :%s/\s\+$//<cr>:let @/=''<CR>

" Change case
nnoremap <C-u> gUiw
inoremap <C-u> <esc>gUiwea

" Substitute
nnoremap <leader>s :%s//<left>

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Diffoff
nnoremap <leader>D :diffoff!<cr>

" Yankring
nnoremap <silent> <F6> :YRShow<cr>

" Formatting, TextMate-style
nnoremap Q gqip

" Easier linewise reselection
nnoremap <leader>V V`]

" Preview Files
nnoremap <leader>p :w<cr>:Hammer<cr>




" Align text
nnoremap <leader>Al :left<cr>
nnoremap <leader>Ac :center<cr>
nnoremap <leader>Ar :right<cr>
vnoremap <leader>Al :left<cr>
vnoremap <leader>Ac :center<cr>
vnoremap <leader>Ar :right<cr>

" Cmdheight switching
nnoremap <leader>1 :set cmdheight=1<cr>
nnoremap <leader>2 :set cmdheight=2<cr>

" Source
vnoremap <leader>S y:execute @@<cr>
nnoremap <leader>S ^vg_y:execute @@<cr>

" Replaste
nnoremap <D-p> "_ddPV`]=

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
set wildignore+=*.py[co]                            " Python byte code

" Clojure/Leiningen
set wildignore+=classes
"set wildignore+=lib

" Save when losing focus
au FocusLost * :wa

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" sudo from inside vim if forgot
cmap w!! w !sudo tee % >/dev/null

" backups
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups""""




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

nnoremap ˚ :lnext<cr>zvzz
nnoremap ¬ :lprevious<cr>zvzz
inoremap ˚ <esc>:lnext<cr>zvzz
inoremap ¬ <esc>:lprevious<cr>zvzz
nnoremap <m-Down> :cnext<cr>zvzz
nnoremap <m-Up> :cprevious<cr>zvzz

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
colorscheme badwolf
set t_Co=256




" STATUS LINE
augroup ft_statuslinecolor
    au!
    
    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#redbar#                " Highlight the following as a warning.
set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*                           " Reset highlighting.

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)




" ABBREVATIONS AND SPELLING
function! EatChar(pat)
    let c = nr2char(getchar(0))
        return (c =~ a:pat) ? '' : c
endfunction
        
function! MakeSpacelessIabbrev(from, to)
    execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction

call MakeSpacelessIabbrev('bb/',  'http://bitbucket.org/')
call MakeSpacelessIabbrev('bbs/', 'http://bitbucket.org/lyddonb/')
call MakeSpacelessIabbrev('gh/',  'http://github.com/')
call MakeSpacelessIabbrev('ghs/', 'http://github.com/lyddonb/')

iabbrev ldis ಠ_ಠ
iabbrev sl@ steve@stevelosh.com
iabbrev vrcf `~/.vimrc` file

abbr teh the
abbr nad and
abbr adn and
abbr becasue because
abbr becuase because
abbr taht that
abbr refactor reorganize
abbr prase parse
abbr sefl self




" SYNTAX HELPER
let g:tagbar_usearrows=1
nnoremap <leader>l :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'





" LANGUAGE STUFF

" C
augroup ft_c
    au!
    au FileType c setlocal foldmethod=syntax
augroup END


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

    " HTML tag closing
    "inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>
    nnoremap \hc :call InsertCloseTag()<CR>
    imap <F8> <Space><BS><Esc>\hca

    function! InsertCloseTag()
    " inserts the appropriate closing HTML tag; used for the \hc operation defined
    " above;
    " requires ignorecase to be set, or to type HTML tags in exactly the same case
    " that I do;
    " doesn't treat <P> as something that needs closing;
    " clobbers register z and mark z
    "
    " by Smylers  http://www.stripey.com/vim/
    " 2000 May 3

    if &filetype == 'html' || $filetype == 'mustache'

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

    au FileType html,jinja,htmldjango,mustache setlocal foldmethod=manual

    au FileType html,jinja,htmldjango nnoremap <buffer> <localleader>f Vatzf
    au FileType html,jinja,htmldjango nnoremap <buffer> <s-cr> vit<esc>a<cr><esc>vito<esc>i<cr><esc>

    au FileType html,jinja,htmldjango nnoremap <buffer> p :<C-U>YRPaste 'p'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> P :<C-U>YRPaste 'P'<CR>v`]=`]
    au FileType html,jinja,htmldjango nnoremap <buffer> π :<C-U>YRPaste 'p'<CR>
    au FileType html,jinja,htmldjango nnoremap <buffer> ∏ :<C-U>YRPaste 'P'<CR>

    au FileType jinja,htmldjango inoremap <buffer> <c-t> {%<space><space>%}<left><left><left>
    au FileType jinja,htmldjango inoremap <buffer> <c-f> {{<space><space>}}<left><left><left>
augroup END


" Javascript
"augroup ft_javascripto
    "au!

    "au FileType javascript setlocal foldmethod=marker
    "au FileType javascript setlocal foldmarker={,}
"augroup END


" Markdown
augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown
    au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
    au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
    au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END


" Nginx
augroup ft_nginx
    au!

    au BufRead,BufNewFile /etc/nginx/conf/*                      set ft=nginx
    au BufRead,BufNewFile /etc/nginx/sites-available/*           set ft=nginx
    au BufRead,BufNewFile /usr/local/etc/nginx/sites-available/* set ft=nginx
    au BufRead,BufNewFile vhost.nginx                            set ft=nginx

    au FileType nginx setlocal foldmethod=marker foldmarker={,}
augroup END


" Python
map <leader>j :RopeGotoDefinition<CR>
map <leader>d :RopeShowDoc<CR>


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
    au FileType python compiler nose
    au FileType man nnoremap <buffer> <cr> :q<cr>
augroup END


" Ruby
augroup ft_ruby
    au!
    au Filetype ruby setlocal foldmethod=syntax
augroup END





" PLUGINS

" Fugitive
set statusline=%{fugitive#statusline()}
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Shell git gl -18<cr>:wincmd \|<cr>

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
inoremap <F2> <esc>:NERDTreeToggle<cr>

au Filetype nerdtree setlocal nolist

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Pydoc
let g:pydoc_perform_mappings = 0

au FileType python noremap <buffer> <localleader>ds :call ShowPyDoc('<C-R><C-W>', 1)<CR>
au FileType python noremap <buffer> <localleader>dS :call ShowPyDoc('<C-R><C-A>', 1)<CR>


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


" Tasks
map <leader>td <Plug>TaskList


" Rope
let ropevim_enable_shortcuts = 0
let ropevim_guess_project = 1
let ropevim_global_prefix = '<C-c>p'


" Pep8
"let g:pep8_map='<leader>8'


" Syntastic
let g:syntastic_check_on_open=1
"let g:syntastic_enable_signs = 1
"let g:syntastic_disabled_filetypes = ['python']
"let g:syntastic_auto_loc_list=0
"let g:syntastic_stl_format = '[%E{Error 1/%e: line %fe}%B{, }%W{Warning 1/%w: line %fw}]'
"let g:syntastic_jsl_conf = '$HOME/.vim/jsl.conf'
"let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetypes": [] }


" Pyflakes
let g:pyflakes_use_quickfix = 0


" Threesome
let g:threesome_leader = "-"

let g:threesome_initial_mode = "grid"

let g:threesome_initial_layout_grid = 1
let g:threesome_initial_layout_loupe = 0
let g:threesome_initial_layout_compare = 0
let g:threesome_initial_layout_path = 0

let g:threesome_initial_diff_grid = 1
let g:threesome_initial_diff_loupe = 0
let g:threesome_initial_diff_compare = 0
let g:threesome_initial_diff_path = 0

let g:threesome_initial_scrollbind_grid = 0
let g:threesome_initial_scrollbind_loupe = 0
let g:threesome_initial_scrollbind_compare = 0
let g:threesome_initial_scrollbind_path = 0

let g:threesome_wrap = "nowrap"

" Minibuff Explorer
let g:miniBufExplSplitBelow=0


" YankRing
function! YRRunAfterMaps()
    nnoremap Y :<C-U>YRYankCount 'y$'<CR>
    omap <expr> L YRMapsExpression("", "$")
    omap <expr> H YRMapsExpression("", "^")
endfunction


" Searching
let g:gitgrepprg="grep\\ -n\\ -R\\ --include='*.py'"
let g:gitgrepprgclass="grep\\ -n\\ -R\\ --include='*.py'\\ class\\"
let g:gitgrepprgfunction="grep\\ -n\\ -R\\ --include='*.py\\ def\\'"
"let g:gitgrepprgfile="grep\\ -n\\ -R\\ --include='*.py'"

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
nmap <C-l>g :call GitGrepWord()<CR>"


" Ctrlp
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_map = '<D-t>'
map <leader>t :CtrlP()<CR>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$|\bin$\|\test-reports$\|\.externalToolBuilders$\|\.idea$\|\.ropeproject$\',
    \ 'file': '\.exe$\|\.mxml$\|\.dll$|\.pyc$\|\.swc$\',
\ }
"map <leader>p :CtrlP



" Environments GUI
if has('gui_running')
    set guifont=Inconsolota:h11

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
    else
        " Non-MacVim GUI, like Gvim
    end
else
    " Console Vim
endif



"" VIMRC
"nmap <leader>v :tabedit $MYVIMRC<CR>

"" Source the vimrc file after saving it
"if has("autocmd")
    "autocmd bufwritepost .vimrc source $MYVIMRC
"endif
  ""
