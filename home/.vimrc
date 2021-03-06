au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

if &term =~ '^screen'
  " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
  execute "set t_kP=\e[5;*~"
  execute "set t_kN=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

set softtabstop=4 shiftwidth=4 tabstop=4 expandtab

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

set backupcopy=yes

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

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
let g:typescript_indent_disable = 1
set autoindent

autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces


autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

nmap <silent><Leader>f <Esc>:Pytest file<CR>
nmap <silent><Leader>p <Esc>:Pytest project<CR>
