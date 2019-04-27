call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'             " use ctrl p to open files
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"Plug 'Shougo/deoplete.nvim'           " automatic autocomplete
Plug 'scrooloose/nerdtree'            " looking at files in folders / trees
Plug 'Xuyuanp/nerdtree-git-plugin'    " show git status in nerdtree
Plug 'neomake/neomake'                " automatic make / lint
Plug 'editorconfig/editorconfig-vim'  " use the project editor settings
Plug 'pangloss/vim-javascript'        " support for javascript
Plug 'prettier/vim-prettier'          " use the project prettier settings
Plug 'ternjs/tern_for_vim'            " go to defintion etc
Plug 'b4b4r07/vim-sqlfmt'             " format sql
Plug 'Yggdroot/indentLine'            " show indents
Plug 'godlygeek/tabular'              " tab things up
Plug 'gabrielelana/vim-markdown'        " markdown, depends on tabular
Plug 'chr4/nginx.vim'                 " nginx highlighting
Plug 'ntpeters/vim-better-whitespace' " show whitspace / clear whitespace
Plug 'tpope/vim-endwise'              " end control structures
Plug 'tpope/vim-fugitive'             " git plugin
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'         " show git gutter
Plug 'elzr/vim-json'                  " vim syntax
Plug 'terryma/vim-multiple-cursors'   " multiple cursors for multine line select etc
Plug 'mhinz/vim-sayonara'             " keep stuff nice
Plug 'stephpy/vim-yaml'               " faster yaml
Plug 'Raimondi/delimitMate'           " match '{[ etc
"Plug 'OmniSharp/omnisharp-vim'
Plug 'derekwyatt/vim-scala'
Plug 'eed3si9n/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
" colorschemes
Plug 'flazz/vim-colorschemes'
" fish
Plug 'dag/vim-fish'

call plug#end()
" function to check if running on battery
function! MyOnBattery()
  return ['1'] == ['0']
endfunction

" omnisharp
augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
  augroup END
" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" don't conceal " in json
let g:vim_json_syntax_conceal = 0

" sayonara ?
nnoremap <silent> <leader>q :Sayonara<CR>

" Prettier
let g:prettier#autoformat = 0
let g:prettier#quickfix_enabled = 0

if MyOnBattery()
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml PrettierAsync
else
  autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml PrettierAsync
endif

let mapleader  = ","
map <leader>p :PrettierAsync<CR>

" Language Server
" scala
set signcolumn=yes

let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'scala': ['node', expand('~/scripts/sbt-server-stdio.js')]
    \ }

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>

" Go to tag (defintion)
nmap <silent> <C-b> <C-]>


set noerrorbells
set number
set backspace=indent,eol,start
set showcmd
set showmode
set noswapfile
set nobackup
set nowritebackup
set splitright
set splitbelow
set encoding=utf-8
set autoread

set ic hls is smartcase
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

colorscheme PaperColor
set background=dark

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
au BufNewFile,BufRead *.md setlocal spell et ts=2 sw=2 foldenable! foldmethod=manual
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

" ==================== vim-markdown ====================

let g:vim_markdown_conceal = 0

" ==================== tabular  ===========================

if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
  nmap <leader>a\| :Tabularize /\|<CR>
  vmap <leader>a\| :Tabularize /\|<CR>
endif

" ==================== Completion =========================
" use deoplete for Neovim.
"if has('nvim')
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
" endif

" neomake
call neomake#configure#automake('nw', 1000)

" open the list automatically
let g:neomake_open_list = 2
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_sbt_maker = {
      \ 'exe': 'sbt',
      \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
      \ 'append_file': 0,
      \ 'auto_enabled': 1,
      \ 'output_stream': 'stdout',
      \ 'errorformat':
          \ '%E[%trror]\ %f:%l:\ %m,' .
            \ '%-Z[error]\ %p^,' .
            \ '%-C%.%#,' .
            \ '%-G%.%#'
     \ }
au BufWritePost *.scala Neomake! sbt

" sqlfmt
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"
