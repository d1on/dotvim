" Load Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
filetype off
set t_Co=256
syntax enable
set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" Remove search highlighting iwth ,<space>
noremap <leader><space> :noh<cr>
" Match braces with <tab>
noremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
" Show invisible characters
"set list
"set listchars=tab:▸\ ,eol:¬

"nnoremap ; :

" Save on losing focus
au FocusLost * :wa



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

if has("gui_running")
  set colorcolumn=80
  set undofile
  set relativenumber
  set guioptions-=T
  set t_Co=256
  set background=dark
  set guifont=Consolas:h12
  colorscheme solarized
  set nonu
else
  colorscheme solarized
  set background=dark
  set nonu
endif




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" remap Ack toggle
noremap <leader>a :Ack<space>

" remap NERDTreeToggle
noremap <leader>, :NERDTreeToggle<cr>
inoremap kj <Esc>
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] 

" Open an new vertical split and switch over to it
nnoremap <leader>w <C-w>v,C-w>l

" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

function GetGooglePythonIndent(lnum)

  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif

  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)

endfunction

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
" Swallow FocusLost error when leaving buffer
autocmd BufLeave,FocusLost silent! wall

" Vim syntax highlighting
au BufRead, BufNewFile *.json set filetype=json
au! Syntax json source ~/.vim/syntax/json.vim
