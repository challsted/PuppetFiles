"If viewing this file and it appears like with several '+-- X lines: ...' you
"can expand them easily by hovering over them and typeing ', ' or <leader><space>
"or just 'za'
"Colors {{{
set t_Co=256        "Terminal Colors set to 256
syntax on           "Creates better highlighting
colorscheme molokai "Uses the very nice looking 'molokai' thee
highlight Normal ctermfg=grey ctermbg=black
set background=dark
" }}}
"Spaceing, Tab Key, and Indention {{{
filetype indent on	" Activates indenting for files
filetype plugin on	" Activates plugins for file types
set autoindent      " Auto indenting
set smartindent		" Smarter indenting
set backspace=2 	" Backspace in insert mode works like normal editor
set expandtab		" 1 tab = 4 spaces
set shiftwidth=2	" 1 tab = 4 spaces
set tabstop=2		" Backspace over a full tab if tab is expanded to tabstop or expandtab
set softtabstop=2   " Backspace over a full tab if tab is expanded to tabstop or expandtab
set smarttab		" Uses 'smart' tabs
set showtabline=2   " Always display the tabline, even if there is only 1 tab
" }}}
"Writeing and backing up files {{{
set nobackup        " Get rid of annoying ~file
set nowb		    " Helps above
set noswapfile		" Helps above
" }}}
"Menu and Search {{{
set wildmenu		" Shows auto completed menu's
set wildmode=list:longest " Make 'wildmenu' behave a little nicer
set hlsearch		" Highlights search results
set incsearch       " Search characters as you type them
" }}}
"Layout of the actual editor {{{
set number          " Dosnt Show Line Number by default <Leader>n shows them
set cursorline		" Show location of cursor using a horizontal line
set ruler 		    " Shows current position
set noshowmode      " Prevents the 'mode' from showing (this is because airline does this for us) 
set laststatus=2	" Always show the status line
set lazyredraw      " Redraw the screen less, leading to faster response
if has('mouse')
    set mouse=a
endif
" }}}
"Search Optomization {{{
set ignorecase		" Ignores case when searching '/searchparam'
set smartcase		" Even with ignore case, still try to be smart about it
set showmatch		" Shows matching bracket when highlighting with cursor
" }}}
"Core Settings {{{
set encoding=utf8	" Sets default encoding to utf8, and en_US as default language
set autoread "Auto read a file when it is changed from the outside
" }}}
"Folding {{{
set foldenable      " Enables Folding
set foldlevelstart=10 " Opens the first 10 folds by default
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent " Tells vim to fold based on indent level
set modeline        " Turn ModeLine On
set modelines=1     " Checks last line for file specific commands via modeline
" }}}
" Key Remaps {{{
" Leader is comma
let mapleader=","

" The below sets NERDTree to Ctrl+N
map <C-n> :NERDTreeToggle<CR>

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Leader-space open/closes folds
nnoremap <leader><space> za

" Highlights last inserted text from insert mode in visual mode
nnoremap gV `[v`]

" Remove line numbers with ,n add them again with ,n 
nnoremap <silent> <leader>n :set invnumber<CR>

" :W (Capitol W) saves the file with sudo, needed when editing some files
command W w !sudo tee % > /dev/null

" Quick saving of files
nnoremap <leader>w :w!<CR>

"For lines longer then the screens width, treat them as seperate lines
map j gj
map k gk

" Enables spell check, but only after pressing ,ss
" Press ,ss again to disable
" Cloned from github.com/amix
map <leader>ss :setlocal invspell<CR>

" For those of us who sometimes have to edit files in windows in non-vim,
" remove the ^M at the end of line
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Map <F1> to <Esc> everywhere
map <F1> <Esc>
imap <F1> <Esc>
vmap <F1> <Esc>
nmap <F1> <Esc>

" Fix Common Spelling mistake of typeing q: instead of :q
nnoremap q: iq<Esc>

" Y yanks to end of line
nnoremap Y y$

" Run the entire file through the indent filter with <Leader>=
noremap <silent> <Leader>= :call Preserve("normal gg=G")<CR>

" Toggle paste mode with <Leader>p (need to turn it back off agian though!)
nnoremap <Leader>p :set invpaste paste?<CR>
" }}}
" Plugin Stuff {{{ 
" The syntax is 'Plug' single quote name of author/vim-plugin single quote. So
" for example 'bling/vim-airline' is https://github.com/bling/vim-airline
call plug#begin('~/plugins') " Starts using vim-plug https://github.com/junegunn/vim-plug
Plug 'bling/vim-airline' { 'dir': '~/plugins' } " This is a bar that shows current mode as well as ton of useful info
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle', 'dir': '~/plugins'  } " Tree file navigator
Plug 'tomasr/molokai' { 'dir': '~/plugins' } " Color scheme 'Molokai' for vim, since solarized is so touchy....
Plug 'godlygeek/csapprox' { 'dir': '~/plugins' } " Makes GVIM Color Schemes work in Terminal Vim
Plug 'scrooloose/syntastic' { 'dir': '~/plugins' } " Automatic Syntax Checking
Plug 'puppetlabs/puppet-syntax-vim', { 'for': 'puppet', 'dir': '~/plugins' } "Puppet Syntax Highlighting
Plug 'rodjek/puppet-lint', { 'for': 'puppet', 'dir': '~/plugins' } "Puppet Linter - experimental if it will install this way or not
call plug#end()     " Stops using vim-plug
" Additional Stuff for Plugins {{{
" Sets the Theme for Airline to "luna" find others here:
" https://github.com/blint/vim-airline/wiki/Screenshots 
let g:airline_theme='luna'

if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
" Syntastic Plugin Checkers {{{
let g:syntastic_check_on_open = 1 " Check on file open
let g:syntastic_check_on_wq = 0 " Dont check on :wq
let g:syntastic_enable_signs = 1 " Enable symbols listed below 
let g:syntastic_error_symbol = "X"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_warning_symbol = ">"
" Puppet {{{

" }}}
" }}}
" }}}
" }}}
" Do not edit below line unless you know what your doing
" vim: set foldmethod=marker foldlevel=0 :
