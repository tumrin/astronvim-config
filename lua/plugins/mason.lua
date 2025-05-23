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

        -- install debuggers

        -- install any other package
      },
    },
  },
}
