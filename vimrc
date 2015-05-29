"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

execute pathogen#infect()

" Enable filetype plugins
filetype plugin indent on
syntax enable
set autoindent
set smartindent

nmap <leader>f :CommandTFlush<CR>

set relativenumber
set number

" Use w!! to call sudo to save the file.
cmap w!! w !sudo tee > /dev/null %

set nobackup
set noswapfile

" For long lines. Does not jump to next line when up/down are pressed.
" Instead, jumps to the next 'subline'.
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Hotkeys for split resizing
nnoremap - <c-w><
nnoremap + <c-w>>

" Split repositioning
nnoremap <up> <c-w>K
nnoremap <down> <c-w>J
nnoremap <left> <c-w>H
nnoremap <right> <c-w>L
nnoremap <BS> <c-w>r
nnoremap <c-BS> <c-w>R

" Disable arrow keys
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

" New commands (aka TODO: organize)
nnoremap '= gg=G''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set lines to the cursor - when moving vertically using j/k
set scrolloff=4

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
"set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=16
set background=dark
colorscheme solarized

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Changes CommandT color.
" For valid color schemes, use :hi in vim.
let g:CommandTHighlightColor='Search'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
" set shiftwidth=4
" set tabstop=4
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType python,c,cpp setlocal expandtab shiftwidth=4 softtabstop=4

autocmd FileType cpp,c,ruby autocmd BufWritePre <buffer> :normal gg=G''

" Linebreak on 500 characters
set lbr
set tw=500
set wrap " Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
set statusline=%t%h%m%r%y%=%c,%l/%L\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle spell checking.
map <F7> :setlocal spell! spelllang=en_us<CR>
map <F8> :setlocal spell! spelllang=pt<CR>

" Customize some colors.
hi SpellBad term=reverse cterm=reverse ctermfg=3 guifg=Black guibg=Yellow
hi SpellCap term=reverse cterm=reverse ctermfg=14 ctermbg=0 gui=bold,reverse

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction
