" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Repeat stuff
  Plug 'tpope/vim-repeat'
  " Surround
  Plug 'tpope/vim-surround'
  " Better Comments
  Plug 'tpope/vim-commentary'
  " Have the file system follow you around
  Plug 'airblade/vim-rooter'

if exists('g:vscode')
  " Easy motion for VSCode
  Plug 'asvetliakov/vim-easymotion'

else
  " Text Navigation
  Plug 'justinmk/vim-sneak'
  Plug 'unblevable/quick-scope'
  Plug 'junegunn/rainbow_parentheses.vim'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Cool Icons
  Plug 'ryanoasis/vim-devicons'
  " Auto pairs for '(' '[' '{' 
  Plug 'jiangmiao/auto-pairs'
  " Closetags
  Plug 'alvan/vim-closetag'
  " Themes
  Plug 'christianchiarulli/onedark.vim'
  " Plug 'NLKNguyen/papercolor-theme'
  Plug 'tomasiser/vim-code-dark'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Emmet
  Plug 'mattn/emmet-vim'
  " Status Line
  Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'
  " Ranger
  Plug 'francoiscabrol/ranger.vim'
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  " Plug 'kaicataldo/material.vim'
  Plug 'rbgrouleff/bclose.vim'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Git
  " Plug 'mhinz/vim-signify'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  " Terminal
  Plug 'voldikss/vim-floaterm'
  " Code scrathpad
  " Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'metakirby5/codi.vim'
  " Start Screen
  Plug 'mhinz/vim-startify'
  " Vista
  Plug 'liuchengxu/vista.vim'
  " See what keys do like in emacs
  Plug 'liuchengxu/vim-which-key'
  " Zen mode
  Plug 'junegunn/goyo.vim'
  " Making stuff
  Plug 'neomake/neomake'
  " Snippets TODO fix TAB hijack
  " Plug 'SirVer/ultisnips'
  " Better Comments
  Plug 'jbgutierrez/vim-better-comments'
  " TODO configure all plugins below
  " Gramar corrector
  Plug 'rhysd/vim-grammarous'
  " Mercurial support
  Plug 'ludovicchabant/vim-lawrencium'
  " Jupyter editing
  Plug 'goerz/jupytext.vim'
  " Markdown preview
  Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
  " Todo text
  Plug 'freitass/todo.txt-vim'
  " Testing
  Plug 'janko-m/vim-test'
  " Plug 'tpope/vim-dispatch'
  Plug 'vifm/vifm.vim'
  " Pandoc integration
  Plug 'vim-pandoc/vim-pandoc'
endif


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
