local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  "sumneko_lua",
  "rust_analyzer",
  "terraform-ls",
})
lsp.setup()
