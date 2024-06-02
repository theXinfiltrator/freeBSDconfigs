" basic configs
syntax on
filetype plugin indent on
set ts=2 sts=2 sw=2 et ai si
set rnu
set noshowmode

" tabs
set showtabline=2
nmap <silent> <C-n> :tabnext<CR>
nmap <silent> <C-p> :tabprev<CR>
imap <silent> <C-n> <esc><C-n>
imap <silent> <C-p> <esc><C-p>
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

" mouse
set mousehide
set mouse=nicr

" keybind to run code
set autowrite
autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:! clear; python3 %<CR>
autocmd Filetype rust nnoremap <buffer> <F5> :w<CR>:! clear && mkdir -p compiled_code && rustc % -o compiled_code/%:r && compiled_code/%:r<CR>
autocmd Filetype c nnoremap <buffer> <F5> :w<CR>:! clear && mkdir -p compiled_code && cc % -o compiled_code/%:r && compiled_code/%:r<CR>

" cursor shape change
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"
set ttimeout
set ttimeoutlen=0
set ttyfast

" backspace and highlight line in insert mode
" autocmd InsertEnter,InsertLeave * set cul!
set backspace=indent,eol,start

" vim plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-utils/vim-man'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" themes
set termguicolors
set background=dark
colorscheme onedark

hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi Normal guibg=NONE

" remove trailing white spaces
nnoremap <F9> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" enable ctrlp.vim
let g:ctrlp_map = '<F7>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
let g:ctrlp_full_path = 1
nnoremap <F7> :CtrlP<CR>


" tab completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() && coc#pum#info()['index'] != -1 ? coc#pum#confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
