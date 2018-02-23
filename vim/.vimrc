" Vundle configuration
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim/ " set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugins
Bundle 'gmarik/vundle'
Bundle 'Valloric/YouCompleteMe'
Bundle 'a.vim'
Bundle 'DoxygenToolkit.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jwhitley/vim-colors-solarized'
Bundle 'tpope/vim-dispatch'
Bundle 'SirVer/ultisnips'
Bundle 'drmikehenry/vim-headerguard'
Bundle 'honza/vim-snippets'
Bundle 'ggreer/the_silver_searcher'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'bling/vim-airline'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Vim environment options
syntax on
set nowrap
set expandtab
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set visualbell
set noerrorbells
set cursorline
set background=dark
set showcmd
set hidden
set so=7
let mapleader = ","
colorscheme solarized
set exrc
set incsearch
set hlsearch
set autoread

" Filetype handling
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd Filetype coffee setlocal shiftwidth=2 softtabstop=2

" Turn off backup
set nobackup
set nowb
set noswapfile

" Set to show airline all the time
set laststatus=2
set cc=""

highlight clear SignColumn

set t_Co=256                        " force vim to use 256 colors
let g:solarized_termcolors=256      " use solarized 256 fallback

" Fonts for status bar
let g:airline_powerline_fonts = 1

let g:airline#extensions#default#section_truncate_width = {
	    \ 'b': 150,
	    \ 'x': 100,
	    \ 'y': 100,
	    \ 'z': 100,
	    \ 'warning': 150,
	    \ 'error': 150,
	    \ }
" Cpp enhanced highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
" YouCompleteMe options
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" Sudo write
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Fuzzy finder
map <C-p> :FZF<CR>

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>
autocmd Filetype coffee nnoremap p p
autocmd Filetype coffee nnoremap P P

" NerdTree options
map <C-e> :NERDTreeToggle<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o

map <C-f> :FufFile **/<CR>

"map <Leader> <Plug>(easymotion-prefix)a

map <C-v> <C-w>v
map <C-s> <C-w>s
map <C-c> <C-w>c
let g:UltiSnipsExpandTrigger="<C-e>"
let g:UltiSnipsJumpForwardTrigger="<C-e>"
let g:UltiSnipsJumpBackwardTrigger="<C-p>"
let g:UltiSnipsEditSplit="vertical"

" Build and run
map <leader>t :tselect<CR>
map <leader>m :Make<CR>

" Navigation
map <leader>a :A<CR>
map <leader>g :YcmCompleter GoTo<CR>
map <leader>r :YcmCompleter FixIt<CR>

map <leader>q :wq<CR>

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor
	command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
endif

nnoremap <leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Own commands
"command! -nargs=1 Override :read !cat <f-args> | grep 'virtual.* = 0;' | sed s/virtual\ //g | sed s/\ \=\ \0/\ override/g
nnoremap <leader>o p`[v`]:s/\(virtual\ \)\(.*\)\(=\0\)/\2\override/g<CR>
nnoremap <leader>i p`[v`]:s/\ override;//g<CR>=$/(<CR>bi::<esc>1hi

map <leader>w :%s/\s\+$//e<CR>:w<CR>

" Headerguard
function! g:HeaderguardName()
	return toupper(expand('%:gs/[^0-9a-zA-Z_]/_/g'))
endfunction

" C++ templates
autocmd BufNewFile *.h call CreateCppHeader()
function! CreateCppHeader()
	HeaderguardAdd
	1
	normal O
	read ~/.vim/templates/file_header.tpl
	1d
	17
endfunction

autocmd BufNewFile *.cpp call CreateCppSource()
function! CreateCppSource()
	read ~/.vim/templates/file_header.tpl
	13
endfunction

