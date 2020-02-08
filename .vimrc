"=========
" setting
"=========
set fenc=utf-8
set nobackup
set noswapfile
set autoread

set number
set cursorline
"set cursorcolumn
set smartindent
set showmatch
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

set list listchars=tab:\▸\-
set tabstop=2
set shiftwidth=2

set incsearch
set wrapscan
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

set foldmethod=maker

"=========
" Shougo/neocomplete
"=========
let g:neocomplete#enable_at_startup = 1
if !exists('g:neocomplete#force_omni_input_patterns')
let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#force_omni_input_patterns.cpp = '[[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"=========
" vim-clang
"=========
" disable auto completion for vim-clanG
let g:clang_auto = 0
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
" default 'longest' can not work with neocomplete
let g:clang_c_completeopt   = 'menuone'
let g:clang_cpp_completeopt = 'menuone'

"=========
" clang options
"=========
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -O2 '

"=========
" clang format
"=========
"let g:clang_format_auto = 1
"let g:clang_format_style = 'Google'
let g:clang_check_syntax_auto = 1

"=========
" nerdtree options
"=========
nnoremap <C-e> :NERDTreeToggle<CR>
" 表示幅
let g:NERDTreeWinSize=50
" ブックマークを表示
let g:NERDTreeShowBookmarks=1
" 親ディレクトリへ移動
let g:NERDTreeMapUpdir='<C-u>'
" ファイルの開き方
let g:NERDTreeMapOpenSplit='<C-j>'
let g:NERDTreeMapOpenVSplit='<C-l>'
" ファイルを開いたらNERDTreeを閉じる
let g:NERDTreeQuitOnOpen=1
" 隠しファイルを表示
let g:NERDTreeShowHidden=1
" 非表示ファイル
let g:NERDTreeIgnore=['\.git$', '\.clean$', '\.swp$', '\.bak$', '\~$']
augroup vimrc_nerdtree
autocmd!
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
augroup END

"=========
" easymotion
"=========
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"=========
" quickrun
"=========
nmap <Leader>q <Plug>(quickrun)
let g:quickrun_config={'*': {'split': ''}}

"==========
"vim-airline
"==========
set ambiwidth=double
set showtabline=2 " 常にタブラインを表示
set t_Co=256 " この設定がないと色が正しく表示されない
nnoremap <C-p> <Plug>AirlineSelectPrevTab
nnoremap <C-n> <Plug>AirlineSelectNextTab
let g:airline_theme = 'light'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '}
if !exists('g:airline_symbols')
		let g:airline_symbols = {}
endif
"左側に使用されるセパレータ
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
"右側に使用されるセパレータ
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.crypt = '鍵' 			"暗号化されたファイル
let g:airline_symbols.linenr = '¶' 		"行
let g:airline_symbols.maxlinenr = '㏑' 	"最大行
let g:airline_symbols.branch = '⭠' 			"gitブランチ
let g:airline_symbols.paste = 'ρ' 			"ペーストモード
let g:airline_symbols.spell = 'Ꞩ' 			"スペルチェック
let g:airline_symbols.notexists = '∄' 	"gitで管理されていない場合
let g:airline_symbols.whitespace = 'Ξ' "空白の警告(余分な空白など)

"==========
"winresizer
"==========
let g:winresizer_start_key = '<C-T>'

"==========
"open-browser
"==========
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"==========
"dein.vim
"==========
if &compatible
set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))
call dein#add('Shougo/dein.vim')

	" default complement
	" 基本補完プラグイン
	call dein#add('Shougo/neocomplete.vim')
	call dein#add('Shougo/vimproc.vim', {'build': 'make'})
	call dein#add('Shougo/neoinclude.vim')
	" C++ complement
	" C++の厳密な補完プラグイン
	call dein#add('justmao945/vim-clang')
	" brackets complement
	" カッコ補完プラグイン
	call dein#add('cohama/lexima.vim')
	" DoxygenToolkit.vim
	" :Doxと入力することで、Doxygenタイプのテンプレートを生成する
	call dein#add('vim-scripts/DoxygenToolkit.vim')
	" nerdtree
	" C-eと入力することで、ファイルツリーを表示する
	call dein#add('scrooloose/nerdtree')
	" supertab'
	" Tab補完
	call dein#add('ervandew/supertab')
	" easymotion
	" 縦横無尽にジャンプする
	call dein#add('easymotion/vim-easymotion')
	" quickrun
	" 簡易実行
	call dein#add('thinca/vim-quickrun')
	" ステータスバーを追加
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	" vimからGit操作をする
	call dein#add('tpope/vim-fugitive')
	" ウィンドウ幅を自動調節する
	call dein#add('simeji/winresizer')
	" 単語をwebで検索する
	call dein#add('tyru/open-browser.vim')
	" 禅モード
	call dein#add('junegunn/goyo.vim')

call dein#end()
syntax enable

