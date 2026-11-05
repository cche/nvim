return {
  "yousefakbar/notmuch.nvim",
  cmd = { "Notmuch", "Inbox", "NmSearch", "ComposeMail", "NotmuchDrafts" },
  dependencies = {
    "nvim-telescope/telescope.nvim", -- For interactive search & filters
  },
  opts = {
    -- Point to your local configurations if notmuch isn't global
    notmuch_binary = "notmuch",
    render_html_body = true, -- Uses w3m to clean up HTML mail inside Neovim
  },
}
