" Basic visual settings
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

" Open netrw with Ctrl-A and resize
inoremap <c-a> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-a> <Esc>:Lex<cr>:vertical resize 30<cr>

" Allow line number in netrw
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'
autocmd FileType netrw setlocal number

" Fix paste bug from tmux
if &term =~ "screen"
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif

" Mapping for moving between files
nnoremap ]] :bn<CR>
nnoremap [[ :bp<CR>

" Custom function to switch to previous tab
function! PreviousTab()
    let current_tab = tabpagenr()
    if current_tab > 1 
        let prev_tab = current_tab - 1 
        execute 'normal ' . prev_tab . 'gt'
    endif
endfunction

" Custom function to switch to next tab
function! NextTab()
    let current_tab = tabpagenr()
    let total_tabs = tabpagenr('$')
    if current_tab < total_tabs
        execute 'normal ' . (current_tab + 1) . 'gt'
    else
        execute 'normal 1gt'
    endif
endfunction
nnoremap [[ :call PreviousTab()<CR>
nnoremap ]] :call NextTab()<CR>

"open netrw on current working directory
autocmd BufEnter * if expand('%:p:h') != '' && expand('%:p:h') != getcwd() | cd %:p:h | endif

"hide .swp files in netrw
let g:netrw_list_hide = get(g:, 'netrw_list_hide', '') . ',.*\.swp$'
