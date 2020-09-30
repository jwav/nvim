function! Comment()
  if (mode() == "n" )
    execute "Commentary"
  else    
    execute "'<,'>Commentary"
  endif
 endfunction
vnoremap <silent> <space>/ :call Comment()
au BufReadPost,BufNewFile *.c,*.cpp,*.cxx,*.h,*.hpp,*.ino setlocal commentstring=//\ %s
