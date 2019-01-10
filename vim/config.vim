" Vim config
" ==========


set nocompatible
filetype on                  " required

syntax on
" set background=dark
set backspace=indent,eol,start
set backupcopy=yes
set clipboard=
set complete-=t
set history=500
set hlsearch
set ignorecase
set incsearch
set iskeyword-=/,.,-
set laststatus=2
set nu
set pastetoggle=<F5>
set ruler
set scrolloff=3
set showcmd
set showmatch
set statusline+=%*
if (exists("ALEGetStatusLine")) | set statusline+=%{ALEGetStatusLine()} | endif
set statusline+=%#warningmsg#
set tabpagemax=100
set tags=./tags
set t_Co=256
set wildmenu
set wildmode=longest,list


" Use <space> as <leader>
" -----------------------
let mapleader = "\<space>"


" Jump to the last position when reopening a file
" -----------------------------------------------
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") && expand('%:t') != 'COMMIT_EDITMSG' | exe "normal g'\"" | endif


" FixIndentation
" --------------
command! FixIndentation execute "normal! gg=G"


" Highlight tabs
" --------------
set list
set listchars=tab:»·
set listchars+=trail:·
set listchars+=extends:>
set listchars+=precedes:<


" Highlighting
" ------------
" highlight SpecialKey cterm=NONE ctermbg=NONE ctermfg=Blue
" highlight Visual cterm=NONE ctermbg=Yellow ctermfg=Black
highlight Search cterm=NONE ctermbg=Yellow ctermfg=Black
highlight IncSearch cterm=NONE ctermbg=Yellow ctermfg=Black


" Syntax highlighting for unknown file types
" ------------------------------------------
autocmd BufNewFile,BufRead *.tt setf html
autocmd BufNewFile,BufRead *.phtml setf html
autocmd BufNewFile,BufRead *.ejs setf html
autocmd BufNewFile,BufRead *.hubl setf jinja
autocmd BufNewFile,BufRead *.conf setf conf


" Make an educated guess on which file is an nginx config
" -------------------------------------------------------
au BufRead,BufNewFile *.nginx set ft=nginx
au BufRead,BufNewFile */etc/nginx/* set ft=nginx
au BufRead,BufNewFile */usr/local/nginx/conf/* set ft=nginx
au BufRead,BufNewFile nginx.conf set ft=nginx


" Indentation based on filetype
" -----------------------------
au Filetype apiblueprint setlocal ts=4 sts=4 sw=4 expandtab
au Filetype pug setlocal ts=2 sts=2 sw=2 expandtab


" Shortcuts
" =========


" Open fzf via <Ctrl-o>
" ---------------------
nmap <c-o> :Files<cr>


" Open fzf#ag via <Ctrl-f>
" ------------------------
nmap <c-f> :Ag!<space>
nmap <leader><c-f> :Ag! <cword><cr>


" Open directory view with <Ctrl-t>
" ---------------------------------
map <c-t> :NERDTreeToggle<cr>
imap <c-t> <esc>:NERDTreeToggle<cr>


" Configure multiple-cursors mapping
" ----------------------------------
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key = 'g<C-n>'
let g:multi_cursor_select_all_key = 'g<A-n>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'


" Write to a readonly file with :w!!
" ----------------------------------
cmap w!! w !sudo tee % >/dev/null


" Toggle comment with <Ctrl-/>
" ------------------------
map <c-_> <leader>c<space>
vmap <c-_> <leader>c<space>
imap <c-_> <esc><leader>c<space>


" Switch to next/previous buffer with <Alt-right/left>
" ----------------------------------------------------
nmap <silent> <a-right> gt<cr>
nmap <silent> <a-left>  gT<cr>


" Move lines up/down with <Alt-up/down>
" -------------------------------------
nnoremap <a-up> :m .-2<CR>==
nnoremap <a-down> :m .+1<CR>==
inoremap <a-up> <Esc>:m .-2<CR>==gi
inoremap <a-down> <Esc>:m .+1<CR>==gi
vnoremap <a-up> :m '<-2<CR>gv=gv
vnoremap <a-down> :m '>+1<CR>gv=gv


" Move by virtual lines when used without a count
" -----------------------------------------------
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')


" Always move by virtual lines when using arrow keys
" --------------------------------------------------
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk


" Jump to definition (go)
" -----------------------
au Filetype go nnoremap <c-b> :tab split <CR>:exe "YcmCompleter GoToDefinition"<CR>
au Filetype go nnoremap <c-b> :tab split <CR>:exe "GoDef"<CR>


" Needed for tmux and vim to play nice
" ------------------------------------
map <Esc>[A <Up>
map <Esc>[B <Down>
map <Esc>[C <Right>
map <Esc>[D <Left>

if &term =~ '256color'
	set t_ut=
endif

" Console movement
" ----------------
cmap <Esc>[A <Up>
cmap <Esc>[B <Down>
cmap <Esc>[C <Right>
c
