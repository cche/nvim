vim.fn.sign_define(
    "LspDiagnosticsErrorSign",
    { texthl = "LspDiagnosticsErrorSign", text = "", numhl = "LspDiagnosticsErrorSign" }
)
vim.fn.sign_define(
    "LspDiagnosticsWarningSign",
    { texthl = "LspDiagnosticsWarningSign", text = "", numhl = "LspDiagnosticsWarningSign" }
)
vim.fn.sign_define(
    "LspDiagnosticsHintSign",
    { texthl = "LspDiagnosticsHintSign", text = "", numhl = "LspDiagnosticsHintSign" }
)
vim.fn.sign_define(
    "LspDiagnosticsInformationSign",
    { texthl = "LspDiagnosticsInformationSign", text = "", numhl = "LspDiagnosticsInformationSign" }
)

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help(), opts)
    vim.keymap.set("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>lwl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders))
    end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition(), opts)
    -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename(), opts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
end

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)",
}

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "pyright", "sourcery", "bashls", "yamlls" },
})

require("lsp.null-ls")

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.sumneko_lua.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.pyright.setup({
    on_attach = on_attach,
    root_dir = require("lspconfig").util.root_pattern(".git", "."),
    capabilities = capabilities,
})

lspconfig.sourcery.setup({
    init_options = {
        editor_version = "vim",
        extension_version = "vim.lsp",
    },
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.r_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.html.setup({
    capabilities = capabilities,
})

lspconfig.awk_ls.setup({})
lspconfig.tsserver.setup({})
lspconfig.yamlls.setup({})

-- require 'lspconfig'.ltex.setup {
--     cmd = { "ltex-ls" },
--     filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "mail", "text" },
--     single_file_support = true
-- }
