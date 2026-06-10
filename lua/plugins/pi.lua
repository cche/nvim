vim.keymap.set("n", "<leader>ai", ":PiAsk<CR>", { desc = "Ask pi" })

-- Ask pi with visual selection as context
vim.keymap.set("v", "<leader>ai", ":PiAskSelection<CR>", { desc = "Ask pi (selection)" })

return {
  "pablopunk/pi.nvim",
  opts = {
    -- provider = "ollama",
    -- model = "gemma4:latest",
    -- model = "codellama:13b",
    provider = "google",
    model = "gemini-3.1-flash-lite",
  },
}
