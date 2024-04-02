-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  ------SONARLINT------
  {
    url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    ft = { "python", "cpp", "c", "javascript", "typescript", "html", "java", "go", "php" },
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
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarhtml.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarjava.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonargo.jar",
            vim.fn.expand "$MASON/share/sonarlint-analyzers/sonarphp.jar",
          },
        },
        filetypes = {
          "python",
          "cpp",
          "c",
          "javascript",
          "typescript",
          "html",
          "java",
          "go",
          "php",
        },
      }
    end,
  },
  ------SONARLINT------
  --TODO: can be removed when nvim 0.10 is released
  ------INLAY HINTS------
  {
    url = "https://github.com/simrat39/inlay-hints.nvim",
    config = function()
      require("inlay-hints").setup {
        renderer = "inlay-hints/render/eol",
        eol = {
          parameter = {
            separator = ", ",
            format = function(hints) return string.format(" << %s", hints) end,
          },

          type = {
            separator = ", ",
            format = function(hints) return string.format(" >> %s", hints) end,
          },
        },
      }
    end,
  },
  ------INLAY HINTS------
}
