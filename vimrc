set nocompatible
execute pathogen#infect()
filetype plugin on

set directory=/tmp

set nu
set history=100

au BufRead,BufNewFile *py, set tabstop=8

au BufRead,BufNewFile *.htm,*html,*.js,*.rb set shiftwidth=2
au BufRead,BufNewFile *.htm,*html,*.js,*.rb set expandtab 

au BufRead,BufNewFile *.py set shiftwidth=4
au BufRead,BufNewFile *.py set expandtab

highlight BadWhitespace ctermbg=red guibg=red

" Catch tab indents and trailing white space
au BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py

" Wrap text
au BufRead,BufNewFile *.py set textwidth=99

au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

let python_highlight_all=1
syntax on

" Automatically indent based on file type:
filetype indent on
" Keep indentation level from previous line:
set autoindent
set ruler
set showcmd

" Folding based on indentation:
set foldmethod=indent
set foldlevel=99


" Wrap word under the curser in single quotes
:map \q ciw''<Esc>P

" Shortcut to activate NERDTree
:map \t :NERDTree<CR>

" Use Enter to insert new line without entering insert mode
:nmap <S-Enter> O<Esc>
:nmap <Enter> o<Esc>

" Python boilerplate mappings
:map <C-p> i#! /usr/bin/env python<Esc>o
:map \b oimport pdb; pdb.set_trace()<Esc>
:map \o O@unittest.skip("Skipping")<Esc>
:map \l ofor k,v in locals().iteritems(): print "#", k, v<Esc>
:map \m oif __name__ == '__main__':<Esc>


" Mappings for django templates
:imap <F3> {{<Space>}}<C-O>2h 
:imap <F4> {% %}<C-O>2h 

" Spell checker shortcuts
:map <F5> :setlocal spell spelllang=en_gb<CR>
:map <F6> :setlocal nospell<CR>
