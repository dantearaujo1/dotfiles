if exists('g:vscode')
  let g:vscode_disable_startup_message = 1 " Disable Neovim startup message in VS Code
  let g:loaded_matchparen = 1              " Disable matchparen plugin (optional)
  nnoremap <C-s> :w<CR>          " Map Ctrl+S to save
  nnoremap <C-q> :q<CR>          " Map Ctrl+Q to quit
  lua require 'dante/vscode'
endif

if !exists('g:vscode')
  lua require 'init'

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

