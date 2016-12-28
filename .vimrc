
"                      VUNDLE
" =============================================================

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'mattn/emmet-vim'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"  跳转到任意位置 替代vim默认的搜索功能，如果不喜欢可以去除
Plugin 'Lokaltog/vim-easymotion'

Plugin 'pangloss/vim-javascript'

"  ,,d  光标定位在方法上面，自动生成js doc
Plugin 'heavenshell/vim-jsdoc'

"  一些javascript library的语法高亮
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'

"  自动关闭html, xml标签
Plugin 'alvan/vim-closetag'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'j5shi/ctrlp_bdelete.vim'
Plugin 'rking/ag.vim'
Plugin 'ggVGc/vim-fuzzysearch'

Plugin 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}


"  高亮显示文档中颜色代码
Plugin 'gorodinskiy/vim-coloresque'

"  将代码行最后无效的空格标红 ,空格 去掉多余空格
Plugin 'bronson/vim-trailing-whitespace'

"  保存当前打开文件、slpit窗口、buffer的状态，下次在该目录下运行vim的时候自动还原
"Plugin 'dhruvasagar/vim-prosession'

"  高亮显示匹配的标签
Plugin 'Valloric/MatchTagAlways'

"  是vim-prosession依赖
"Plugin 'tpope/vim-obsession'  

"  快速给单词添加 单引号，双引号，中括号等 
Plugin 'tpope/vim-surround'

"  重复上一条指令
Plugin 'tpope/vim-repeat'

"  自动补全：(), [], {}, <> 
Plugin 'Raimondi/delimitMate'

"  代码按=或者: 对齐 a=   按等号对齐  ,a:   安冒号对齐
Plugin 'godlygeek/tabular'

"  语法检查插件，写javascript配合eslint使用非常有帮助 
Plugin 'scrooloose/syntastic'

Plugin 'mxw/vim-jsx'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-obsession'
Plugin 'othree/html5.vim'

"  css3语法高亮
Plugin 'hail2u/vim-css3-syntax'

"  查看文件历史修改记录，移动到某一个时间点，r 来查看改动，enter返回到这个状态 ,h
Plugin 'sjl/gundo.vim'

"  格式化js,json,html,css,scss  ,,f  自动格式化
Plugin 'Chiel92/vim-autoformat'


"  markdown语法高亮
Plugin 'tpope/vim-markdown'

"  非常强大javascript代码自动补全，支持node，jquery，浏览器相关api
Plugin 'marijnh/tern_for_vim'

Plugin 'majutsushi/tagbar'

" Colour Themes
Plugin 'GertjanReynaert/cobalt2-vim-theme'

call vundle#end()
filetype plugin indent on
syntax on

runtime macros/matchit.vim

" =============================================================
"                 GENERAL SETTINGS
" =============================================================

set backspace=indent,eol,start
set history=1000
set ruler
set showcmd
set autoindent
set showmatch
set nowrap
set autoread
set autowrite
set backupdir=~/.tmp
set directory=~/.tmp
set viminfo+=!
set guioptions-=T
set laststatus=2
set scrolloff=3
set sidescrolloff=4
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set relativenumber
set number
set wrap
set linebreak
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a
set shell=bash
set clipboard=unnamed
set winwidth=100
set winheight=5
set winminheight=5
set winheight=999
set noswapfile
set wildmenu
set nostartofline
set noesckeys
set ttimeout
set ttimeoutlen=1

set path+=**


" ...................................................
"
"     Plugin config
"
" ...................................................

let mapleader = ","

" create/open file in current folder
map <Leader>ee :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>



" ----------------------------------------------------------------------------
"  color Theme
" ----------------------------------------------------------------------------
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

colorscheme cobalt2
set background=dark


" ----------------------------------------------------------------------------
" NERDTree
" ----------------------------------------------------------------------------
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end


" ----------------------------------------------------------------------------
" tagbar
" require ctags, jsctags  mac下需要安装 ctags-exuberant 使用这个命令安装  brew install ctags-exuberant
" npm install -g git+https://github.com/ramitos/jsctags.git
" ----------------------------------------------------------------------------
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : 'jsctags'
    \ }
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_width = 50


" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------
nnoremap <leader>m :CtrlPMRU<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](node_modules|target|dist)|\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
let g:ctrlp_follow_symlinks=1
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'
call ctrlp_bdelete#init()


" ----------------------------------------------------------------------------
" ctrlp-funky
" Mapping: <Leader>fu
" ----------------------------------------------------------------------------
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>


" ----------------------------------------------------------------------------
" ag.vim
" ----------------------------------------------------------------------------
nnoremap <Leader><Leader>a :Ag!<space>
let g:ag_working_path_mode='r'


" ----------------------------------------------------------------------------
" vim-fuzzysearch
" ----------------------------------------------------------------------------
nnoremap <leader><leader>/ :FuzzySearch<cr>

" ----------------------------------------------------------------------------
" vim-airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1


" ----------------------------------------------------------------------------
" vim-trailing-whitespace
" Mapping: <leader><space>
" ----------------------------------------------------------------------------
map <leader><space> :FixWhitespace<cr>


" ----------------------------------------------------------------------------
" 
"     easymotion
"
" ----------------------------------------------------------------------------
nmap s <Plug>(easymotion-s)
omap s <Plug>(easymotion-bd-t)
vmap s <Plug>(easymotion-bd-t)


" ----------------------------------------------------------------------------
" vim-closetag
" ----------------------------------------------------------------------------
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.js"


" ----------------------------------------------------------------------------
" vim-jsx
" ----------------------------------------------------------------------------
let g:jsx_ext_required = 0 " Allow JSX in normal JS files"


" ----------------------------------------------------------------------------
" delimitMate
" ----------------------------------------------------------------------------
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_expand_cr = 1


" ----------------------------------------------------------------------------
" syntastic
" ----------------------------------------------------------------------------
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='❗'
let g:syntastic_style_error_symbol='»'
let g:syntastic_style_warning_symbol='•'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_javascript_checkers = ['eslint']
if executable('eslint_d')
    let g:syntastic_javascript_eslint_exec = 'eslint_d'
endif
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["java"] }


" ----------------------------------------------------------------------------
" vim-markdown
" ----------------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_frontmatter=1


" ----------------------------------------------------------------------------
" vim-jsdoc
" ----------------------------------------------------------------------------
let g:jsdoc_default_mapping = 0
autocmd FileType javascript nnoremap <Leader><Leader>d :JsDoc<CR>


" ----------------------------------------------------------------------------
" gundo.vim
" ----------------------------------------------------------------------------
nnoremap <leader>h :GundoToggle<CR>
let g:gundo_auto_preview = 0


" ----------------------------------------------------------------------------
" vim-autoformat
"require: npm install -g js-beautify
" ----------------------------------------------------------------------------
autocmd FileType javascript,json,html,css,scss noremap <buffer>  <leader><leader>f :Autoformat<cr>


" ----------------------------------------------------------------------------
" tern_for_vim
" ----------------------------------------------------------------------------
let tern_show_signature_in_pum = 1
let tern_show_argument_hints = 'on_hold'
autocmd FileType javascript nnoremap <leader>d :TernDef<CR>
autocmd FileType javascript setlocal omnifunc=tern#Complete