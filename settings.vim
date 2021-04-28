set nocompatible              " be iMproved, required
filetype off                  " required
if has('unix')
    let g:python3_host_prog = '/usr/bin/python3'
    let g:python_host_prog = '/usr/bin/python'
elseif has('win32')
    " let g:python3_host_prog = 'python3' " '~\AppData\Local\Microsoft\WindowsApps\python3.exe'
    " let g:python_host_prog = '~\AppData\Local\Microsoft\WindowsApps\python.exe'
    let g:python3_host_prog = 'C:\Users\jwavresky\scoop\shims\python3.exe'
    let g:python_host_prog = 'C:\Users\jwavresky\scoop\shims\python.exe'
endif
" Enable filetype plugins
filetype plugin on
filetype indent on
" C indentation
set cino=g-1 "don't indent after public/private
set cino+=N-s " don't indent namespaces
setlocal foldmethod=syntax
set foldnestmax=1
set formatoptions-=cro " disable auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" automatically set directory to current file's
autocmd BufEnter * silent! lcd %:p:h
set mouse=a " enabled mouse click and selection
set number relativenumber " hybrid line numbers in current buffers, non-relative in others
set history=500 " Sets how many lines of history VIM has to remember
set autoread " Set to auto read when a file is changed from the outside
set so=7 " Set 7 lines to the cursor - when moving vertically using j/k
let $LANG='en' " Avoid garbled characters in Chinese language windows OS
set langmenu=en
" ??? WTF is this
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC


set wildmenu " WTF is this
set incsearch " start searching before you're done typing



set pastetoggle=<F3>
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
"set background=dark
highlight Folded guibg=#004020 guifg=LightSkyBlue
highlight Comment cterm=bold
highlight Normal guibg=#0101010

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
" ???
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" enforce indent size of 4 spaces for Python. 
" default: setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8
" see $VIMRUNTIME/ftplugin/python.vim


autocmd FileType python setlocal tabstop=4
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
"au TabLeave * let g:lasttab = tabpagenr()
"
" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"" Delete trailing white space on save, useful for some filetypes ;)
"fun! CleanExtraSpaces()
"    let save_cursor = getpos(".")
"    let old_query = getreg('/')
"    silent! %s/\s\+$//e
"    call setpos('.', save_cursor)
"    call setreg('/', old_query)
"endfun
"
"if has("autocmd")
"    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
"endif


" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

setglobal formatoptions-=cro
setlocal formatoptions-=cro
set formatoptions-=cro
highlight Pmenu ctermbg=darkgreen guibg=darkgreen

fun! SetMyTodos()
    syn match myTodos /\%(FIXME\)\|\%(NOTE\)|\%(TESTME\)/
    hi link myTodos Todo
endfu
autocmd bufenter * :call SetMyTodos()
autocmd filetype * :call SetMyTodos()

" Set extra options when running in GUI mode
"if has("gui_running")
if exists('g:GuiLoaded')
" if 1
    " This is VIM stuff, doesn't work in Neovim
    "set guioptions-=T
    "set guioptions-=e
    "set t_Co=256
    "set guitablabel=%M\ %t
    "echo 'Gui loaded.'
    au VimEnter * GuiPopupmenu 0
    au VimEnter * GuiTabline 0
endif

set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language

set ffs=unix,dos,mac " Use Unix as the standard file type

""""""""""""""""""""""
" SETTINGS GRAVEYARD "
""""""""""""""""""""""
"
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
