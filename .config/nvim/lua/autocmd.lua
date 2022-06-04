local cmd = vim.cmd
-- --------------------------------------------------------------------------
-- AutoCommands
-- --------------------------------------------------------------------------
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- Dont auto comment new line

cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]) -- Command for recompile all plugins
-- Remove whitespace on save
--cmd([[au BufWritePre * :%s/\s\+$//e]])

-- Highlight on Yank
cmd([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
    augroup end
    ]])

-- "{ Auto commands
-- " Do not use smart case in command line mode,
-- " extracted from https://goo.gl/vCTYdK
-- augroup dynamic_smartcase
--     autocmd!
--     autocmd CmdLineEnter : set nosmartcase
--     autocmd CmdLineLeave : set smartcase
-- augroup END

-- " Set textwidth for text file types
-- augroup text_file_width
--     autocmd!
--     " Sometimes, automatic filetype detection is not right, so we need to
--     " detect the filetype based on the file extensions
--     autocmd BufNewFile,BufRead *.md,*.MD,*.markdown setlocal textwidth=79
-- augroup END

-- augroup term_settings
--     autocmd!
--     " Do not use number and relative number for terminal inside nvim
--     autocmd TermOpen * setlocal norelativenumber nonumber
--     " Go to insert mode by default to start typing command
--     autocmd TermOpen * startinsert
-- augroup END

-- " More accurate syntax highlighting? (see `:h syn-sync`)
-- augroup accurate_syn_highlight
--     autocmd!
--     autocmd BufEnter * :syntax sync fromstart
-- augroup END

-- " Return to last edit position when opening a file
-- augroup resume_edit_position
--     autocmd!
--     autocmd BufReadPost *
--         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
--         \ | execute "normal! g`\"zvzz"
--         \ | endif
-- augroup END

-- " Display a message when the current file is not in utf-8 format.
-- " Note that we need to use `unsilent` command here because of this issue:
-- " https://github.com/vim/vim/issues/4379
-- augroup non_utf8_file_warn
--     autocmd!
--     autocmd BufRead * if &fileencoding != 'utf-8'
--                 \ | unsilent echomsg 'File not in UTF-8 format!' | endif
-- augroup END

-- " Automatically reload the file if it is changed outside of Nvim, see
-- " https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
-- " command does not work in command line. We need to check if we are in command
-- " line before executing this command. See also http://tinyurl.com/y6av4sy9.
-- augroup auto_read
--     autocmd!
--     autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
--                 \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
--     autocmd FileChangedShellPost * echohl WarningMsg
--                 \ | echo "File changed on disk. Buffer reloaded!" | echohl None
-- augroup END

-- augroup goyo
--     autocmd! User GoyoEnter Limelight
--     autocmd! User GoyoLeaver Limelight!
-- augroup END

-- augroup mygroup
--   autocmd!
--   " Setup formatexpr specified filetype(s).
--   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
--   " Update signature help on jump placeholder.
--   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
-- augroup end
-- " Highlight the symbol and its references when holding the cursor.
-- autocmd CursorHold * silent call CocActionAsync('highlight')

-- augroup pandoc_syntax
--     " au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
--     au BufNewFile,BufFilePre,BufRead *.md set colorcolumn=120
--     au BufNewFile,BufFilePre,BufRead *.md set textwidth=120
-- augroup END

-- augroup html
--     " au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
--     au BufNewFile,BufFilePre,BufRead *.html set colorcolumn=120
--     au BufNewFile,BufFilePre,BufRead *.html set textwidth=120
-- augroup END

-- augroup jsreact
--     au FileType typescriptreact,javascriptreact nmap <leader>i :CocCommand tsserver.organizeImports<CR>
-- augroup END

-- au FileType c,cpp,objc,objcpp call rainbow#load()
