" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

"### UI ###"
syntax on				" syntax HL
set cursorline				" the row of cursor HL
let g:solarized_termcolors=256
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white
set fillchars=vert:\ ,

"### BASIC SETTING ###"
set history=1000
set nofoldenable			" disable folding
set confirm				" prompt when existing from an unsaved file
set t_Co=256				" Explicitly tell vim that the terminal has 256 colors
set mouse=a				" use mouse in all modes
set report=0				" always report number of lines changed
set scrolloff=5				" 5 lines above/below cursor when scrolling
set number				" show line numbers
set showmatch				" show matching bracket (briefly jump)
set showcmd				" show typed command in status bar
set showmode				" show mode command or insert at the bottom
set title				" show file in titlebar
set laststatus=2			" use 2 lines for the status bar
set matchtime=2				" show matching bracket for 0.2 seconds
set matchpairs+=<:>			" specially for html
set t_BE=
set clipboard+=unnamed			" shared clipboard
set nocompatible			" disable VI keyboard
set selection=exclusive
set selectmode=mouse,key
set ruler
set paste
set magic
set tabpagemax=20
set showtabline=2
set cmdheight=2				" 设置命令行的高度

"### SEARCH ###"
set ignorecase
set hlsearch
set smartcase
set incsearch

"### INDENT ###"
set autoindent				" auto indent
set cindent				" C indent
set smartindent				" C auto indent
set tabstop=8				" tab width
set softtabstop=8			" backspace
set shiftwidth=8			" indent width
set noexpandtab				" Not expand tab to space
set backspace=indent,eol,start		" More powerful backspacing
set nowrap				" dont wrap lines
set textwidth=80

"### YouCompleteMe ###"
set runtimepath+=~/.vim/bundle/YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项

"### Plugin ###"

" Tagbar
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'
" SuperTab
let g:SuperTabCrMapping = 0
" let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0

" 搜索当前光标所在单词
nnoremap <leader>aa yaw:Ack! <C-R>0<cr>
vnoremap <leader>aa y:Ack! <C-R>0<cr>
nnoremap <leader>bb yaw:grep <C-R>0 . -nrI<cr>
vnoremap <leader>bb y:grep <C-R>0 . -nrI<cr>

nnoremap <leader>v V`]
" 内置grep搜索
nmap <leader>lv :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" eggcache vim
" nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" cmap xianshitab set listchars=tab:>-,trail:-
cmap shanchukongge % s/[\s 　]\+$//g
map <leader><space> :FixWhitespace<cr>
cmap xianshi set invlist
cmap buxianshi set nolist

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Ctrl+j/k 切换标签页 +x 关闭标签页
map <C-J> :Tbbp<cr>
map <C-K> :Tbbn<cr>
map <C-X> :Tbbd<cr>

" 保存
map <C-S> :w
nnoremap <leader>ww :w<cr>
nnoremap <leader>wq :wq<cr>

" 显示十六进制
" 最好先用 vim -b xxx 打开文件
cmap hex %!xxd
cmap nohex %!xxd -r
cmap hexon %!xxd
cmap hexoff %!xxd -r

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 调试用
let g:gutentags_define_advanced_commands = 1
let $GTAGSLABEL='native'

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')
let Tlist_Exit_OnlyWindow=1
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" autocmd VimEnter *.md MarkdownPreview
    set encoding=UTF-8
    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1	""这一句可以不加
    set fileencoding=utf-8
