local qlik_settings = { linter = { active = true } }

return {
  cmd = { "qlik-ls", "--stdio" },
  filetypes = { "qvs" }, -- Use 'qlik' as the identifier
  root_markers = { "script.qvs",".git", "qlik-project.json" },
  settings = qlik_settings,
  handlers = {
    ["workspace/configuration"] = function(_, params, _)
      local res = {}
      for _ = 1, #(params.items or {}) do
        res[#res + 1] = qlik_settings
      end
      return res
    end,
    ["client/registerCapability"] = function() return {} end,
    ["client/unregisterCapability"] = function() return {} end,
    ["workspace/semanticTokens/refresh"] = function() return {} end,
    ["workspace/diagnostic/refresh"] = function() return {} end,
  },
  on_init = function(client)
    client.notify("workspace/didChangeConfiguration", { settings = qlik_settings })
  end,
}
