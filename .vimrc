" UTF-8
scriptencoding utf-8
set encoding=utf-8

" Clipboard
set clipboard=unnamed                     " use system clipboard as default register
noremap c "_c
noremap x "_x

"UI Config
syntax enable                             " enable syntax processing
set number                                " print line number before each line
set relativenumber                        " print relative line number before each line
set showcmd                               " show (partial) command in bottom bar
set wildmenu                              " enable command-line completion
set lazyredraw                            " do not redraw during non-typed commands
set showmatch                             " briefly jump to matching [{()}]
set matchtime=1                           " tenth of second to show matching [{()}]
set t_Co=256                              " number of colors
set scrolloff=2                           " show at least two lines above/below the cursor
set autoread                              " autload file changes

" Spaces & Tabs
set tabstop=2                             " number of spaces that \t counts for
set expandtab                             " use spaces to insert a tab
set listchars=trail:∙,tab:>―              " characters to use in list mode (whitespace:char)
set list                                  " enable list mode
set autoindent                            " copy indent from current line when starting a new line

" :find
set path+=**                              " recursive file search into subfolders
set wildmenu                              " display all matching files on tab complete

" :edit (built-in netrw plugin)
let g:netrw_banner=0                      " disable banner
let g:netrw_liststyle=3                   " tree view

" Plugins
set rtp+=/opt/homebrew/opt/fzf            " fzf integration

" Misc
set backspace=indent,eol,start            " allow backspacing over everything

let g:multi_cursor_start_word_key      = '<C-c>'
let g:multi_cursor_select_all_word_key = '<A-c>'
let g:multi_cursor_start_key           = 'g<C-c>'
let g:multi_cursor_select_all_key      = 'g<A-c>'
let g:multi_cursor_next_key            = '<C-c>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-k>'
let g:multi_cursor_quit_key            = '<Esc>'

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
