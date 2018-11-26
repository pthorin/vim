call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier'
Plug 'ternjs/tern_for_vim'

"ctrlp/          deoplete/       syntastic/      vim-json/       
" delimitMate/    neomake/        vim-javascript/ 
"
" ctrlp.vim         neomake               vim-eunuch      vim-localvimrc        vim-tmux-navigator
" editorconfig-vim  syntastic             vim-format-js   vim-log-syntax        vim-unimpaired
" emmet-vim         tabular               vim-fugitive    vim-markdown-folding  vim-vinegar
" gitignore         typescript-vim        vim-hdevtools   vim-scala
" gtags.vim         vim-coffee-script     vim-indentwise  vim-signify
" javacomplete      vim-colors-solarized  vim-javascript  vim-skip
" lightline.vim     vim-css-color         vim-less        vim-surround



call plug#end()
" function to check if running on battery
function! MyOnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

" Prettier 
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0

if MyOnBattery() 
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml PrettierAsync
else 
  autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml PrettierAsync
endif
let mapleader  = ","
map <leader>p :PrettierAsync<CR>


set noerrorbells
set number
set backspace=indent,eol,start
set showcmd
set showmode
set noswapfile
set nobackup
set nowritebackup
set splitright
set encoding=utf-8
set autoread

set ic hls is smartcase
set tabstop=2 
set shiftwidth=2
set expandtab
set autoindent

colorscheme monokai

set ruler

set fileformats=unix,dos,mac "prefer unix over windows over os 9"

"syntax highlighting
syntax sync minlines=256
set synmaxcol=300
set re=1

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" mail line wrapping
au BufRead /tmp/mutt-* set tw=72

" better complete
" set completeopt=longest,menuone


" center the screen
nnoremap <space> zz
" center on next
nnoremap n nzzzv
nnoremap N Nzzzv
" act like D and C
nnoremap Y y$

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

au BufNewFile,BufRead *.vim setlocal et ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell et ts=2 sw=2
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.cpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.hpp setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.js setlocal expandtab ts=2 sw=2

" diff current file with original file
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" Quickfix shortcuts
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Finding files
set path+=**
set wildmenu

set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=node_modules                     " node modules
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" func! MyCtrlPTag()
"   let g:ctrlp_prompt_mappings = {
"         \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
"         \ 'AcceptSelection("t")': ['<c-t>'],
"         \ }
"   CtrlPBufTag
" endfunc
" command! MyCtrlPTag call MyCtrlPTag()
" 
" nmap <C-g> :MyCtrlPTag<cr>
" imap <C-g> <esc>:MyCtrlPTag<cr>
" 
" nmap <C-b> :CtrlPCurWD<cr>
" imap <C-b> <esc>:CtrlPCurWD<cr>

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Snippets
nnoremap ,grp iexec git push-to-target<ESC>

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'

" ==================== vim-json ====================

let g:vim_json_syntax_conceal = 0

" ==================== Completion =========================
" use deoplete for Neovim.
if has('nvim')
  let g:deoplete#enable_at_startup = 1

	" Use smartcase.
	call deoplete#custom#option('smart_case', v:true)
  	" <C-h>, <BS>: close popup and delete backword char.
	inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
	inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

  

  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  " tab or complete 
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " deoplete tab-complete

  
  " <CR>: accept complete
  " map <CR> pumvisible() ? "\<c-n><c-y> " : "\<CR>" 

"  let g:deoplete#ignore_sources = {}
"  let g:deoplete#ignore_sources._ = ['buffer', 'member', 'tag', 'file', 'neosnippet']
"  let g:deoplete#sources#go#sort_class = ['func', 'type', 'var', 'const']
"  let g:deoplete#sources#go#align_class = 1
"
"
"  " Use partial fuzzy matches like YouCompleteMe
"  call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy'])
"  call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
"  call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])
endif

" neomake
if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

" open the list automatically
let g:neomake_open_list = 2
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
