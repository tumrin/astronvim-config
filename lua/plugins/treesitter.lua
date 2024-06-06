if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts) opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {}) end,
}
