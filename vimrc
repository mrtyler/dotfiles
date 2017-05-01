"""2012-04-22
"""From https://github.com/tpope/vim-pathogen
set runtimepath+=~/dotfiles/vim
call pathogen#infect('~/dotfiles/vim/bundle')

set modeline
set modelines=5
set textwidth=0
set tabstop=4
set shiftwidth=4
set autoindent
set hidden
set expandtab
set list
set listchars=tab:>-,eol:$,trail:·
syntax enable
"fffffffuuuuuuuuu DarkBlue
highlight Comment ctermfg=DarkGreen

"""2011-06-25
"""From http://www.ktaylor.name/2009/11/vim-screen-lisp-programming-environment.html
"For screen.vim send block
"to SendScreen function
"(eg Scheme interpreter)
" screen.vim REPL: send paragraph to parallel process
vmap <C-c><C-c> :ScreenSend<CR>
nmap <C-c><C-c> mCvip<C-c><C-c>
imap <C-c><C-c> <Esc><C-c><C-c><Right>
:command Scheme :ScreenShell /Applications/mit-scheme.app/Contents/Resources/mit-scheme

"""2012-04-22
"""From https://github.com/bukzor/buck_dotfiles/blob/master/.vimrc
"set ruler showcmd       "give line, column, and command in the status line
set laststatus=2        "always show the status line
                        "make filename-completion more terminal-like
set wildmode=longest:full
set wildmenu            "a menu for resolving ambiguous tab-completion
                        "files we never want to edit
set wildignore=*.pyc,*.sw[pno]
set incsearch           "search as you type
set hlsearch            "highlight the search

"quick buffer switching with TAB, even with edited files
nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>
set autoread            "auto-reload files, if there's no conflict

set smarttab            "backspace to remove space-indents
"smart indenting by filetype, better than smartindent
filetype on
filetype indent on
filetype plugin on

"""2012-04-23
"""From https://trac.yelpcorp.com/wiki/VimTips
"Initialize with:
"/usr/bin/ctags -L <(find . -name '*.py') --fields=+iaS --python-kinds=-i --sort=yes --extra=+q
"Or for ruby:
"ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)
set tags=./tags;/

"""2012-04-24
"""From https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""2012-07-09
"""From striglia
" Fix vim trying to double indent by hardcoding a single indent at all times.
let g:pyindent_open_paren = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue = '&sw'
