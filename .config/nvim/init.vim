lua require 'init'

if exists('g:vscode')

else

  if has('unix')
    if exists('$TMUX')
      let g:tpipeline_cursormoved = 1
      let &t_fe = "\<Esc>[?1004h"
      let &t_fd = "\<Esc>[?1004l"

      function s:AddTerminalNavigation()

          echom &filetype
          if &filetype ==# ''
        tnoremap <buffer> <silent> <c-h> <c-\><c-n>:TmuxNavigateLeft<cr>
        tnoremap <buffer> <silent> <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
        tnoremap <buffer> <silent> <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
        tnoremap <buffer> <silent> <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
        tnoremap <Esc> <C-\><C-n>
        tnoremap <C-v><Esc> <Esc>
          endif

      endfunction

      augroup TerminalNavigation
          autocmd!
          autocmd TermEnter * call s:AddTerminalNavigation()
      augroup END
    endif
  endif


endif
