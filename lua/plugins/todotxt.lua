return {
  {
    "cche/todo-txt.nvim",
    config = function()
      require("todo-txt").setup({
        todo_file = "~/Dropbox/Apps/Simpletask/todo.txt",
      })
    end,
  },
}
