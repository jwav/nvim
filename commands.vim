""""""""""""""""""
" MY COMMANDS "
""""""""""""""""""

command! Bindings execute('e '.NVIM_CONFIGDIR.'/vee_bindings.vim')
command! Sonviminit execute('source '.NVIM_CONFIGFILE)
command! Nviminit execute('e '.NVIM_CONFIGFILE)
command! Vsnviminit execute('vs '.NVIM_CONFIGFILE)
command! Spnviminit execute('sp '.NVIM_CONFIGFILE)

command! FoldCpp setlocal foldmethod=syntax foldnestmax=2
command! FoldPython setlocal foldmethod=indent foldnestmax=2
command! FoldVim setlocal foldmethod=indent foldnestmax=1

"command! Nvimcd execute('cd '.NVIM_CONFIGDIR)
command! Wso w | so %
command! Waso wa |so so %
" Automatically save the session when leaving Vim
"autocmd! VimLeave * mksession ~/Session.vim
"command! SaveSession mksession! ~/Session.vim
command! -nargs=* SaveSession call SaveSession(<f-args>)
" Automatically load the session when entering vim
"autocmd! VimEnter * source ~/Session.vim
"command! LoadSession source ~/Session.vim
command! -nargs=* LoadSession call LoadSession(<f-args>)
command! ListSessions execute('vs '.NVIM_SESSIONSDIR)
" set directory to current file's dir
command! Chdir cd %:p:h

function SaveSession(...)
    " arguments memo by analogy with python : ...=*args, a:0=len(args) , a:1=args[0], a:2=args[1], ...
    let filename = g:NVIM_SESSIONSDIR.'/Session.session'
    if a:0 >= 1
        let filename = g:NVIM_SESSIONSDIR.'/Session_'.a:1.'.session'
    endif
    execute('mksession! '.filename)
    echo 'Saved session as '.filename
endfunction

function LoadSession(...)
    let filename = g:NVIM_SESSIONSDIR.'/Session.session'
    if a:0 >= 1
        let filename = g:NVIM_SESSIONSDIR.'/Session_'.a:1.'.session'
    endif
    execute('source '.filename)
    echo 'Loaded session '.filename
endfunction

""""""""""""""""""""
" GLEANED COMMANDS "
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
