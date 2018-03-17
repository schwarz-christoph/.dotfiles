" This vim setup uses vundle for vim plugin management.
" Vundle installation:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" YouCompleteMe has to be installed after the first run of PluginInstall:
" ~/.vim/bundle/YouCompleteMe/install.sh --clang-completer
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.dotfiles/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_extra_conf_globlist = ['~/.dotfiles/*','!~/*']
let g:ycm_auto_trigger = 1
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_confirm_extra_conf = 1
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_max_num_candidates = 50
let g:ycm_max_num_identifier_candidates = 10
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

Plugin 'neomake/neomake'
autocmd! BufWritePost * Neomake

Plugin 'tpope/vim-surround'

" The airline setup uses the powerline fonts, installed from here:
" https://github.com/powerline/fonts
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='atomic'
let g:airline_powerline_fonts = 1

Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'Shougo/vimproc.vim'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" open nerdtree if no file was specified
autocmd StdinReadPre * let s:std_in=1
" toggle nerdtree with ctrl-n
map <silent> <C-n> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1

" Language or filetype specific plugins:

Plugin 'vim-latex/vim-latex'

au BufEnter *.tex set autowrite
let g:Tex_FoldedSections=""
let g:Tex_FoldedEnvironments=""
let g:Tex_FoldedMisc=""
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 -src-specials -interaction=nonstopmode $* && bibtex'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'okular --unique 2>/dev/null'
function! SyncTexForward()
	     let execstr = "silent !okular --unique %:p:r.pdf\\#src:".line(".")."%:p 2>/dev/null &"
	          exec execstr
		  redraw!
	  endfunction
	  nmap <Leader>f :call SyncTexForward()<CR>

if has("nvim")
	let g:vimtex_latexmk_progname = 'nvr'
endif

Plugin 'avakhov/vim-yaml'

Plugin 'rust-lang/rust.vim'

Plugin 'pangloss/vim-javascript.git'
Plugin 'elzr/vim-json'
Plugin 'leafgarland/typescript-vim.git'
autocmd BufNewFile,BufFilePre,BufRead *.tsx set filetype=typescript

Plugin 'idanarye/vim-vebugger'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'fatih/vim-go'
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Basic Behaviour
set wrap
set number
set cc=80
set encoding=utf-8
set mouse=a
set noswapfile
set nobackup
set nowb
set wildmenu

" Searching
set ignorecase
set smartcase

" Auto Update files
set autoread

" Color scheme settings, including color of extra whitespaces

" Set colors of neomake messages
autocmd ColorScheme * highlight NeomakeErrorMsg ctermfg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen
autocmd ColorScheme * highlight DiffAdd    cterm=bold ctermfg=2 ctermbg=27
autocmd ColorScheme * highlight DiffDelete cterm=bold ctermfg=2 ctermbg=27
autocmd ColorScheme * highlight DiffChange cterm=bold ctermfg=2 ctermbg=27
autocmd ColorScheme * highlight DiffText   cterm=bold ctermfg=2 ctermbg=88
colorscheme default

" Remove trailing whitespace for all but specified filetypes
fun! RemoveTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'ruby\|perl'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call RemoveTrailingWhitespace()

" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Set neomake errormsg sign
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_highlight_columns=0


" Reorder tabs on window resize
autocmd VimResized * wincmd =

" Copy-Paste from X-Buffer
set clipboard=unnamedplus

" Tag Navigation, relying on ctags
nmap <F3> g<C-]>

" Open Quickfix window at the bottom
:autocmd FileType qf wincmd J

" Auto filetype settings
filetype plugin indent on
syntax on

" Set Tab indentation rules for specified filetypes
" PEP8 python indentation
autocmd FileType python setlocal ts=4 sts=4 sw=4 tw=79 expandtab autoindent

autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType tex setlocal ts=4 sts=4 sw=4 spell spelllang=en

autocmd FileType c,cpp setlocal cindent ts=2 sts=2 sw=2 expandtab
