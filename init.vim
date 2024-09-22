call plug#begin('~/.vim/plugged')
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

Plug 'tpope/vim-fugitive', { 'on': [] }
command! Gstatus call LazyLoadFugitive('Git status')
command! Gdiff call LazyLoadFugitive('Git diff')
command! Glog call LazyLoadFugitive('Git log')
command! Gblame call LazyLoadFugitive('Git blame')

function! LazyLoadFugitive(cmd)
  call plug#load('vim-fugitive')
  exe a:cmd
endfunction

lua require('init')

set autoindent
set clipboard=unnamedplus
