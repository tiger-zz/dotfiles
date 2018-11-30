set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Townk/vim-autoclose'
Plugin 'vim-syntastic/syntastic'
Plugin 'shiracamus/vim-syntax-x86-objdump-d'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'maxboisvert/vim-simple-complete'
Plugin 'miyakogi/conoline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/a.vim'
Plugin 'sickill/vim-monokai'
Plugin 'sheerun/vim-polyglot'
Plugin 'itchyny/vim-gitbranch'
" Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Colors
syntax on
set t_Co=256
set background=dark
colorscheme monokai
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Tabs

" set autoindent
" set smartindent
" set tabstop=2
" set shiftwidth=2

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Highlight line
set cursorline
hi CursorLine term=bold cterm=bold

" Line Number
set number
set ruler
" highlight LineNr ctermbg=grey37

" Column marker
" set colorcolumn=80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%>80v.\+/

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_mode_map = {'passive_filetypes': ['asm']}
set breakindent

" lightline settings
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'molokai',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

" Get y86 auto syntax highlighting
autocmd BufNewFile,BufRead *.ys set syntax=y86

" Auto word wrap for txt files
au BufRead,BufNewFile *.txt setlocal textwidth=80

" ConoLine settings
let g:conoline_auto_enable = 1
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1

" NERDTree settings
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

" gitgutter settings
let g:airline#extensions#hunks#non_zero_only = 1

"delimitMate Sttings
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
