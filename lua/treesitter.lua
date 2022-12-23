require("nvim-treesitter.configs").setup({

    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "dockerfile",
        "fish",
        "html",
        "javascript",
        "json",
        "julia",
        "lua",
        "python",
        "ql",
        "r",
        "rst",
        "go",
        "rust",
        "vim",
        "ruby",
        "tsx",
        "typescript",
        "vue",
        "yaml",
        "make",
        "cmake",
        "gitattributes",
        "gitignore",
        "markdown",
        "markdown_inline",
        "todotxt",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true, -- false will disable the whole extension
        additional_vim_regex_highlighting = { "markdown" },
    },
})
