"
" Heya! (:
"

" First thing, get some space
" We actually do not source the menu script at all!
set guioptions -=m
set guioptions -=r
set guioptions -=T
" Use entire height!
set ghr=0

" Autocopy visually selected text!
" set go+=a
" Use console dialogs instead of popups, at least for simple stuff
set go+=c
" We don't want GUI tablines
set go-=e
" But we do want a VIM Icon. We lovez VIM iconses.
set go+=i
" Disable the chinese blinking pain
set guicursor=a:blinkon0
" And the visual bell, again for gvim
set vb t_vb=

" Colors!
set background=dark
colorscheme chlordane
" let hr = strftime('%H')
" if hr >= 6 && hr <= 18 
	" colorscheme Black
" else
	" colorscheme chlordane
" endif

" And Fonts
set guifont=DejaVu\ Sans\ Mono\ 9

" Overwrite ALT Mappings for them to work in the gui
nnoremap <M-ü> :call NERDComment(0, "sexy")<CR>
vnoremap <M-ü> :call NERDComment(1, "sexy")<CR>
noremap  <M-Left> :tabp<CR>
inoremap <M-Left> <ESC>:tabp<CR>
noremap <M-Right> :tabn<CR>
inoremap <M-Right> <ESC>:tabn<CR>
noremap  <M-h> :tabp<CR>
inoremap <M-h> <ESC>:tabp<CR>
noremap <M-l> :tabn<CR>
inoremap <M-l> <ESC>:tabn<CR>
noremap <M-Up> :tabe<SPACE>
inoremap <M-Up> <ESC>:tabe<SPACE>
noremap <silent> <M-Down> :Texplore<CR>
inoremap <silent> <M-Down> <ESC>:Texplore<CR>
nnoremap <silent> <M-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent> <M-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>


" Start maximized! (->performance loss?)
" set lines=999999
" set columns=999999
