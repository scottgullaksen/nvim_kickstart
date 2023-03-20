-- https://github.com/nvim-tree/nvim-tree.lua
-- help nvim-tree.on_attach - set mappings
-- :help nvim-tree-mappings-default - inspo på hvordan sette
-- :help nvim-tree-commands

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- To set mappings
local function my_on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- use defaults as utgangspunkt
  api.config.mappings.default_on_attach(bufnr)

  -- your removals and mappings go here
  vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
end

-- See https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
-- Essentially, automatic opening of nvimtree is left to the user.
-- So, we create a autocommand for it.
local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  -- local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  if no_name then
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
    return
  end

  local directory = vim.fn.isdirectory(data.file) == 1

  if directory then
    -- change to the directory
    vim.cmd.cd(data.file)
    -- open the tree
    require("nvim-tree.api").tree.open()
    return
  end
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- :help nvim-tree-setup
require("nvim-tree").setup {
  on_attach = my_on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  diagnostics = {
    enable = true
  },
}

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
