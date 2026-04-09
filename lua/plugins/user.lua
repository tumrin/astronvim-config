---@type LazySpec
return {
  -- TODO: remove when astrocommunity is updated
  {
    "mrcjkb/rustaceanvim",
    version = "^9", -- Recommended
    lazy = false, -- This plugin is already lazy
    specs = {
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          handlers = { rust_analyzer = false }, -- disable setup of `rust_analyzer`
        },
      },
    },
  },
  -- TODO: remove when astrocommunity is updated
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function() require("crates").setup() end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        prettierd = {
          require_cwd = true,
        },
        prettier = {
          require_cwd = true,
        },
      },
    },
  },
  {
    "smoka7/hop.nvim",
    opts = {},
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gs"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },
            ["g<S-s>"] = { function() require("hop").hint_lines() end, desc = "Hop hint lines" },
            ["ö"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },
            ["ä"] = { function() require("hop").hint_lines() end, desc = "Hop hint lines" },
            [";"] = { function() require("hop").hint_words() end, desc = "Hop hint words" },
            ["'"] = { function() require("hop").hint_lines() end, desc = "Hop hint lines" },
          },
          v = {
            ["ö"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
            ["ä"] = {
              function() require("hop").hint_lines { extend_visual = true } end,
              desc = "Hop hint lines",
            },
            [";"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
            ["'"] = {
              function() require("hop").hint_lines { extend_visual = true } end,
              desc = "Hop hint lines",
            },
          },
        },
      },
    },
  },
  {
    "RRethy/base16-nvim",
    config = function() require("matugen").setup() end,
  },
}
