""""""""""""""""""
" VEE'S COMMANDS "
""""""""""""""""""

command! Bindings execute('e '.NVIM_CONFIGDIR.'/vee_bindings.vim')
command! Sonviminit execute('source '.NVIM_CONFIGFILE)
command! Nviminit execute('e '.NVIM_CONFIGFILE)
command! Vsnviminit execute('vs '.NVIM_CONFIGFILE)
command! Spnviminit execute('sp '.NVIM_CONFIGFILE)

"command! Nvimcd execute('cd '.NVIM_CONFIGDIR)
command! Wso w | so %
command! Waso wa |so so %
" Automatically save the session when leaving Vim
"autocmd! VimLeave * mksession ~/Session.vim
command! SaveSession mksession! ~/Session.vim
" Automatically load the session when entering vim
"autocmd! VimEnter * source ~/Session.vim
command! LoadSession source ~/Session.vim
" set directory to current file's dir
command! Chdir cd %:p:h
""""""""""""""""""""
" FOREIGN COMMANDS "
""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
