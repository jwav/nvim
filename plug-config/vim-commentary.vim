function! Comment()
  if (mode() == "n" )
    execute "Commentary"
  else    
    execute "'<,'>Commentary"
  endif
 endfunction
vnoremap <silent> <space>/ :call Comment()
au BufReadPost,BufNewFile *.c,*.cpp,*.cxx,*.h,*.hpp,*.ino setlocal commentstring=//\ %s

" xmap gc  <Plug>Commentary
" nmap gc  <Plug>Commentary
" omap gc  <Plug>Commentary
" nmap gcc <Plug>CommentaryLine
" doesn't work
" vnoremap <C-;>  <Plug>Commentary
" vnoremap <A-;>  <Plug>Commentary
" nnoremap <C-;> <Plug>CommentaryLine
" nnoremap <A-;> <Plug>CommentaryLine
