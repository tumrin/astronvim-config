-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  ------SONARLINT------
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    ft = { "python", "cpp", "javascript", "typescript", "html", "java" },
    config = function()
      require("sonarlint").setup {
        server = {
          cmd = {
            "sonarlint-language-server",
            "-stdio",
            "-analyzers",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarpython.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarcfamily.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjs.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarhtml.jar.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjava.jar",
          },
        },
        filetypes = {
          "python",
          "cpp",
          "javascript",
          "typescript",
          "html",
          "java",
        },
      }
    end,
  },
  ------SONARLINT------
}