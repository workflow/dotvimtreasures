" Pathogen!
call pathogen#infect()
call pathogen#helptags()

" Disable menu sourcing in GVIM - this must be set before turning any syntax hl on!
set go-=M

syntax on

" Enable Mouse
set mouse=a

" UTF-8 Filecoding Stuff - Find out more!
if v:lang =~ "utf8§" || v:lang =~ "UTF8$"
	set fileencodings=utf8, iso-8859-1
endif

" Allow Backspacing over Everything
set bs=2

" Keep 200 Lines of CL history
set history=200

" Allow switching Buffer w/o writing to disk
set hidden

" Always show cursor position
set ruler

" When editing a file, always jump to last cursor pos!
if has("autocmd")
  au BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif

" Activate Paste Mode. This will prevent staircasing. You can tell that you are in paste mode when the cursor disappears. (No freaking sign of that, so far)
set pastetoggle=<F2>

" Disable fuckin' wordwrap
set nowrap
" And don't have any automatic linebreaks
set textwidth=0
set wrapmargin=0

" Don't care about case when searching...
set ignorecase
" Enable incremental search
set incsearch
" And wrap'r'ound
set wrapscan

" ...unless we type something else than lowercase!
set smartcase

" Show tab completion menu
set wildmenu
set wildmode=list:longest,full

" Highlight longest suggestion, show preview (omnicompletion!) and show menu even if there's only one entry
set completeopt=longest,menuone,preview
" Reduce preview window height
set previewheight=5

" Ignore these files when completing names
"set wildignore=.svn,CVS,*.gif ... whatever

" I hate noise. And flashing.
set vb t_vb=

" Enable automatic backups...
set backup
" ...and keep them together in a nice, free-range dir...
set backupdir=~/.v_backup/
" ...with another extension
set backupext=.frozen.track.in.the.snow

" Trim trailing whitespace at the end of lines when saving
au BufWritePre *.* normal m`:%s/\s\+$//e ``)

" Set softtabstop (the space-recognition thing) and shiftwidth (the VIM indentation setting) to 4
set shiftwidth=4
set softtabstop=4
" Insert spaces instead of tabs
set expandtab

" Autoindent simply starts the next line with the same level of indentation.
" Since it doesn't interfere with filetype-based indentation, it's perfectly safe to use :)
set autoindent

" Flag problematic whitespace
let c_space_errors=1

" Show line numbers
set number

" Enable automatic saving when switching 'tween files
set autowrite

" Show partial commands as I type them
set showcmd

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Ignore Modelines(Security!)
set nomodeline
set modelines=0

" Begin scrolling 3 lines from top/bottomm
set scrolloff=10

" Briefly flash matching bracket
set showmatch matchtime=3

" syntaxcoloring-Farb-Schema (stehen in $VIMRUNTIME/colors)
" TIPP: Auflisten mit: :colo TAB...
" Farbschema-Wahl abhaengig von Systemzeit
set background=dark
" let hr = strftime('%H')
" if hr >= 6 && hr <= 18 
	" colorscheme desert
	" " Set statusline colors and change them when in insert/visual mode
	" hi StatusLine ctermfg=White ctermbg=None cterm=None
	" hi ModeMsg ctermfg=White ctermbg=None cterm=Bold
	" au InsertEnter * hi StatusLine ctermbg=Cyan ctermfg=Black
	" au InsertLeave * hi StatusLine ctermfg=White ctermbg=None cterm=None
	" hi Visual ctermfg=Cyan
	" hi Ruler ctermfg=Cyan
	" hi TabLine cterm=None ctermbg=None
	" hi TabLineFill cterm=None 
	" hi TabLineSel cterm=None ctermfg=Cyan
	" hi LineNr ctermfg=Cyan cterm=None
" else
	" colorscheme desert
	" " Set statusline colors and change them when in insert/visual mode
	" hi StatusLine ctermfg=White ctermbg=None cterm=None
	" hi ModeMsg ctermfg=White ctermbg=None cterm=Bold
	" au InsertEnter * hi StatusLine ctermbg=DarkYellow ctermfg=Black
	" au InsertLeave * hi StatusLine ctermfg=White ctermbg=None cterm=None
	" hi Visual ctermfg=DarkYellow
	" hi Ruler ctermfg=DarkYellow
	" hi TabLine cterm=None ctermbg=None
	" hi TabLineFill cterm=None 
	" hi TabLineSel cterm=None ctermfg=DarkYellow
" endif

"
"
" Key Bindings...
"

" CTRL-i to increment, and CTRL-d to decrement number under cursor
nnoremap <silent> <C-I> <C-A>
nnoremap <silent> <C-D> <C-X>

" Who needs Umlauts in normal mode? So we'll do tagging with ö and jumping back with Ö (:
nnoremap ö <C-]>
nnoremap Ö <C-T>

" Bash-style autocomplete in command line
cnoremap <TAB> <C-L><C-D>

" List lines with current word (under cursor)
nnoremap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Binding ü to toggle comments with ingenious NERD_commenter
nnoremap <silent> ü :call NERDComment(0, "toggle")<CR>
vnoremap <silent> ü :call NERDComment(1, "toggle")<CR>
" Ü for minimal comments
nnoremap Ü :call NERDComment(0, "minimal")<CR>
vnoremap Ü :call NERDComment(1, "minimal")<CR>
" And ALT-ü for Sexy comments
nnoremap ü :call NERDComment(0, "sexy")<CR>
vnoremap ü :call NERDComment(1, "sexy")<CR>
" ...and rest will have to be done using regular mappings! (:
" eg:	,c$		comment to EOL
"		,ca		switch to alternative set of delimiters
"		,cA		add comment delimiters at EOL and switch into insert mode between them!	
"		,cl		align comments left
"		,cb		align comments both
" Have spacy comments
let NERDSpaceDelims=1


" Toggling between open tabs with <F12>
au TabLeave * let s:lastOpenTabNr = tabpagenr()
function! TabToggle()
	return ':tabn ' . s:lastOpenTabNr . "\<CR>"
endfunction
nmap <expr> <F9> TabToggle()

" Scroll through open tabs with ALT <--> (and ALT h--l)
noremap  [1;3D :tabp<CR>
inoremap [1;3D <ESC>:tabp<CR>
noremap [1;3C :tabn<CR>
inoremap [1;3C <ESC>:tabn<CR>
noremap  h :tabp<CR>
" inoremap h <ESC>:tabp<CR>
noremap l :tabn<CR>
" inoremap l <ESC>:tabn<CR>


" Open new file in tab with ALT UP
noremap [1;3A :tabe<SPACE>
inoremap [1;3A <ESC>:tabe<SPACE>
" noremap k :tabe<SPACE>
" inoremap k <ESC>:tabe<SPACE>

" And Texplore w/h ALT DOWN 
noremap <silent> [1;3B :Texplore<CR>
inoremap <silent> [1;3B <ESC>:Texplore<CR>
" noremap <silent> j :Texplore<CR>
" inoremap <silent> j <ESC>:Texplore<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent> <C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> <C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent> j :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> k :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Bring up tab selection menu with <F10>
nnoremap <F10> :ls!<CR>:tabn<SPACE>

" Save single file with... let's not reinvent the wheel (:
nmap <C-S> :w<CR>
" Save all files with ZA
nmap ZA :wa<CR>
" Quit all files with ZC
nmap ZC :qa<CR>
" Write and Quit all with ZW
nmap ZW :wqa<CR>

" Repeat last jump with ä
nmap ä `` 
" And toggle case with Ä
nmap Ä ~
" Have Tab Completion (see genious explanation below)
function! GeniousTabOrComplete()
	let col = col('.')-1
	if !col || getline('.')[col-1] !~ '\k'
		return "\<Tab>"
	elseif pumvisible()
        return "\<C-n>"
	else
		return "\<C-n>\<Down>"
	endif
endfunction
inoremap <expr> <Tab> GeniousTabOrComplete()
" ...but have normal tabs with <S-TAB>
inoremap [Z <Tab>
" Accept suggestion with <CR>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Simulate Downkey when menu appears -> we always have a selection!
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Map Omnicompletion to <C-f>
inoremap <C-f> <C-x><C-o>
" Close preview window on closing bracket
inoremap ) )<Esc><C-w><C-z>a

" Tired of changing text inside quotes? :>
"nmap x ci'
"nmap X ci"

" Make Backspace act as delete in Visual mode
vmap <BS> x

" Play macro with Q
nmap Q @

" Goto mark instead of 'goto mark bol'
nmap ' `

" Peacewise copying of above line! (:TODO: Understand that shit -.^)
" imap <C-l> @@@<ESC>hhkywj1?@@@<CR>P/@@@<CR>3s

" Load plugins!
filetype plugin on
filetype indent on

" Configure NetRW
let g:netrw_use_errorwindow=0

" Enable matchIt!
source $VIMRUNTIME/macros/matchit.vim

" Autoclose Parantheses ( et quotas ) ! (Insert single ones with <crtl>V)
" inoremap [ []<left>
" inoremap ( ()<left>

" Reread configuration of ViM if file ~/.vimrc is saved
au BufWritePost ~/.vimrc	so ~/.vimrc | exec "normal zv"
au BufWritePost vimrc   	so ~/.vimrc | exec "normal zv"

" Do not Auto switch to folder current folder, since that could potentially mess up reading and writing :mksessions.
" Instead, just use a mapping.
map <silent> ,cd :cd %:p:h<CR>:echo "Change to " .  expand("%:p:h") . " affirmative. Code faster!"<CR>

" Yank entire file into X11 buffer :)
map <silent> ,yw :%y+<CR>

" Crosshair in insert mode. Don't panic!
au InsertEnter * set cul
au InsertLeave * set nocul

" Sessions: do not keep buffers outside windows, and do not save options and mappings
set sessionoptions-=buffers
set sessionoptions-=options

" Save current session
map <silent> <F8> :wa<Bar>exe "mksession! " . v:this_session<BAR>exe "echo \"Affirmative.\""<CR>
" We don't need to resource .vimrc anymore - we're now loading via vim -c (instead of vim -S) (:
" au SessionLoadPost * so ~/.vimrc | exec "normal zv"

" Performance
" Good on "slow" color terminals?
" hi NonText cterm=none ctermfg=none
" Until performance improves...
" let loaded_matchparen = 1

" Abbreviations...
iab CDATA <![CDATA[

" Exuberant CTags!
map <silent> <F4> :!ctags-exuberant -f %:p:h/.tags --langmap="php:+.inc" -h ".php.inc" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf-v %:p:h<CR>
set tags=./.tags,.tags

" TagList
let Tlist_Ctags_Cmd = "/usr/bin/ctags-exuberant"
let Tlist_Inc_Winwidth = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Process_File_Always = 0
let Tlist_Enable_Fold_Column = 1
let Tlist_Close_On_Select = 1
let Tlist_Display_Prototype = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_WinWidth = 50
map <silent> <F3> :TlistToggle<CR>

" Sparta!
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" SPAAAAARTAAAAA! (:
map <M-7> {
map! <M-7> {
map <M-8> [
map! <M-8> [
map <M-9> ]
map! <M-9> ]
map <M-0> }
map! <M-0> }


" Skeletons
au! BufNewFile *.css :r ~/code/libs/css/rac_standard.css

" Smarty Settings
au BufRead,BufNewFile *.tpl set filetype=smarty 
au FileType smarty exec('set dictionary-=~/.vim/syntax/smarty.vim dictionary+=~/.vim/syntax/smarty.vim')
au FileType smarty set complete-=k complete+=k
au BufRead,BufNewfile,TabEnter *.tpl inoremap { {| inoremap < <><left>
au BufLeave,TabLeave *.tpl inoremap { {<cr>}<C-O>O<tab> | inoremap < <

" Less Settings
" au BufNewFile,BufRead *.less set filetype=less
call pathogen#infect()

" PHTML Settings
au BufNewFile,BufRead *.phtml set filetype=phtml
au BufNewFile,BufRead *.phtml let b:match_words="<:>,<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>"

" Velocity Settings
au BufRead,BufNewFile *.vtl  setfiletype velocity

" Snippets Settings
let g:snippetsEmu_key = "<C-j>"
