set nocompatible              " be iMproved, required
filetype off                  " required

"execute('source /Logiciels/Travail/Vim/vee_plugins.vim')

try
    call plug#begin()
    Plug 'preservim/nerdtree'

    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'scrooloose/syntastic'

    "Plug 'roxma/nvim-completion-manager'
    "Plug 'roxma/ncm-clang'

    "let g:python3_host_prog='C:\Users\jwavresky\AppData\Local\Microsoft\WindowsApps\python3.exe'

    Plug 'ervandew/supertab'
    "Plug 'metalelf0/supertab'
    call plug#end()
catch
    echo 'Failed to load plugins'
endtry

" Enable filetype plugins
filetype plugin on
filetype indent on

" coc plugin settings
"execute('source ~/AppData/Local/nvim/coc_settings.vim')
try
    execute('source /Logiciels/Travail/Vim/vee_bindings.vim')
catch
    echo 'Failed to load key bindings'
endtry

" C indentation
set cino=g-1 "don't indent after public/private
set cino+=N-s " don't indent namespaces
set tabstop=4
setlocal foldmethod=syntax
set foldnestmax=1
set formatoptions-=cro " disable auto comment on new line
set mouse=a " enabled mouse click and selection
set number relativenumber " hybrid line numbers in current buffers, non-relative in others
set history=500 " Sets how many lines of history VIM has to remember
set autoread " Set to auto read when a file is changed from the outside
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
let $LANG='en' " Avoid garbled characters in Chinese language windows OS
set langmenu=en
" supposed to take care of not being able to paste from WIndows clipboard
" from https://www.reddit.com/r/neovim/comments/cegt9j/copy_paste_not_working_in_neovim/
set clipboard^=unnamed,unnamedplus

" ??? WTF is this
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

set wildmenu " Turn on the Wild menu

" Ignore compiled files
"set wildignore=*.o,*~,*.pyc
"if has("win16") || has("win32")
"    set wildignore+=.git\*,.hg\*,.svn\*
"else
"    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
"endif

set ruler "Always show current position
set cmdheight=2 " Height of the command bar
set hid " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase
"set smartcase " When searching try to be smart about cases 
set hlsearch " Highlight search results
set incsearch " Makes search act like search in modern browsers
set lazyredraw " Don't redraw while executing macros (good performance config)
set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets
set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    "colorscheme desert
    "colorscheme torte
    "colorscheme dracula
    colorscheme industry
catch
endtry
" better fold bars
highlight Folded guibg=#004020 guifg=LightSkyBlue

"set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

set ffs=unix,dos,mac " Use Unix as the standard file type


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent
"set cindent
set smartindent 
set wrap

" Make it so that a curly brace automatically inserts an indented line
"inoremap {<CR> {<CR>}<Esc>O<BS><Tab>


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

command! Sovimrc source /Logiciels/Travail/Vim/_vimrc
command! Vimrc e /Logiciels/Travail/Vim/_vimrc
command! Vimcd cd /Logiciels/Travail/Vim/
command! Sonviminit source /Users/jwavresky/AppData/Local/nvim/init.vim
command! Nviminit e /Users/jwavresky/AppData/Local/nvim/init.vim
command! Vsnviminit vs /Users/jwavresky/AppData/Local/nvim/init.vim
command! Spnviminit sp /Users/jwavresky/AppData/Local/nvim/init.vim

command! Nvimcd cd /Users/jwavresky/AppData/Local/nvim/
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


" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

set pastetoggle=<F3>

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

"" Vim with all enhancements
"source $VIMRUNTIME/vimrc_example.vim
"
"" Use the internal diff if available.
"" Otherwise use the special 'diffexpr' for Windows.
"if &diffopt !~# 'internal'
"  set diffexpr=MyDiff()
"endif
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg1 = substitute(arg1, '!', '\!', 'g')
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg2 = substitute(arg2, '!', '\!', 'g')
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let arg3 = substitute(arg3, '!', '\!', 'g')
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      if empty(&shellxquote)
"        let l:shxq_sav = ''
"        set shellxquote&
"      endif
"      let cmd = '"' . $VIMRUNTIME . '\diff"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  let cmd = substitute(cmd, '!', '\!', 'g')
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"  if exists('l:shxq_sav')
"    let &shellxquote=l:shxq_sav
"  endif
"endfunction
"
" cursor line in insert mode
"autocmd InsertEnter,InsertLeave * set cul!
"Ps = 0  -> blinking block.
"Ps = 1  -> blinking block (default).
"Ps = 2  -> steady block.
"Ps = 3  -> blinking underline.
"Ps = 4  -> steady underline.
"Ps = 5  -> blinking bar (xterm).
"Ps = 6  -> steady bar (xterm).
"let &t_SI = '\e[2 q'
"let &t_EI = '\e[1 q'
"set guicursor+=n-v-c:blinkon0
"
setglobal formatoptions-=cro
set formatoptions-=cro
setlocal formatoptions-=cro
au VimEnter * GuiPopupmenu 0
highlight Pmenu ctermbg=darkgreen guibg=darkgreen

fun! SetMyTodos()
    syn match myTodos /\%(FIXME\)\|\%(NOTE\)|\%(TESTME\)/
    hi link myTodos Todo
endfu
autocmd bufenter * :call SetMyTodos()
autocmd filetype * :call SetMyTodos()

