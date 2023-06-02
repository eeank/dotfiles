set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green

if &term =~ "screen"                                                   
    let &t_BE = "\e[?2004h"                                              
    let &t_BD = "\e[?2004l"                                              
    exec "set t_PS=\e[200~"                                              
    exec "set t_PE=\e[201~"                                              
endif




" see https://github.com/ConradIrwin/vim-bracketed-paste
" enter/leave bracketed paste mode when entering/leaving insert mode
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

function! WrapForScreen(s)
  if exists('$TMUX') || match($TERM, "screen")==-1
    return a:s
  endif

  let screen_start = "\<Esc>P"
  let screen_end = "\<Esc>\\"

  return screen_start . a:s . screen_end
endfunction

function! WrapSequenceForMultiplexer(s)
  return WrapForTmux(WrapForScreen(a:s))
endfunction

let &t_SI .= WrapSequenceForMultiplexer("\<Esc>[?2004h")
let &t_EI .= WrapSequenceForMultiplexer("\<Esc>[?2004l")


autocmd VimLeave * !clear
