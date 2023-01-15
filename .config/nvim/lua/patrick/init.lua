require("patrick.remap")
require("patrick.set")
require("patrick.packer")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


vim.filetype.add {
    extenstion = {
        tfvars = 'hcl',
    }
}
