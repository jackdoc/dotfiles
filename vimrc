" John Dougherty

set nocompatible              " be iMproved, required
filetype off                  " required

" PLUGINS {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" autocomplete and syntax checking
Plugin 'Valloric/YouCompleteMe'

" git wrapper that helps with using git commands in vim
Plugin 'tpope/vim-fugitive'

" some nice mappings
Plugin 'tpope/vim-unimpaired'

" better markdown highlighting
Plugin 'tpope/vim-markdown'

" git gutter shows diffs and helps staging
Plugin 'airblade/vim-gitgutter'

" slick color palette
Plugin 'altercation/vim-colors-solarized'

" better looking status bar
Plugin 'vim-airline/vim-airline'

" themes for vim airline
Plugin 'vim-airline/vim-airline-themes'

" fuzzy file finder
Plugin 'kien/ctrlp.vim'

" move between vim and tmux panes seamlessly
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required

" }}} END PLUGINS

" APPEARANCE {{{

" set GUI font and font size
if has('gui_running')
  if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
      set guifont=Source\ Code\ Pro\ Medium:h14
    else
      set guifont=Source\ Code\ Pro\ for\ Powerline\ Semi-Bold
    endif
  endif
  " patched font for special powerline symbols
  let g:airline_powerline_fonts=1
else
  set t_Co=16
endif

" turn on syntax highlighting
syntax enable

" dark background style
set background=dark

if has("unix")
  let s:uname = system("uname -s")
  if s:uname != "Darwin\n"
    let g:solarized_termcolors=256
  endif
endif

" high visibility for special characters
let g:solarized_visibility='high'

" pretty colors
colorscheme solarized

" show trailing whitespace with a look of disapproval
set list listchars=trail:ಠ

" always show status bar
set laststatus=2

" line numbers
set number

" show last command
set showcmd

" horizontal line where cursor is
set cursorline

" color column 80
set colorcolumn=80

" more compact branch names for airline
" truncate long branch names to fixed length
let g:airline#extensions#branch#displayed_head_limit = 15
" feature/branch_name becomes branch_name
let g:airline#extensions#branch#format = 1

" disables showing hunks in airline
let g:airline#extensions#hunks#enabled = 0

" open tex files as LaTeX
let g:tex_flavor = "latex"

" }}} END APPEARANCE

" FUNCTIONALITY {{{

" allow switching buffers without saving changes
set hidden

" autocomplete menu for things like :e
set wildmenu

" search as characters are typed
set incsearch

" highlight matches
set hlsearch

" case insensitive search if all lowercase
set ignorecase
set smartcase

" disable scratch preview window
set completeopt-=preview

" set up indentation
set tabstop=2
set shiftwidth=2

" replace tabs with spaces as a sane person should
set expandtab

" allow erasing previously entered characters in insert mode
set backspace=2

" enable folding
set foldenable

" 0 = all folds closed, 99 = all folds open
set foldlevelstart=10

" max number of folds
set foldnestmax=10

" how folds are defined
set foldmethod=syntax       " global -> use syntax
setlocal foldmethod=marker  " this file -> use markers

" highlight matching {[( when cursor is over its twin
set showmatch

" disable modelines because of potential security vulnerability
set nomodeline

" root markers for ctrlp
let g:ctrlp_root_markers = ['.ctrlp']

" treat all numerals as decimal, regardless of leading zeros
set nrformats=

" interpret .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" }}} END FUNCTIONALITY

" CUSTOM MAPPINGS {{{

" remap <ESC> to jk
inoremap jk <Esc>

" move vertically by visual lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" use space to open/close folds
nnoremap <space> za

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Commenting these out to not conflict with vim-tmux-navigator plugin
" Uncomment if not using vim-tmux-navigator
" sane movement between windows
" nnoremap <C-H> <C-W><C-H>
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>

" remap arrow keys
" up and down do nothing for now
noremap <Up> <Nop>
noremap <Down> <Nop>
" left and right change indent level
noremap <Left> <<
noremap <Right> >>

" insert new lines without entering insert mode
nmap oo ojkk
nmap OO Ojkj

" change the working directory to the path of the current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" change the local working directory to the path of the current file
nnoremap <leader>lcd :lcd %:p:h<CR>:pwd<CR>

" working with tabs
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>te :tabe<CR>
nnoremap <leader>tq :tabclose<CR>

" scroll through command history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" }}} END CUSTOM MAPPINGS

" AUTOCOMMANDS {{{

" strip trailing whitespace when saving buffer
autocmd BufWritePre * silent! %s/\s\+$//

" }}} END AUTOCOMMANDS

