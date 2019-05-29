" == Plug configuration ======================================================

" Specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Guess header for open C/C++ file
Plug 'vim-scripts/a.vim'

" My own colour scheme
Plug 'dreamer/mustang-vim'

" Rust file detection and syntax highlight
Plug 'rust-lang/rust.vim'

" Whitespace highlight done right
" includes handy commands :StripWhitespace and :ToggleWhitespace
Plug 'ntpeters/vim-better-whitespace'

" Gblame et consortes
Plug 'tpope/vim-fugitive'

" Language Server Protocol support
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Completion integration with deoplete.
" Optional, recommended by LanguageClient-neovim.
" FIXME no idea...
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Initialize plugin system
call plug#end()


" == LSP and related plugins =================================================

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['pyls'],
    \ }

"     'c': ['clangd'],
"     'cpp': ['clangd'],

" Enable deoplete code completion
let g:deoplete#enable_at_startup = 1

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Always show diagnostics/linter column
set signcolumn=yes

" Jump to definition
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>


" == Neovim configuration ====================================================

" Change invisible characters
set listchars=tab:»\ ,trail:·,eol:↲

" Clear selection with ,/
nmap <silent> ,/ :let @/=""<CR>

" Enable line numbers
set number

" No wrapping by default
set nowrap

" Use my colorscheme
colorscheme mustang

" Show trailing whitespace; does not work with colorcolumn
hi ExtraWhitespace ctermbg=red guibg=red

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


" == Filetype-specific options ================================================

" set syntax for .gitconfig .git/config gerrit's project.config etc…
autocmd BufRead,BufNewFile *config set filetype=dosini

" it's not exactly an ini file, but close enough
autocmd BufRead,BufNewFile *.toml set filetype=dosini

" pretend to be normal editor for markdown files
autocmd BufRead,BufNewFile *.md set wrap linebreak nolist
