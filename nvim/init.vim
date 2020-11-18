" Globals
syntax on
set nocompatible              " be iMproved, required 
filetype off                  " required
set encoding=utf-8
set gdefault      " Never have to type /g at the end of search / replace again
set nu rnu
set showcmd
set nohlsearch 

call plug#begin('~/.local/share/vim/plugged')

Plug 'tpope/vim-fugitive' 
Plug 'joshdick/onedark.vim' 
Plug 'liuchengxu/space-vim-dark' 
Plug 'tikhomirov/vim-glsl' 
Plug 'mileszs/ack.vim' 
Plug 'git://git.wincent.com/command-t.git' 
Plug 'rstacruz/sparkup', {'rtp': 'vim/'} 
Plug 'vim-scripts/indentpython.vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'morhetz/gruvbox' 
Plug 'prettier/vim-prettier' 
Plug 'lervag/vimtex' 
Plug 'ianks/vim-tsx' 
Plug 'sonph/onehalf', {'rtp':'vim/'} " theme 
Plug 'ap/vim-css-color' 
Plug 'vim-syntastic/syntastic' 
Plug 'scrooloose/nerdtree' 
Plug 'vim-airline/vim-airline' 
Plug 'tell-k/vim-autopep8' 
Plug 'tmhedberg/SimpylFold' 
Plug 'davidhalter/jedi-vim' 
Plug 'kien/ctrlp.vim' 
Plug 'suan/vim-instant-markdown' 
Plug 'vim-airline/vim-airline-themes' 
Plug 'dracula/vim', { 'as': 'dracula' } 
Plug 'vim-scripts/tComment' 
Plug 'vimwiki/vimwiki' 
Plug 'tpope/vim-surround' 
Plug 'vim-scripts/utl.vim' 
Plug 'tpope/vim-repeat' 
Plug 'vim-scripts/SyntaxRange' 
Plug 'honza/vim-snippets' 
Plug 'adriaanzon/vim-emmet-ultisnips' 
Plug 'SirVer/ultisnips' 

call plug#end()

" <space> leader 
let mapleader = " " 

" Folding
set foldmethod=indent 
set foldlevel=99

autocmd BufNewFile,BufRead *.md,*.txt,*.wiki,*.html,*.tex setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead CMakeLists.txt setlocal nospell

" Colors
colorscheme dracula
set termguicolors
set bg=dark
hi Normal guibg=NONE ctermbg=NONE 
hi LineNr ctermbg=NONE guibg=NONE
highlight BadWhitespace ctermbg=red guibg=darkred


" resize panes 
nnoremap <silent> <Right> :vertical resize -5<cr> 
nnoremap <silent> <Left> :vertical resize +5<cr> 
nnoremap <silent> <Up> :resize -5<cr> 
nnoremap <silent> <Down> :resize +5<cr>

" move along panes
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K> 
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H>

" Leader mappings 
nnoremap <leader>q @q 

nnoremap <leader>x :x<CR> 
nnoremap <leader>Xa :qa!<CR> 
nnoremap <leader>X :q!<CR> 

nnoremap <leader>ft :NERDTreeToggle<CR> 
nnoremap <leader>fr :e ~/.config/nvim/init.vim<CR> 
nnoremap <leader>fR :source ~/.config/nvim/init.vim<CR> 

nnoremap <leader>re :lnext<CR> 
nnoremap <leader>rE :lprevious<CR> 
nnoremap <leader><Tab> :b#<CR> 

nnoremap <leader>tn :tabn<CR> 
nnoremap <leader>lw :VimtexCountWords<CR> 
nnoremap <leader>lc :VimtexCompile<CR>

" File specific indentation
au Filetype c,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()   
	if (index(['vim','help'], &filetype) >= 0)     
		execute 'h '.expand('<cword>')   
	elseif (coc#rpc#ready())     
		call CocActionAsync('doHover')   
	else     
		execute '!' . &keywordprg . " " . expand('<cword>')   
	endif 
endfunction

" GoTo code navigation. 
nmap <leader>gD <Plug>(coc-declaration) 
nmap <leader>gd <Plug>(coc-definition) 
nmap <leader>gf :call <SID>show_documentation()<CR> 
nmap <leader>gr <Plug>(coc-references) 
nmap <leader>rf <Plug>(coc-fix-current) 
nmap <leader>rF <Plug>(coc-format)


" Plugins
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'path_html': '~/Documents/vimwiki_html/'}]
let g:UltiSnipsExpandTrigger="<c-o>" 
let g:UltiSnipsForwardTrigger="<c-j>" 
let g:UltiSnipsBackwardTrigger="<c-k>"
let g:tex_flavor = 'latex'


