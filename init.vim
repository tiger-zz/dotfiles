" Simple base for config for nvim

" initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" plugins here
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'maxboisvert/vim-simple-complete'
Plug 'miyakogi/conoline.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/a.vim'
Plug 'Townk/vim-autoclose'

" Init plugin system
call plug#end()

" Colors
syntax on
set t_Co=256
set background=dark
colorscheme monokai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Tabbing
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set breakindent

" Highlight line
set cursorline
hi CursorLine term=bold cterm=bold

" Line Number
set number
set ruler

" Column marker
" set colorcolumn=80

" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='molokai'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#hunks#non_zero_only = 1

" Auto word wrap for txt files
au BufRead,BufNewFile *.txt setlocal textwidth=80

" Only highlight text over line 80
au BufReadPost,BufNewFile *.txt highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9 | match OverLength /\%>80v.\+/

" ConoLine settings
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1

" NERDTree settings
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

set pastetoggle=<F2>

" Toggle spellchecking
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <F3> :call ToggleSpellCheck()<CR>
