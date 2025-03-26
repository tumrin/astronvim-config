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
}
