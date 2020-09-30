"TODO: write an explicit coc config. See https://www.youtube.com/watch?v=OXEVhnY621M for reference

if has('win32')
    let NVIM_CONFIGDIR = '~/AppData/Local/nvim'
else
    let NVIM_CONFIGDIR = '~/.config/nvim'
endif
let NVIM_CONFIGFILE = NVIM_CONFIGDIR . '/init.vim'
let NVIM_SESSIONSDIR = NVIM_CONFIGDIR . '/sessions'

autocmd BufEnter * silent! lcd %:p:h

if has('unix')
    " General Settings
    source ~/.config/nvim/plugins.vim
    source ~/.config/nvim/commands.vim
    source ~/.config/nvim/mappings.vim
    source ~/.config/nvim/settings.vim

    "colorscheme industry
    set background=dark
    source ~/.config/nvim/themes/onedark.vim


    " Plugin Configuration
    "source ~/.config/nvim/plug-config/rnvimr.vim
    source ~/.config/nvim/plug-config/fzf.vim
    " source ~/.config/nvim/plug-config/vim-commentary.vim
    "source ~/.config/nvim/plug-config/rainbow.vim
    source ~/.config/nvim/plug-config/codi.vim
    source ~/.config/nvim/plug-config/quickscope.vim
    source ~/.config/nvim/plug-config/which-key.vim
    "source ~/.config/nvim/plug-config/vim-wiki.vim
    "source ~/.config/nvim/plug-config/sneak.vim
    source ~/.config/nvim/plug-config/coc.vim
    "source ~/.config/nvim/plug-config/goyo.vim
    "source ~/.config/nvim/plug-config/vim-rooter.vim
    "source ~/.config/nvim/plug-config/start-screen.vim
    "source ~/.config/nvim/plug-config/gitgutter.vim
    "source ~/.config/nvim/plug-config/closetags.vim
    "source ~/.config/nvim/plug-config/floaterm.vim
    "source ~/.config/nvim/plug-config/vista.vim
    "source ~/.config/nvim/plug-config/xtabline.vim
    "source ~/.config/nvim/plug-config/polyglot.vim
    "source ~/.config/nvim/plug-config/far.vim
    "source ~/.config/nvim/plug-config/tagalong.vim
    "source ~/.config/nvim/plug-config/illuminate.vim
    "source ~/.config/nvim/plug-config/bracey.vim
    "source ~/.config/nvim/plug-config/asynctask.vim
    "source ~/.config/nvim/plug-config/window-swap.vim
    "source ~/.config/nvim/plug-config/markdown-preview.vim
    "luafile ~/.config/nvim/lua/plug-colorizer.lua
elseif has('win32')
    " General Settings
    source ~/AppData/Local/nvim/plugins.vim
    source ~/AppData/Local/nvim/commands.vim
    source ~/AppData/Local/nvim/mappings.vim
    source ~/AppData/Local/nvim/settings.vim

    set background=dark
    source ~/AppData/Local/nvim/themes/onedark.vim
    highlight Normal guibg=#0101010
    source ~/AppData/Local/nvim/themes/myairline.vim

    " Plugin Configuration
    "source ~/AppData/Local/nvim/plug-config/rnvimr.vim
    source ~/AppData/Local/nvim/plug-config/fzf.vim
    " remove one of those at some point;make a choice
    source ~/AppData/Local/nvim/plug-config/vim-commentary.vim
    source ~/AppData/Local/nvim/plug-config/nerd-commenter.vim
    "source ~/AppData/Local/nvim/plug-config/rainbow.vim
    source ~/AppData/Local/nvim/plug-config/codi.vim
    source ~/AppData/Local/nvim/plug-config/quickscope.vim
    source ~/AppData/Local/nvim/plug-config/which-key.vim
    "source ~/AppData/Local/nvim/plug-config/vim-wiki.vim
    "source ~/AppData/Local/nvim/plug-config/sneak.vim
    source ~/AppData/Local/nvim/plug-config/coc.vim
    "source ~/AppData/Local/nvim/plug-config/goyo.vim
    "source ~/AppData/Local/nvim/plug-config/vim-rooter.vim
    "source ~/AppData/Local/nvim/plug-config/start-screen.vim
    "source ~/AppData/Local/nvim/plug-config/gitgutter.vim
    "source ~/AppData/Local/nvim/plug-config/closetags.vim
    "source ~/AppData/Local/nvim/plug-config/floaterm.vim
    "source ~/AppData/Local/nvim/plug-config/vista.vim
    "source ~/AppData/Local/nvim/plug-config/xtabline.vim
    "source ~/AppData/Local/nvim/plug-config/polyglot.vim
    "source ~/AppData/Local/nvim/plug-config/far.vim
    "source ~/AppData/Local/nvim/plug-config/tagalong.vim
    "source ~/AppData/Local/nvim/plug-config/illuminate.vim
    "source ~/AppData/Local/nvim/plug-config/bracey.vim
    "source ~/AppData/Local/nvim/plug-config/asynctask.vim
    "source ~/AppData/Local/nvim/plug-config/window-swap.vim
    "source ~/AppData/Local/nvim/plug-config/markdown-preview.vim
    "luafile ~/AppData/Local/nvim/lua/plug-colorizer.lua
endif

"
"" General Settings
"execute('source '.NVIM_CONFIGDIR.'/plugins.vim')
"execute('source '.NVIM_CONFIGDIR.'/settings.vim')
"execute('source '.NVIM_CONFIGDIR.'/commands.vim')
"execute('source '.NVIM_CONFIGDIR.'/mappings.vim')
"
""colorscheme industry
"set background=dark
"execute('source '.NVIM_CONFIGDIR.'/themes/onedark.vim')
""colorscheme desert
""colorscheme torte
""colorscheme dracula
"
"" Plugin Configuration
""execute('source '.NVIM_CONFIGDIR.'/plug-config/rnvimr.vim')
"execute('source '.NVIM_CONFIGDIR.'/plug-config/fzf.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/vim-commentary.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/rainbow.vim')
"execute('source '.NVIM_CONFIGDIR.'/plug-config/codi.vim')
"execute('source '.NVIM_CONFIGDIR.'/plug-config/quickscope.vim')
"execute('source '.NVIM_CONFIGDIR.'/plug-config/which-key.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/vim-wiki.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/sneak.vim')
"execute('source '.NVIM_CONFIGDIR.'/plug-config/coc.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/goyo.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/vim-rooter.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/start-screen.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/gitgutter.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/closetags.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/floaterm.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/vista.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/xtabline.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/polyglot.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/far.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/tagalong.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/illuminate.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/bracey.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/asynctask.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/window-swap.vim')
""execute('source '.NVIM_CONFIGDIR.'/plug-config/markdown-preview.vim')
""execute('luafile '.NVIM_CONFIGDIR.'/lua/plug-colorizer.lua')
"let NVIM_CONFIGDIR = '~/.config/nvim'
"let NVIM_CONFIGFILE = NVIM_CONFIGDIR . '/init.vim'
