"loading pathogen"
execute pathogen#infect()
"end"
"highlight mateching search"
set hlsearch
"end"
""line numbers"
set number
"end"
"colors according to syntax"
syntax on
"end"
"indent according to filetype"
filetype plugin indent on
"end"

"enables mouse clicks in vim"
set mouse=a
""
"allows clipboard copy paste"
set clipboard=unnamedplus
"end"


"colors and bold active line"
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey100
"end"

"this converts tabs to spaces"
set expandtab
set tabstop=4
set shiftwidth=4
"end"

"open file tree based on plugin nerdtree with ctrl o"
map <C-o> :NERDTreeToggle<CR>
"end"
