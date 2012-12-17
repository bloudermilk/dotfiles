""
"" Vundle
""

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle "gmarik/vundle"

Bundle "Rename2"
Bundle "VimClojure"
Bundle "altercation/vim-colors-solarized"
Bundle "bloudermilk/vim-protobuf"
Bundle "cakebaker/scss-syntax.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "kien/ctrlp.vim"
Bundle "mileszs/ack.vim"
Bundle "mmalecki/vim-node.js"
Bundle "nono/vim-handlebars"
Bundle "othree/html5.vim"
Bundle "pangloss/vim-javascript"
Bundle "scrooloose/nerdtree"
Bundle "tpope/vim-endwise"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-git"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-pathogen"
Bundle "tpope/vim-surround"
Bundle "vim-ruby/vim-ruby"

" Enable filetype plugins
filetype plugin indent on

""
"" Basic Setup
""

set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8
let mapleader = ","   " Remap the leader key

" Show crosshairs
set cursorline
set cursorcolumn

" Support mouse scrolling
set mouse=a

" Force yourself to use hjkl
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

" Highlights the 81st column
set colorcolumn=81

" Automatically remove trailing whitespace on save
" autocmd BufWritePre * :%s/\s\+$//e

" Keep the cursor in the middle
set scrolloff=50


""
"" Colors!
""

syntax enable
set background=dark
colorscheme solarized


""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""
"" Files
""

" Some file types should wrap their text
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=80
  set nolist
endfunction

" Markdown support
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()

" Treat JSON files like JavaScript
au BufRead,BufRead *.json set ft=javascript

" Syntax highlight Envfile
au BufRead,BufNewFile Envfile set ft=ruby


""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
map // :nohl<CR>

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  set statusline=%f\ %m\ %r
  set statusline+=Line:%l/%L
  set statusline+=\ Col:%v
endif

""
"" Mappings
""

" Tabs
map <C-l> :tabnext<CR>
map <C-h> :tabprevious<CR>
map <C-n> :tabnew<CR>

" Cycle between windows with tab
map <Tab> <C-W>w

" Split vertically and go to new window
map <Bar> <C-W>v<C-W><Right>

" Split horizontally and go to new window
map _ <C-W>s<C-W><Down>

""
"" Auto-create directories on save (http://stackoverflow.com/a/4294176/29297)
""

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

""
"" Other
""

set tabpagemax=100
set clipboard=unnamed

let NERDTreeHijackNetrw=1
