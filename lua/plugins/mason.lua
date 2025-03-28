-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "biome",
        "rust-analyzer",
        "zls",

        -- install formatters
        "gofumpt",
        "prettierd",

        -- install debuggers

        -- install any other package
      },
    },
    handlers = {
      -- for prettierd
      prettierd = function()
        require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
          condition = function(utils)
            return utils.has_file ".prettierrc" or utils.has_file ".prettierrc.json" or utils.has_file ".prettierrc.js"
          end,
        })
      end,
    },
  },
}
