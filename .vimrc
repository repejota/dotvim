" Use vim improved by default and do not try to be backwards compatible.
set nocompatible

" Use utf-8 by default.
" Also prefered file format is unix with fallbacks to mac and dos.
set encoding=utf-8
set ffs=unix,mac,dos
set formatoptions-=tc

" Time out on key codes but not mappings.
" This makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Tabular information : 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" Better completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Cursorline
" Only show cursorline in the current window and in normal mode.
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END


"
" File types
"
" Don't detect file type
filetype off

"
" Vundle configuration
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'myusuf3/numbers.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'valloric/youcompleteme', { 'do': './install.py --clang-completer --gocode-completer --tern-completer --racer-completer' }
Plugin 'ervandew/supertab'

Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'klen/python-mode'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ


" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

"
" Syntax & Theme
"
set t_Co=256
let base16colorspace=256
set background=dark
colorscheme base16-default-dark
let g:solarized_base16 = 1
let g:promptline_preset = 'full'
let g:promptline_powerline_symbols = 1
let python_highlight_all=1
syntax on

"
" Mouse support
"
set mouse=a
" Hide the mouse cursor while typing
set mousehide
set mousefocus

"
" Searching and Patterns
"
set showmatch
set hlsearch                    " Highlight matches to the search
set ignorecase                  " Search is case insensitive
set smartcase                   " Search case sensitive if caps on
set incsearch                   " Show best match so far
" nnoremap <space> :noh<return>   " Press <space> to clear highlighted results.

"
" Display
"
set autoindent
set history=1000
set lazyredraw                  " Don't repaint when scripts are running
set ruler                       " Line numbers and column the cursor is on
set number                      " Show line numbering
set numberwidth=1               " Use 1 col + 1 space for numbers
set cursorline                  " Highlight the current line
set showbreak=↝\ \ \            " Show ↝ if line wraps
set vb t_vb=                    " No flash bell
set noerrorbells                " No beeps
set backspace=indent,eol,start
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set laststatus=2                " Always show status bar
set fillchars+=stl:\ ,stlnc:\
set wrap
set textwidth=0 wrapmargin=0

"
" Ruler at 80, 120 and 999 columns
"
let &colorcolumn="80,".join(range(120,999),",")

"
" Make sure Vim returns to the same line when you reopen a file.
"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     execute 'normal! g`"zvzz' |
                \ endif
augroup END


"
" Leader mapping
"
let mapleader = ","

" ,ln toggles line numbers
nnoremap <leader>ln :setlocal number!<cr>

" ,i toggles invisible characters
nnoremap <leader>i :set list!<cr>

" ,tn go to next tab
nnoremap <leader>tn :tabnext<cr>
" ,tp go to previous tab
nnoremap <leader>tp :tabprevious<cr>
" ,tt create new tab
nnoremap <leader>tt :tabnew!<cr>
" ,tw close tab
nnoremap <leader>tw :tabclose!<cr>

" ,wu up window
nnoremap <leader>wu <c-w>k<cr>
" ,wd down windows
nnoremap <leader>wd <c-w>j<cr>
" ,wn next window
nnoremap <leader>wn <c-w>l<cr>
" ,wp previous window
nnoremap <leader>wp <c-w>h<cr>

" ,<space> clear hightlight until next search
nnoremap <leader><space> :noh<cr>


"
" NerdTree Configuration
"
" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
let NERDTreeShowHidden=1
" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif
" ,t calls NERDTree plugin
:map ,t :NERDTreeToggle<cr>
" Close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" ControlP Configuration
"
" ,p calls ControlP plugin
:map ,p :CtrlP<cr>


"
" LightLine Configuration
"
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'component': { 'readonly': '%{&readonly?"":""}' },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '|', 'right': '|' }
    \ }

"
" Numbers Configuration
"
let g:numbers_exclude = ['tagbar', 'nerdtree']

"
" Vim Javascript configuration
"
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
set conceallevel=1

"
" Vim Go Configuration
"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
" Show type info for the word under your cursor
au FileType go nmap <Leader>gi <Plug>(go-info)
" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)


"
" Vim Markdown Configuration
"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1


"
" YouCompleteMe Configuration
"
let g:acp_enableAtStartup = 0
let g:ycm_always_populate_location_list = 0
let g:ycm_auto_trigger=1
let g:ycm_enable_diagnostic_highlighting=1
let g:ycm_enable_diagnostic_signs=1
let g:ycm_max_diagnostics_to_display=10000
let g:ycm_min_num_identifier_candidate_chars=0
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_open_loclist_on_ycm_diags=1
let g:ycm_show_diagnostics_ui=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_tags_files = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

