set shell=/bin/bash

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on
"--------
" Vim UI
"--------
" color scheme
let g:solarized_termcolors=256
set background=dark
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE


" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
set t_BE=

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=8       " tab width
set softtabstop=8   " backspace
set shiftwidth=8    " indent width
" set textwidth=79
" set smarttab
" set expandtab       " expand tab to space
set noexpandtab
set clipboard+=unnamed

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support

"-----------------
" Plugin settings
"-----------------
" Rainbow parentheses for Lisp and variants
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

let g:quickfix_is_open = 0

" vim asyncrun
let g:asyncrun_open = 8
" cmap tinamuboot AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot
:command -nargs=+ Tina :AsyncRun -cwd=$TINA_BUILD_TOP  source ~/.tina.sh; source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;"<args>"
" :command Muboot :AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot
" :command Muboot_nor :AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot_nor
" :command Mboot0 :AsyncRun -cwd=$TINA_BUILD_TOP  source build/envsetup.sh; lunch "$TARGET_PRODUCT"_tina;muboot_nor

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

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

" ZenCoding
let g:user_emmet_expandabbr_key='<C-j>'

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

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

" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
" Ack 代替grep搜索代码
nnoremap <leader>a :Ack
" 搜索当前光标所在单词
nnoremap <leader>aa yaw:Ack! <C-R>0<cr>
vnoremap <leader>aa y:Ack! <C-R>0<cr>
nnoremap <leader>bb yaw:grep <C-R>0 . -nrI<cr>
vnoremap <leader>bb y:grep <C-R>0 . -nrI<cr>

map <leader>aaa :Ack!<Space>
"高亮搜索关键词
let g:ackhighlight = 1
"修改快速预览窗口高度为15
let g:ack_qhandler = "botright copen 15"
"在QuickFix窗口使用快捷键以后，自动关闭QuickFix窗口
let g:ack_autoclose = 1
"使用ack的空白搜索，即不添加任何参数时对光标下的单词进行搜索，默认值为1，表示开启，置0以后使用空白搜索将返回错误信息
let g:ack_use_cword_for_empty_search = 1
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

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

" for macvim
if has("gui_running")
    set go=aAce  " remove toolbar
    "set transparency=30
    set guifont=Monaco:h13
    set showtabline=2
    set columns=140
    set lines=40
    noremap <D-M-Left> :tabprevious<cr>
    noremap <D-M-Right> :tabnext<cr>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
endif

cmap shanchukongge % s/[\s 　]\+$//g
map <leader><space> :FixWhitespace<cr>

" cmap xianshitab set listchars=tab:>-,trail:-
cmap xianshi set invlist
cmap buxianshi set nolist

set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
                            " 用空格键来开关折叠

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

let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = {}
let g:ycm_semantic_triggers.c = ['->', '.', '(', '[', '&']
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_seed_identifiers_with_syntax=1

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 调试用
let g:gutentags_define_advanced_commands = 1
let $GTAGSLABEL='native'

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 配置 ctags 的参数
set tags=tags;
set autochdir
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" set termguicolors
" autocmd VimEnter *.md MarkdownPreview
    set encoding=UTF-8
    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1	""这一句可以不加
    set fileencoding=utf-8
