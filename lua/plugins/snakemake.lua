return {
  {
    "snakemake/snakemake",
    ft = "snakemake",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "misc/vim")
    end,
    init = function(plugin)
      require("lazy.core.loader").ftdetect(plugin.dir .. "misc/vim")
    end,
  },
  {
    "snakemake/snakefmt",

    ft = "snakemake",
    config = function()
      vim.g.snakefmt_fmt_on_save = 1
    end,
  },
}
