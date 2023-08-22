-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set snakemake filetype
local snakemake = vim.api.nvim_create_augroup("snakemake", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "Snakefile,*.smk",
    command = "set filetype=snakemake",
    group = snakemake,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = "Snakefile,*.smk",
    command = ":Snakefmt",
    group = snakemake,
})
