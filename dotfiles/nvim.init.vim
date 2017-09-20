" == Plug configuration ======================================================

" Specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Guess header for open C/C++ file
Plug 'vim-scripts/a.vim'

" My own colour scheme
Plug 'dreamer/mustang-vim'

" Language Server Protocol support
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()


" == Neovim configuration ====================================================

" Change invisible characters
set listchars=tab:»\ ,trail:·,eol:↲

" Clear selection with ,/
nmap <silent> ,/ :let @/=""<CR>

" Enable line numbers
set number

" Use my colorscheme
colorscheme mustang

" Show trailing whitespace; does not work with colorcolumn
hi ExtraWhitespace ctermbg=red guibg=red
hi ColorColumn guibg=#2d2d2d ctermbg=233
au BufWinEnter * let w:m1=matchadd('ExtraWhitespace', '\s\+$', -1, -1)

" Default yank register is same as system clipboard
set clipboard=unnamedplus

" Unbind usual keys
" h
map <silent> <Left> <Esc>
" j
map <silent> <Down> <Esc>
" k
map <silent> <Up> <Esc>
" l
map <silent> <Right> <Esc>
" Ctrl D
map <silent> <PageDown> <Esc>
" Ctrl U
map <silent> <PageUp> <Esc>
" 0
map <silent> <Home> <Esc>
" $
map <silent> <End> <Esc>

