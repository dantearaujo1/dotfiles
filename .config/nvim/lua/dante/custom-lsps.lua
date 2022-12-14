local launch_processing_server = function ()
  local autocmd = 9999
  local filetypes = {
    'pde',
    '.pde',
    'processing',

  }
  local config = {
    cmd = {'sh', '~/dev/setup/processing/LS4P/initserver.sh'},
    name = 'processingserver',
    root_dir = vim.fn.getcwd(),
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  }

  config.on_init = function(client,results)
    local buf_attach = function ()
      vim.lsp.buf_attach_client(0,client.id)
    end

    autocmd = vim.api.nvim_create_autocmd('FileType', {
      desc = string.format('Attach LSP: %s', client.name),
      pattern = filetypes,
      callback = buf_attach
    })

    if vim.v.vim_did_enter == 1 and
      vim.tbl_contains(filetypes, vim.bo.filetype)
    then
      buf_attach()
    end
  end

  config.on_exit = vim.schedule_wrap(function(code, signal, client_id)
    vim.api.nvim_del_autocmd(autocmd)
  end)

  vim.lsp.start_client(config)
end


vim.api.nvim_create_user_command(
  'LaunchProcessingServer',
  launch_processing_server,
  {desc = 'Start LS4P server'}
)
