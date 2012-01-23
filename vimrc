:set modeline
:set modelines=5
:set textwidth=72
:set tabstop=4
:set shiftwidth=4
:set autoindent
:set hidden
:set expandtab
:syntax enable

"2011-06-25
"From http://www.ktaylor.name/2009/11/vim-screen-lisp-programming-environment.html
"For screen.vim send block
"to SendScreen function
"(eg Scheme interpreter)
" screen.vim REPL: send paragraph to parallel process
vmap <C-c><C-c> :ScreenSend<CR>
nmap <C-c><C-c> mCvip<C-c><C-c>
imap <C-c><C-c> <Esc><C-c><C-c><Right>

"Use this to get started: :ScreenShell /Applications/mit-scheme.app/Contents/Resources/mit-scheme
:command Scheme :ScreenShell /Applications/mit-scheme.app/Contents/Resources/mit-scheme
