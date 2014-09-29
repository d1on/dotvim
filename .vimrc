set nocompatible "required by vundle
filetype off "required by vundle

" Vundle
    " Setting up Vundle - the vim plugin bundler
        let iCanHazVundle=1
        let vundle_readme=expand("~/.vim/bundle/vundle/README.md")
        if !filereadable(vundle_readme) 
        "if !isdirectory("~/.vim/bundle/vundle")
            echo "Installing Vundle.."
            echo ""
            silent !mkdir -p ~/.vim/bundle
            silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
            let iCanHazVundle=0
        endif
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()
        Bundle 'gmarik/vundle'
    " Setting up Vundle - the vim plugin bundler end

    " Bundles
        " General Vim
            Bundle 'scrooloose/nerdtree'
            Bundle 'scrooloose/nerdcommenter'
            Bundle 'https://github.com/tpope/vim-fugitive.git'
            Bundle 'https://github.com/Valloric/YouCompleteMe.git'
            "Bundle 'Command-T'
            "Bundle 'loremipsum'
            "Bundle 'majutsushi/tagbar'
            "Bundle 'taglist.vim'
            Bundle 'surround.vim'
            Bundle 'ack.vim'
            Bundle 'repeat.vim'
            Bundle 'vim-addon-mw-utils'
            Bundle 'EasyMotion'
            Bundle 'snipMate'
            "Bundle 'snipmate-snippets'
            Bundle 'YankRing.vim'
            "Bundle 'mutewinter/vim-indent-guides'
            "Bundle 'rosenfeld/conque-term'
            Bundle 'kien/ctrlp.vim'
            Bundle 'scrooloose/syntastic'
            "Bundle 'sjl/clam.vim'
            "Bundle 'peterhoeg/vim-tmux'
            "Bundle 'benmills/vimux'
            "Bundle 'Lokaltog/vim-powerline'
            "Bundle 'mattn/gist-vim'
            "Bundle 'mattn/webapi-vim'
            "Bundle 'SearchComplete'
            "Bundle 'TaskList.vim'
            "Bundle 'mru.vim'
        " General Vim end
    
        " Color Schemes
            Bundle 'altercation/vim-colors-solarized'
"            Bundle 'cschlueter/vim-ir_black'
"            Bundle 'Zenburn'
"            Bundle 'werks.vim'
        " Color Schemes end
        " Coffeescript 
            Bundle 'kchmck/vim-coffee-script'
        " Coffeescript end 
        " Python
            "Bundle 'pythoncomplete'
            "Bundle 'nvie/vim-pyunit'
            "Bundle 'Pydiction'
            "Bundle 'alfredodeza/pytest.vim'
            "Bundle 'fs111/pydoc.vim'
            "Bundle 'nvie/vim-pep9'
            "Bundle 'nvie/vim-pyflakes'
            "Bundle 'olethanh/Vim-nosecompiler'
            "Bundle 'rope-vim'
            "Bundle 'klen/python-mode'
        " Python end
    
        " Web (generic)
            Bundle 'mattn/zencoding-vim'
            "Bundle 'HTML-AutoCloseTag'
            "Bundle 'juvenn/mustache.vim'
"            Bundle 'groenewege/vim-less'
            "Bundle 'Rykka/colorv.vim'
            "Bundle 'gregsexton/MatchTag'
            "Bundle 'wavded/vim-stylus'
            "Bundle 'JavaScript-Indent'
            "Bundle 'tangledhelix/vim-octopress'
"            Bundle 'tpope/vim-haml'
        " Web (generic) end
    
        " Javascript / node / coffeescript 
            "Bundle 'pangloss/vim-javascript'
            "Bundle 'itspriddle/vim-jquery'
            "Bundle 'digitaltoad/vim-jade'
            "Bundle 'leshill/vim-json'
            "Bundle 'kchmck/vim-coffee-script'
            "Bundle 'walm/jshint.vim'
            "Bundle 'mmalecki/vim-node.js'
            "Bundle 'lambdalisue/nodeunit.vim'
        " Javascript / node /coffeescript end
    
        " C# / .Niet
    
        " C# / .Niet end
        
        " Java
        "
        " Java end

        " Scala
"            Bundle 'derekwyatt/vim-scala'
        " Scala End
    
        " Misc
            "Bundle 'vim-scripts/nginx.vim'
            "Bundle 'uguu-org/vim-matrix-screensaver'
        " Misc end


        " Dash 
            Bundle 'rizzatti/funcoo.vim'
            Bundle 'rizzatti/dash.vim'
        " Dash end
   
        " Unused (for now)
            "Bundle 'bash-support.vim'
            "Bundle 'SuperTab'
            "Bundle 'dickeytk/status.vim'
            "Bundle 'snipMate'
            "Bundle 'tpope/vim-haml'
            "Bundle 'Lokaltog/vim-easymotion'
            "Bundle 'kana/vim-smartinput'
            "Bundle 'sjl/gundo.vim'
            "Bundle 'int3/vim-taglist-plus'
            "Bundle 'reinh/vim-makegreen'
            "Bundle 'flomotlik/vim-livereload'
        " Unused (for now) end
    " Bundles end
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
    :BundleInstall
    endif
" Vundle end
set rtp+=/usr/local/go/misc/vim
set t_Co=256
syntax enable
filetype plugin indent on
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
noremap <leader>. :noh<cr>
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

" Dash Search https://vim-doc.heroku.com/view?https://raw.github.com/rizzatti/dash.vim/master/doc/dash.txt
:nmap <silent> <leader>d <Plug>DashSearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

if has("gui_running")
  " remove scroll bars and tool bar
  set guioptions-=r
  set guioptions-=L
  set guioptions-=T
  " expand width in fullscreen
  set fuoptions=maxvert,maxhorz
  " hide tab bar
  "set showtabline=0
  set colorcolumn=80
  set undofile
  set relativenumber
  set guioptions-=T
  set t_Co=256
  set background=dark
  set guifont=Source\ Code\ Pro:h12
  colorscheme solarized
  set nonu
else
  " remove scroll bars and tool bar
  set guioptions-=r
  set guioptions-=L
  set guioptions-=T
  " hide tab bar
  "set showtabline=0
  set colorcolumn=80
  set undofile
  set relativenumber
  set guioptions-=T
  set t_Co=256
  set background=dark
  set guifont=Source\ Code\ Pro:h12
  colorscheme solarized
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
" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;
" remap Ack toggle
noremap <leader>a :Ack<space>
" remap NERDTreeToggle
noremap <leader><space> :NERDTreeToggle<cr>
"let g:EasyMotion_leader_key = '<leader>''<space>'
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

" ctrlp settings
" exclude files/dirs
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swo|swn|so|swp|un\~|sw.)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" use external tool
"let g:ctrlp_user_command = 'find %s -type f' 
