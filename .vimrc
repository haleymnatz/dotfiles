"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugins!
"                            Managed with Vundle
"                     https://github.com/junegunn/vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

" ---------- Language Support ---------- "

" Create your own text objects (needed for 'nelstrom/vim-textobj-rubyblock')
Plugin 'kana/vim-textobj-user'

" Use for selecting ruby blocks
Plugin 'nelstrom/vim-textobj-rubyblock'

" Support for Ruby bundler
Plugin 'tpope/vim-bundler'
" It's like rails.vim without the rails

Plugin 'tpope/vim-rake'

" Ruby on Rails power tools
Plugin 'tpope/vim-rails'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Language syntax support for everythang
Plugin 'sheerun/vim-polyglot'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Linting for many languages
Plugin 'w0rp/ale'

" ---------- Visual/Formatting ---------- "

" Adds vertical lines to show indentation
Plugin 'Yggdroot/indentLine'

" Add color scheme theme for base16
Plugin 'chriskempson/base16-vim'

" For tomorrow-night-eighties theme
Plugin 'chriskempson/vim-tomorrow-theme'

" ---------- Functional ---------- "

" Pairs of handy bracket mappings
Plugin 'tpope/vim-unimpaired'

Plugin 'alvan/vim-closetag'

" Get separate words from snake_case, camelCase, and more
" https://github.com/chaoren/vim-wordmotion

" CtrlP fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

" Make plugin commands repeatable with .
" Plugin 'tpope/vim-repeat'

" Comment/uncomment lines with gc
Plugin 'tpope/vim-commentary'

" Plugins to consider in the future:
" surround.vim
" vim rspec
" nerdtree or other file tree
" ctags

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
" ---------- END Vundle ---------- "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Vim Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number relativenumber

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Use absolute numbers in insert mode or when buffer loses focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set statusline+=%F
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set ruler                             " show cursor position in status bar
set scrolloff=5                       " always see 5 lines around cursor when
set laststatus=2                      " always show status bar
syntax on
set autoindent
filetype indent on
runtime macros/matchit.vim            " Don't delete me

augroup reload_vimrc                  " Reload Vim when .vimrc is changed
  autocmd!
  autocmd bufwritepost $MYVIMRC nested source $MYVIMRC
augroup END

set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287

" Set tab lengths for ruby files
":autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

set expandtab                         " tabs are spaces
set softtabstop=2                     " number of columns in insert mode
set smartindent                       " indent files smartly
set ts=2 sw=2

autocmd BufWritePre * %s/\s\+$//e     " Remove trailing whitespace from files

" Set comment marker for ruby files
autocmd FileType ruby setlocal commentstring=#\ %s

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

nnoremap <Leader>p viwp
nnoremap :W :w

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

inoremap <Leader>m _
inoremap kj <ESC>

command! Q q

" Following three lines set cursor to block, underscore, and Ibeam
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Copy path of current file to clipboard
" This doesn't work - figure out why
" noremap \cp :let @+ = expand("%")<cr>

" Put contents of parens on their own newline and reindent
" (Need to have cursor inside of parens in normal mode)
" This one needs a little work
nnoremap \( ci(<cr><esc>Pa<cr><esc>Vkk=

" Check out r00k's mappings for pasting w/no paste mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set termguicolors
" colorscheme base16-eighties
" colorscheme Tomorrow-Night-Eighties
" colorscheme base16-harmonic-dark
" colorscheme base16-material
" colorscheme base16-irblack
" colorscheme base16-material-palenight
colorscheme base16-oceanicnext
" colorscheme base16-chalk
" Next line changes color of line numbers column
hi LineNr ctermfg=245 ctermbg=237 cterm=NONE guifg=#898989 guibg=#373737 gui=NONE
set colorcolumn=81
highlight ColorColumn  ctermfg=16 guifg=#000000 "rgb=0,0,0

" ------------------- FUNCTIONAL ------------------


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change IndentLine character
let g:indentLine_char = '|' " only works with files with UTF-8 encoding

" Change color of IndentLine line
" let g:indentLine_color_term = 239

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " CtrlP doesn't use caching
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_max_files = 0
" let g:ctrlp_max_depth

" gf opens in new tab for Rails.vim
" nnoremap gf <C-W>gf

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'

" ALE
let g:ale_list_vertical = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
\ 'css': ['prettier'],
\ 'javascript': ['eslint', 'prettier'],
\ 'ruby': ['brakeman', 'reek', 'rubocop'],
\ }
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '>>'
let g:ale_lint_on_text_changed ='never'      " Only linting on save and open
