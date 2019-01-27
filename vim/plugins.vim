" Plugins
" =======

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Editor
" ------
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale',
" Plugin 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'git submodule update --init --recursive && ./install.py --go-completer' }
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'quramy/tsuquyomi'
" Movement
" --------
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'airblade/vim-rooter'

" Git
" ---
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Go
" --
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }

" Javascript
" Plugin 'pangloss/vim-javascript'

" Lua
" ---
" Plugin 'tbastos/vim-lua'

" Ansible/Yaml
" ------------
Plugin 'pearofducks/ansible-vim'
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"


" Plugin configuration
" ====================


" fzf / start vim in a tmux session for this to take any effect
" -------------------------------------------------------------
autocmd VimEnter * command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '-i', <bang>0)

let g:fzf_layout = { 'up': '~60%' }
let g:fzf_action = { 'enter': 'tabe' }
" Customize fzf colors to match your color scheme
" -----------------------------------------------
let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }


" Use ag for :grep
"-----------------
" if executable('ag')
" 	set grepprg=ag\ --nogroup\ --nocolor
" 	set grepformat=%f:%l:%c:%m,%f:%l:%m
" endif


" Gutentags
" ---------
" let g:gutentags_ctags_tagfile = "./tags"
" let g:gutentags_enabled = 1


" vim-go
" ------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


" YCM
" ---
let g:ycm_collect_identifiers_from_tags_files = 1
 let g:ycm_autoclose_preview_window_after_completion = 1
 let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_semantic_triggers =  {
			\   'go' : ['.', 're!\w{1,}'],
			\ }


" Multiple cursors
" ----------------
" let g:multi_cursor_exit_from_visual_mode = 0
" let g:multi_cursor_exit_from_insert_mode = 0


" NerdCommenter
" -------------
let NERDSpaceDelims = 1


" NerdTree
" --------
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Javascript
"-----------
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" ALE
" ---
let g:ale_linters = {
			\   'scss': ['sasslint'],
			\}


" Airline
" -------
let g:airline_theme='sol'


" Colorschemes | light: fog, moria, soso, github | dark: clue, coffee, contrasty, darkblack, flatland, gryffin, jellyx, understated, up | solarized: sol
" ------------
colorscheme up


" Ansible - indentation adjustment
" -------------------------------
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType yaml.ansible setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType lua setlocal expandtab shiftwidth=2 softtabstop=2


