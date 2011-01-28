set nocompatible
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
    set encoding=utf-8
    set termencoding=utf-8
    set fileencodings=utf-8,latin1
"endif
set background=light    " must preceed turning on syntax highlighting
let loaded_matchparen = 1
set nowrap
set whichwrap=b,s,<,>,[,],h,l
set scrolloff=5
set updatetime=5000
nohlsearch
" color stuff
:if has("terminfo")
:  set t_Co=8
:  set t_Sf=[3%p1%dm
:  set t_Sb=[4%p1%dm
:else
:  set t_Co=8
:  set t_Sf=[3%dm
:  set t_Sb=[4%dm
:endif
" spaces, not tabs
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set list
set listchars=trail:∙,tab:∙∙
" syntax highlighting
hi link javaScriptInParen NONE
hi link javaScrParenError NONE
syntax on
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif
