-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {
  ------Outline--------
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>O", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {},
  },
  ----Outline--------
  ----Disable quickgd from godot community pack------
  {
    "QuickGD/quickgd.nvim",
    enabled = false,
  },
  ----Disable quickgd from godot community pack------
  ------Hop------------
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
          },
          v = {
            ["s"] = { function() require("hop").hint_words { extend_visual = true } end, desc = "Hop hint words" },
            ["<S-s>"] = {
              function() require("hop").hint_lines { extend_visual = true } end,
              desc = "Hop hint lines",
            },
          },
        },
      },
    },
  },
}
