call plug#begin()

" if has('nvim')
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
" else
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" endif

Plug 'mileszs/ack.vim'
Plug 'lokikl/vim-ctrlp-ag'
Plug 'ctrlpvim/ctrlp.vim'                       " use ctrl p to open files

Plug 'scrooloose/nerdtree'                      " looking at files in folders / trees
Plug 'Xuyuanp/nerdtree-git-plugin'              " show git status in nerdtree
Plug 'neomake/neomake'                          " automatic make / lint
Plug 'editorconfig/editorconfig-vim'            " use the project editor settings
Plug 'pangloss/vim-javascript'                  " support for javascript
" post install (yarn install | npm install) then load plugin only for editing supported files
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'ternjs/tern_for_vim'                      " go to defintion etc
Plug 'itspriddle/vim-shellcheck'                " shellcheck
                                                " Plug 'b4b4r07/vim-sqlfmt'                                      " format sql
Plug 'Yggdroot/indentLine'                      " show indents
Plug 'godlygeek/tabular'                        " tab things up
Plug 'gabrielelana/vim-markdown'                " markdown, depends on tabular
Plug 'previm/previm' " preview markdown in browser
let g:previm_open_cmd = 'xdg-open'
Plug 'ntpeters/vim-better-whitespace'           " show whitspace / clear whitespace
Plug 'tpope/vim-endwise'                        " end control structures
Plug 'tpope/vim-fugitive'                       " git plugin
Plug 'tpope/vim-git'
Plug 'tpope/vim-commentary'                     " gcc to comment line
Plug 'tpope/vim-surround'                       " ys, cs, ds, S
Plug 'tpope/vim-unimpaired'
" Plug 'junegunn/gv.vim'                                         " git Graph
" Plug 'AGhost-7/critiq.vim'                                     " PR viewer
Plug 'airblade/vim-gitgutter'                   " show git gutter
Plug 'whiteinge/diffconflicts'                  " better git diff conflicts
Plug 'elzr/vim-json'                            " vim syntax
" Plug 'terryma/vim-multiple-cursors'                            " multiple cursors for multine line select etc
Plug 'mhinz/vim-sayonara'                       " keep stuff nice
Plug 'stephpy/vim-yaml'                         " faster yaml
Plug 'Raimondi/delimitMate'                     " match '{[ etc
Plug 'janko/vim-test'                           " run tests
"Plug 'derekwyatt/vim-scala'
"Plug 'eed3si9n/LanguageClient-neovim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Completer, support for language server
Plug 'ryanoasis/vim-devicons'                   " icon support for different plugins using patched nerd font
Plug 'vim-airline/vim-airline'                  " Airline
Plug 'vim-airline/vim-airline-themes'           " and theme
Plug 'chrisbra/csv.vim'                         " csv filetype plugin
"Plug 'alvan/vim-closetag'                       " html close tags
"Plug 'mattn/emmet-vim'                          " enclose in tags
" typescript
Plug 'leafgarland/typescript-vim'               " provides syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'                 " support for jsx highlighting
Plug 'jparise/vim-graphql'                      " GraphQL syntax


" colorschemes
" Plug 'flazz/vim-colorschemes'
"Plug 'pthorin/cosme.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" set the leader straight away
let mapleader = " "

" copy / paste
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP"

" move between buffers
map <C-h> <Esc>:bprev<CR>
map <C-l> <Esc>:bnext<CR>
map <M-l> <Esc>:tabnext<CR>
map <M-h> <Esc>:tabprev<CR>

" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" autoformat
noremap <F5> :Autoformat<CR>
noremap <leader>r :Autoformat<CR>
"" scalafmt
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']
" scala comment indent
let g:scala_scaladoc_indent = 1

" powerline symbols
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'

" don't conceal " in json
let g:vim_json_syntax_conceal = 0

" sayonara ?
nnoremap <leader>q :Sayonara<CR>

" Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nmap <leader>rc :Prettier<cr>

" GitGutter
nnoremap <leader>gn :GitGutterNextHunk<cr> " go to next hunk
nnoremap <leader>gp :GitGutterPrevHunk<cr> " go to prev hunk
" lcl ccl (close lists)
nnoremap <leader>lcl :lcl<cr> " close location list
nnoremap <leader>ccl :ccl<cr> " close c list whatever it's called
nnoremap <leader>cc :cc<cr>   " display last error
nnoremap <leader>ll :ll<cr>   " display last error
nnoremap <leader>cl :CtrlPQuickfix<cr>   " display quickfixlist
nnoremap <leader>cn :cn<cr>
nnoremap <leader>ln :ln<cr>
nnoremap <leader>co :cope<cr>
nnoremap <leader>lo :lope<cr>

" Go to tag (defintion)
nmap <silent> <C-b> <C-]>

set omnifunc=syntaxcomplete#Complete

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
set fileencodings=ucs-bom,utf-8,default,cp437,latin1
set autoread

set ic hls is smartcase
set cursorline
set cursorcolumn
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set laststatus=2
set splitright
set splitbelow
set undofile
set showmatch

set background=dark

set ruler

set fileformats=unix,dos,mac "prefer unix over windows over os 9"

" read command into new buffer
command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:  ' . a:cmdline)
  call setline(2, 'Expanded to:  ' . expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  1
endfunction

command! -complete=file -nargs=* ScalaStyle call s:RunShellCommand('scalastyle -c /home/pt/repos/dotfiles/scalastyle_config.xml '.<q-args>)
command! -complete=file -nargs=* Codacy call s:RunShellCommand('codacy-analysis-cli analyse --tool codacy-scalameta-pro '.<q-args>)

"syntax highlighting
syntax sync minlines=256
set synmaxcol=300
set re=1

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L
" Set tabstop etc for java
autocmd FileType java setlocal ts=4 sw=4 sts=4

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" mail line wrapping
au BufRead /tmp/mutt-* set tw=72

" better complete
" set completeopt=longest,menuone


" center the screen
"nnoremap <space> zz
" center on next
nnoremap n nzzzv
nnoremap N Nzzzv
" act like D and C
nnoremap Y y$

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=60,72,80
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
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

  """
  nnoremap <c-f> :CtrlPag<cr>
  vnoremap <c-f> :CtrlPagVisual<cr>
  nnoremap <leader>ca :CtrlPagLocate
  nnoremap <leader>cp :CtrlPagPrevious<cr>
  let g:ctrlp_ag_ignores = '--ignore .git
        \ --ignore "deps/*"
        \ --ignore "_build/*"
        \ --ignore "node_modules/*"
        \ --ignore "tags"'
  " By default ag will search from PWD
  " But you may enable one of below line to use an arbitrary directory or,
  " Using the magic word 'current-file-dir' to use current file base directory
  let g:ctrlp_ag_search_base = 'current-file-dir'
  " let g:ctrlp_ag_search_base = 'app/controllers' " both relative and absolute path supported
endif

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10   " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

nmap <C-e> :CtrlPBuffer<cr>
nmap <C-i> :CtrlPTag<cr>
nmap <C-P> :CtrlPMRUFiles<cr>

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
let g:delimitMate_expand_tab = 0

" ==================== vim-json ====================

let g:vim_json_syntax_conceal = 0

" ==================== vim-markdown ====================

let g:vim_markdown_conceal = 0
let g:markdown_enable_spell_checking = 0

" ==================== tabular  ===========================

if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
  nmap <leader>a\| :Tabularize /\|<CR>
  vmap <leader>a\| :Tabularize /\|<CR>
endif


" Go to column 80
nmap <leader>w 80\|

" Insert current date
nmap <leader>dc i<C-r>=strftime('%F')<cr><esc>

" ==================== Completion =========================
" use deoplete for Neovim.
"if has('nvim')
"  let g:deoplete#enable_at_startup = 1
"
" " Use smartcase.
" call deoplete#custom#option('smart_case', v:true)
"   " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"
"
"
"
"  "autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"  " tab or complete
"
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

" sbt server
set signcolumn=yes

" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"     \ 'scala': ['node', expand('~/scripts/sbt-server-stdio.js')]
"     \ }
"
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>

" neomake
call neomake#configure#automake('nw', 1000)

" for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='com.speedledger'

" open the list automatically
" let g:neomake_open_list = 2
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" let g:neomake_sbt_maker = {
"       \ 'exe': 'sbt',
"       \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
"       \ 'append_file': 0,
"       \ 'auto_enabled': 1,
"       \ 'buffer_output': 1,
"       \ 'output_stream': 'stdout',
"       \ 'errorformat': '%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ \ required:%m,%C\ %#[error]\ \ found   :%m,%C\ %#[error]\ %p^,%-C%.%#,%Z,%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,%-G%.%#'
"      \ }
" au BufWritePost *.scala Neomake! sbt

          "\ '%E[%trror]\ %f:%l:\ %m,' .
          "  \ '%-Z[error]\ %p^,' .
          "  \ '%-C%.%#,' .
          "  \ '%-G%.%#'

" sqlfmt
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"

" tests
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" ctags
set tags=.git/tags,./.git/tags,./tags,tags
set notagrelative
nmap <C-F7> :!ctags -R -f ./.git/tags .<CR>
nmap <F31> :!ctags -R -f ./.git/tags .<CR>

" nerdtree
nnoremap <C-F9> :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>
" enable mouse
set mouse=a

" coc mappings
set hidden         " TextEdit might fail without this
set updatetime=300 " Recommended setting instead of default 4000
set shortmess+=c   " don't give |inc-completion-menu| messages
set cmdheight=2    " better display for messages
set signcolumn=yes " always show sign column

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader><F6> <Plug>(coc-rename)
" xmap <leader>r  <Plug>(coc-format-selected)
" nmap <leader>r  <Plug>(coc-format-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
map <leader>o :OR<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" improve tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" complete completion on enter
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" statusline
"set statusline=%<%f\ %h%m%r%=%{coc#status()}%=%-14.(%l,%c%V%)\ %P

"set efm=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%+C%.%#,%Z,
"set efm+=%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
"set efm+=%-G%.%#

" ALIASES
command! Gpraise Gblame
command! Q q
command! Gau !git add --update
command! Gcane !git commit --amend --no-edit
command! Gpf !git push --force-with-lease

" highlighting
syn keyword myTodo TODO FIXME XXX HACK
hi def link myTodo Todo

""" vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.xml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.xml'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,xml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js,xml'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 0

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
""" end vimclosetag

""" visual search text
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
""" end

" colorscheme
colorscheme dracula
highlight CursorLine ctermbg=016 cterm=NONE
hi Normal guibg=NONE ctermbg=NONE
