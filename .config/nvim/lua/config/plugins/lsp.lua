return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    event = "VeryLazy",
    config = function()
      require("lspconfig") -- Ensure lspconfig is loaded (provides server configs)
      local util = require("config.util")
      local servers = { "lua_ls", "bashls", "pyright" }
      for _, server_name in ipairs(servers) do
        -- Use the new Neovim 0.11 API: vim.lsp.config() to customize config
        vim.lsp.config(server_name, {
          on_attach = util.on_attach,
          capabilities = util.capabilities,
        })
        -- Enable the server so it activates for its filetypes
        vim.lsp.enable(server_name)
      end
    end,
  },
}
