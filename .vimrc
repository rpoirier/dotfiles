" Whitespace
" --For using hard tabs
"set tabstop=4 " sets tab width to 4 spaces

" --For using 4 spaces as tabs
set expandtab " tab inserts spaces instead
set softtabstop=4 " backspace removes 4 spaces

" Indentation settings
set autoindent   " autoindents to same indentation as previous line
"set cindent      " automatic c style indentation, DON'T use w/ file-specific indent
set shiftwidth=4 " sets width for reindent and autoindent

" highlights trailing whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" UI tweaks
syntax on                   " enable syntax highlighting
filetype on                 " enable file type detection
"filetype indent on          " enable file-specific indentation
set t_Co=256                " use 256 colors instead of default 16
set number                  " show line numbers
set background=light        " use default highlight colors for light background
set showmatch               " highlight matching [{()}]
set scrolloff=10            " keep the cursor centered when scrolling 
set visualbell              " use visual bell instead of beeping
set t_vb=                   " disable visual bell, so no beep or flash
set lazyredraw              " only redraw when necessary

if exists('+colorcolumn')
    highlight ColorColumn ctermbg=gray
    set colorcolumn=80      " visually indicate column 80 if ver >= 7.3
else                        " otherwise highlight overlength lines red
    highlight Overlength ctermbg=red ctermfg=white guibg=red
    match Overlength /\%81v.\+/
endif

" Syntax highlighting settings for obscure file types
au BufNewFile,BufRead *.cmp set filetype=php

" Shortcuts & rebinds
" saves session, restore with vim -S
nnoremap <leader>w :mksession<CR>
" allows saving with W when you inevitably forgot to run vim with sudo
command W w !sudo tee >/dev/null %
" allows use of ; as : to save a shift press in command mode
nore ; : 
