" Tab settings
" --Use these regardles of tab vs space preference 
set tabstop=4     " sets tab width to 4 spaces
set softtabstop=4 " tab stops every 4 spaces & backspace removes 4 spaces

" --Set this to insert 4 spaces when you press the tab key
set expandtab     " tab inserts spaces instead

" Indentation settings
set autoindent    " autoindents to same indentation as previous line
set shiftwidth=4  " sets width for reindent and autoindent

" UI tweaks
syntax on                   " enable syntax highlighting
filetype on                 " enable file type detection
"filetype indent on          " enable file-specific indentation
set t_Co=256                " use 256 colors instead of default 16
set number                  " show line numbers
set background=light        " use default highlight colors for light background
set showmatch               " highlight matching [{()}]
set hlsearch                " highlight search matches
set smartcase               " searching in all one case is case insensitive
set scrolloff=10            " keep the cursor centered when scrolling 
set visualbell              " use visual bell instead of beeping
set t_vb=                   " disable visual bell, so no beep or flash
set lazyredraw              " only redraw when necessary
set mouse=a                 " enables scrolling and cursor placement with mouse

" Column 80 marker
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=gray
    set colorcolumn=80      " visually indicate column 80 if ver >= 7.3
else                        " otherwise highlight overlength lines red
    highlight Overlength ctermbg=red ctermfg=white guibg=red
    match Overlength /\%81v.\+/
endif

" Highlights trailing whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Shortcuts & rebinds
" --allows saving with W when you inevitably forgot to run vim with sudo
command W w !sudo tee >/dev/null %
" --allows use of ; as : to save a shift press in command mode
nore ; : 

" F1 opens Vim help by default
" ----------------------------
" F2 toggles paste mode on/off
set pastetoggle=<F2>
" F3 toggles mouse on/off
map <F3> :exec &mouse!="" ? "set mouse=" : "set mouse=a"<CR>
" F4 ---------------------
" ------------------------

" F5 saves the session to be restored later with vim -S
map <F5> :mksession<CR>
" F6 toggles line numbers on/off
map <F6> :set number!<CR>
" F7 toggles relative line numbers
map <F7> :set relativenumber!<CR>
" F8 clears highlighting
map <F8> :noh<CR>

" F9 ---------------------
" ------------------------
" F10 --------------------
" ------------------------
" F11 --------------------
" ------------------------
" F12 --------------------
" ------------------------
