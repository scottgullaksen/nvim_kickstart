-- https://github.com/akinsho/bufferline.nvim
-- More configuration, see :help bufferline

-- For ⁸·₂ formatting of tabnumber indicator
local numbers = function(opts)
  return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
end

require("bufferline").setup {
  options = {
    numbers = numbers,
    diagnostics = "nvim_lsp",
    offsets = {
      {
       filetype = "NvimTree",
       text = "File Explorer",
       text_align = "left",
        highlight = "Directory",
       separator = true,
      },
    },
  },
}

-- buffer mappingsbuffer
local opts = {noremap = true, silent = true}
vim.keymap.set("n", "<leader>c", ":bd<CR>", opts)
vim.keymap.set("n", "<leader>c", ":bd<CR>", opts)
vim.keymap.set("n", "<A-j>", ":bn<CR>", opts)
vim.keymap.set("n", "<A-k>", ":bp<CR>", opts)

vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", opts)
vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", opts)
vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", opts)
vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", opts)
vim.keymap.set("n", "<leader>$", ":BufferLineGoToBuffer -1<CR>", opts)

