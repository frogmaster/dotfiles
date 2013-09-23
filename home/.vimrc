au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

set softtabstop=4 shiftwidth=4 tabstop=4 expandtab

execute pathogen#infect()
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

syntax enable
set background=dark
colorscheme solarized
set relativenumber

function! RunShebang()
    if (match(getline(1), '^\#!') == 0)
        let filename = expand("%")
        let line = getline(1)
        let cmname = substitute(line, "^\#", "", "")
        let cmd = cmname . " " . filename
        echo "Running:" . cmd
        execute cmd
    else
        echo "No shebang in this file."
    endif
endfunction
map <F5> :call RunShebang()<CR>
map <F1> :NERDTreeToggle<CR>
let g:airline_powerline_fonts = 1
