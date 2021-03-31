"""""""""""""""""""""""""""""
" vee's generic keybindings "
"""""""""""""""""""""""""""""

let mapleader = " "
let g:mapleader = "\<Space>"
" You can't stop me
cmap w!! w !sudo tee %
nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <leader>f <C-]>
nnoremap <leader>= gg=G<c-o><c-o>
": disable autocomment
nnoremap <leader>cro :setlocal formatoptions-=cro<cr>
" cnext : next make error
nnoremap <leader>n :cnext<cr>
nnoremap <leader>N :cprev<cr>
" Toggle paste mode on and off
nnoremap <leader>pm :setlocal paste!<cr>
" Fast saving
nnoremap <leader>ww :w!<cr>
nnoremap <A-w> :w<cr>
nnoremap <leader>wa :wa!<cr>
nnoremap <leader>wq :wq!<cr>
" quick write and make
nnoremap <leader>wm :wa<cr>:make<cr>
nnoremap <leader>ws :wa<cr>:so %<cr>
" Disable highlight when <leader><cr> is pressed
nnoremap <silent> <leader><cr> :noh<cr>
nnoremap <silent> <leader><leader> :noh<cr>
" fast replace current word
""nnoremap <a-s> :%s/\<<C-r><C-w>\>//ge<Left><Left><Left>
nnoremap <leader>s :%s/\<<C-r><C-w>\>//ge<Left><Left><Left>
" fast project refactor. Do :args *.*pp to select .cpp and .hpp files beforehand
nnoremap <leader>R :argdo %s/\<<C-r><C-w>\>//gce<Left><Left><Left><Left>
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gce<Left><Left><Left><Left>
vnoremap <leader>r :%s/\<<C-r><C-w>\>//gce<Left><Left><Left><Left>
" Alternate way to save
nnoremap <C-s> :w<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" repeat action without having to press shift
" TODO: removed for which reason again?
"nnoremap ; .
"""""""""""""""
" insert mode "
"""""""""""""""

" In insert or command mode, move normally by using Ctrl
inoremap <A-h> <Left>
inoremap <A-j> <Down>
inoremap <A-k> <Up>
inoremap <A-l> <Right>
inoremap <A-e> <Esc>ea
inoremap <A-b> <Esc>bi
inoremap <A-d> <DEL>
inoremap <A-s> <BS>
inoremap <A-_> <Esc>I
inoremap <A-a> <Esc>A
inoremap <a-s-I> <Esc>I
inoremap <a-s-0> <Esc>0i
" inser new line without disrupting the current line
inoremap <A-m> <Esc>o
inoremap <A-M> <Esc>O

inoremap <A-u> <Esc>
inoremap <A-i> <Esc>
inoremap <A-o> <Esc>

inoremap <A-w> <Esc>:w<CR>a
inoremap <A-t> `


"""""""""""""""
" normal mode "
"""""""""""""""
nnoremap & 1
nnoremap é 2
nnoremap - 6
nnoremap è 7
nnoremap ç $
nnoremap à 0
nnoremap <leader>& 1
nnoremap <leader>é 2
nnoremap <leader>" 3
nnoremap <leader>' 4
nnoremap <leader>( 5
nnoremap <leader>- 6
nnoremap <leader>è 7
nnoremap <leader>_ 8
nnoremap <leader>ç 9
nnoremap <leader>à 0
"nnoremap dç d$
"nnoremap dà d0
"nnoremap yç y$
"nnoremap cç c$
"nnoremap cà c0
nnoremap gb G
" moving normally within a wrapped line
" WARNING might cause problems.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" move faster with A-j and A-k in normal mode
nnoremap <a-j> 5j
nnoremap <a-k> 5k
vnoremap <a-j> 5j
vnoremap <a-k> 5k

nnoremap <a-b> 3b
nnoremap <a-e> 3e
vnoremap <a-b> 3b
vnoremap <a-e> 3e

nnoremap <a-i> 0
nnoremap <a-a> $
vnoremap <a-i> 0
vnoremap <a-a> $
" insert lines without entering insert mode
nnoremap <A-o> o<Esc>k
nnoremap <A-O> O<Esc>j

" YANKING, CUTTING, PASTING, DELETING

" by default, never buffer when deleting. Only dd and d in visual mode should buffer
nnoremap x "_x
nnoremap s "_s
nnoremap ds "_dd
nnoremap de "_de
"nnoremap d$ "_d$
nnoremap da "_d$
nnoremap cd "_cc<Esc>
nnoremap ce "_ce
nnoremap ca "_c$

" precede by <leader> to yank with de and da (d$)
nnoremap <leader>de de
nnoremap <leader>da d$
nnoremap <leader>ce ce
nnoremap <leader>ca c$

nnoremap U <c-r>
nnoremap x "_x
nnoremap s "_s
"nnoremap ds "_dd
nnoremap de "_de
nnoremap d$ "_d$
nnoremap da "_d$
nnoremap <leader>de de
nnoremap <leader>da da
nnoremap cd "_cc<Esc>
nnoremap ce "_ce
nnoremap ca "_c$
nnoremap D "_dd
nnoremap dx "_dd
nnoremap dc "_dd
nnoremap <leader>dd "_dd
nnoremap d<space> "_dd

" VISUAL MODE
"go to last character of selection after yanking
vnoremap Y y`]
vnoremap x "_x
vnoremap s "_s
vnoremap c "_c

" yank and paste in OS clipboard
nnoremap <A-y> "+yy
nnoremap <A-p> "+p
nnoremap <A-P> "+P
vnoremap <A-y> "+y
vnoremap <A-p> "+p
vnoremap <A-p> "+P
inoremap <c-v> <esc>"+pa

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap H <C-W>h
nnoremap L <C-W>l
"closing window
nnoremap <A-x> :q<CR>

"folding
nnoremap zz za
nnoremap zk zc
nnoremap zj zo
nnoremap ze zo
nnoremap za zc
nnoremap zr zR
nnoremap zm zM

"""""""""""
" buffers "
"""""""""""

nnoremap <leader>bb :buffers<cr>
nnoremap <leader>bd :Bclose<cr>:tabclose<cr>gT
nnoremap <leader>ba :bufdo bd<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>h :bprevious<cr>

""""""""
" tabs "
""""""""

nnoremap <leader>tn :tabnew<cr>
nnoremap <leader>to :tabonly<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tm :tabmove +1<cr>
nnoremap <leader>tM :tabmove -1<cr>
"nnoremap <leader>t<leader> :tabnext 
nnoremap gr gT
nnoremap <A-l> gt
nnoremap <A-h> gT
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remove the Windows ^M - when the encodings gets messed up
nnoremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"""""""""""
" COMMAND MODE "
"""""""""""
cnoremap <a-i> <C-c>
cnoremap <a-u> <C-c>
cnoremap <a-o> <C-c>
cnoremap <A-h> <Left>
cnoremap <A-j> <Down>
cnoremap <A-k> <Up>
cnoremap <A-l> <Right>
cnoremap <A-m> <CR>
cnoremap <A-a> <END>
cnoremap <A-_> <HOME>
cnoremap <A-d> <DEL>
cnoremap <A-s> <BS>

""""""""""""
" TERMINAL "
""""""""""""
tnoremap <Esc> <C-\><C-n>
tnoremap <a-i> <C-\><C-n>
tnoremap <a-u> <C-\><C-n>
tnoremap <a-o> <C-\><C-n>
tnoremap <A-h> <Left>
tnoremap <A-j> <Down>
tnoremap <A-k> <Up>
tnoremap <A-l> <Right>
tnoremap <A-e> <C-\><C-n>>ea
tnoremap <A-b> <C-\><C-n>bi
tnoremap <A-d> <DEL>
tnoremap <A-s> <BS>
tnoremap <A-_> <C-\><C-n>I
tnoremap <A-a> <C-\><C-n>A
tnoremap <A-m> <CR>
" in terminal mode, use c-h, c-j, c-k, c-l to change buffer even in insert mode
tnoremap <c-h> <C-\><C-n><C-w>h
tnoremap <c-j> <C-\><C-n><C-w>j
tnoremap <c-k> <C-\><C-n><C-w>k
tnoremap <c-l> <C-\><C-n><C-w>l

