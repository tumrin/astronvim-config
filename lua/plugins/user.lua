---@diagnostic disable: missing-fields, missing-parameter
-- You can also add or configure plugins by creating files in this `plugins/` folder
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
  ------Outline--------
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
