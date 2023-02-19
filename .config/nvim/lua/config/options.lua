vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.wildmode = "list:longest,list:full"
vim.opt.wildignore = "*.o,*.obj,.git,*.rbc,*.pyc,__pycache__"

vim.g.copilot_filetypes = {
  ["yaml"] = true,
  ["rust"] = true,
  ["go"] = true,
  ["terraform"] = true,
  ["python"] = true,
}
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-c>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
