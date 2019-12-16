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

"=========
" clang options
"=========
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++2a -stdlib=libc++ -O2'
let g:clang_format_auto = 1
let g:clang_format_style = 'Google'
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

call dein#end()
syntax enable

