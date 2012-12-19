" PHP Setting
let php_sql_query=1
let php_htmlInStrings=1
" Allow short tags
let php_short_tags=1
" Fold only functions
let php_folding=3
" Don't disable some options on larger files
let php_large_file=0

set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l
map <silent> <F7> :make %<CR>

" PHPDOC! 
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR> 

" TagList
let tlist_php_settings = 'php;c:class;d:constant;f:function'

" Rasmus Lerdorfs Dictionary Autocomplete! (:
set dictionary-=~/.vim/php/php_funclist dictionary+=~/.vim/php/php_funclist
set complete-=k complete+=k

" PHP-Specific autoclose of parantheses et quotas! (Insert single ones with <crtl>V)
" inoremap  { <CR>{<CR>}<C-O>O

" Have text-only PHP Manual.
"autocmd FileType php set keywordprg=~/.vim/php/php_man.sh

" Trim trailing blank lines at the end of PHP files. Still? saves as lot of bugfixing. (:
au BufWritePre *.php silent :$g/^\s*$/d

" :TODO: Create some awesome Zend Framework, Typo3 pibase et.al. Skeleton files!
"au! BufNewFile *.php :r ~/.vim/skeleton.php

" :TODO: Set up codesniffer! (see plugin/phpcs.vim.future)
