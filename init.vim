
filetype off                  " required!
syntax on

au BufRead,BufNewFile *.py call matchadd('ColorColumn', '\%81v', 80)

set shell=/usr/bin/zsh
set termguicolors
set foldmethod=indent
set foldlevelstart=20
set tags=$PWD/.ctags
set shell=/bin/bash\ -f
set listchars=tab:\ \ ,eol:$
set wildignore+=venv
set wildignore+=*.pyc
set wildignore+=node_modules
set smartindent
set autoindent
set smartcase
set relativenumber
set number
set ruler
set hidden
set hlsearch
set so=999
set undolevels=1001
set incsearch
set laststatus=2
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set undofile
set undodir=~/.vim/undodir
set list
set wrapscan
set clipboard=unnamed
set lazyredraw
"set spell
let g:airline_powerline_fonts = 1

" set spell when writing git commits
au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

"show method argument in typescript
autocmd FileType typescript setlocal completeopt+=menu,preview

let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript nmap <buffer> <Leader>i : <C-u>:TsuImport<CR>
autocmd FileType typescript nmap <buffer> <Leader>r : <C-u>:TsuRenameSymbol<CR>

autocmd BufWritePost *.py Neomake
autocmd BufWritePost *.tex silent !pdflatex %:p
autocmd BufWritePost *.ts Neomake

"#YOLO#SWAG
set nobackup
set noswapfile


"set go-=L " Removes left hand scroll bar
set cursorline
set ignorecase
set modeline    
set tabstop=4
set shiftwidth=4
set backspace=indent,start
set shell=/usr/bin/zsh
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    map <Esc>OH <Home>
    map! <Esc>OH <Home>
    map <Esc>OF <End>
    map! <Esc>OF <End>
endif
nnoremap ^[[D gT
nnoremap ^[[C gt
nnoremap ; :
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
set mouse=""

"================================
" Color
"================================

set background=dark

" colorscheme blues
colorscheme tender
" colorscheme alduin
" colorscheme obsidian
" colorscheme seoul256
" colorscheme sierra
" colorscheme one
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme molokai
" colorscheme alduin
" highlight Normal ctermbg='black'
" colorscheme jellybeans
"
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE



"================================
" Mappings
"================================
nnoremap <C-t>     :tabnew<CR>
nnoremap <Tab>     :tabnext<CR>

let g:javascript_conceal = 1
let python_highlight_all = 1

let mapleader = ","


map <leader>r :w !psql -d butterai -1 -f -<cr>
map <Leader>t :TagbarToggle<CR>
map <Bslash> :lnext<CR>
map \| :lp<CR>

map <Leader>m :CtrlPMRUFiles<CR>
map <Leader>f :CtrlPCurWD<CR>

map <C-Left> <C-W><Left>
map <C-Down> <C-W><Down>
map <C-Up> <C-W><Up>
map <C-Right> <C-W><Right>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

map <Up> gk
map <Down> gj

map <Leader>a :Ack 

vnoremap <Leader>s :sort<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '(node_modules|venv|env)',
 \ }

"let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = "e"

"au BufRead,BufNewFile *.py set textwidth=100

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc("~/.config/nvim/bundle")

autocmd FileType typescript setlocal completeopt+=menu,preview

call vundle#begin()
Bundle 'leafgarland/typescript-vim'
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'kien/ctrlp.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'tomtom/tcomment_vim'
Bundle 'tmhedberg/matchit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-airline/vim-airline'
Bundle 'davidhalter/jedi-vim'

"typescript client for server for autocomplete
Bundle 'Quramy/tsuquyomi' 
Bundle 'mileszs/ack.vim'
Bundle 'merlinrebrovic/focus.vim'
Bundle 'Shougo/vimproc'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-sleuth'
Bundle 'jaxbot/semantic-highlight.vim'
Bundle 'majutsushi/tagbar'
Bundle 'hdima/python-syntax'
Bundle 'benekastah/neomake'
Bundle 'evidens/vim-twig'
call vundle#end()

filetype plugin indent on 


"================================
" Custom Functions
"================================

" inoremap <buffer> ' <C-O>:call PairUp("'")<CR>
" function! PairUp(char)
"     let line = getline('.')
"     let pos = col(".") + 1
"     let part2 = strpart(line, pos)
"     let part1 = strpart(line, 0, strridx(line, part2))
"     if strlen(part2) > 0
"         let part1 .= part2[0]
"     endif
"     let line = part1 . a:char . a:char . part2
"     call setline('.', line)
" endfunction
"
" function! Something()
"     let line = getline('.')
"     " redir =>buflist
"     " silent! ls
"     " redir END
"     " echo buflist
"     " echo split(buflist, "\n")
"     echo line
"     call setline('.', 'LOL')
" endfunction
" nmap <C-W><Bslash> :call Something()<CR>

augroup line_return  " Return vim to the last known position
  au!
  au BufreadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute "normal! g'\"" |
        \ endif
augroup END

