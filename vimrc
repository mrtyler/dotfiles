:set modeline
:set modelines=5
:set textwidth=72
:set tabstop=4
:set shiftwidth=4
:set autoindent
:set hidden
:set expandtab
:syntax enable

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
set ruler showcmd       "give line, column, and command in the status line
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

" At work we use tabs =/
if filereadable("/nail/scripts/aliases.sh")
    set noexpandtab
endif
