" == Plug configuration ================================================
"
" Specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" Colour schemes
"Plug 'dreamer/mustang-vim'
"Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'

" Built-in LSP support
Plug 'neovim/nvim-lsp'

" vim-airline
Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Gblame et consortes
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" == LSP configuration =================================================
:lua << END

require'nvim_lsp'.clangd.setup{}
require'nvim_lsp'.rls.setup{}

END

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" == clang-format =====================================================

" Integrate clang-format tool
map <C-K> :py3f ~/bin/clang-format.py<cr>
imap <C-K> <c-o>:py3f ~/bin/clang-format.py<cr>

" == Neovim configuration ==============================================

" Change invisible characters
set listchars=tab:»\ ,trail:·,eol:↲
set list

" Clear selection with ,/
nmap <silent> ,/ :let @/=""<CR>

" Enable line numbers
set number

" No wrapping by default
set nowrap

" Use my colorscheme
colorscheme iceberg

" Show trailing whitespace; does not work with colorcolumn
hi ExtraWhitespace ctermbg=red guibg=red

" Default yank register is same as system clipboard
set clipboard=unnamedplus

" == vim-airline =======================================================

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#mixed_indent_algo = 2
