local M = {}

function M.setup()
  require("base16-colorscheme").setup {
    -- Background tones
    base00 = "#2e3440", -- Default Background
    base01 = "#3b4252", -- Lighter Background (status bars)
    base02 = "#444c5e", -- Selection Background
    base03 = "#707d99", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#d8dee9", -- Dark Foreground (status bars)
    base05 = "#eceff4", -- Default Foreground
    base06 = "#eceff4", -- Light Foreground
    base07 = "#eceff4", -- Lightest Foreground
    -- Accent colors
    base08 = "#bf616a", -- Variables, XML Tags, Errors
    base09 = "#5e81ac", -- Integers, Constants
    base0A = "#88c0d0", -- Classes, Search Background
    base0B = "#8fbcbb", -- Strings, Diff Inserted
    base0C = "#96bbe9", -- Regex, Escape Chars
    base0D = "#96e9e7", -- Functions, Methods
    base0E = "#96d6e9", -- Keywords, Storage
    base0F = "#f0dbdd", -- Deprecated, Embedded Tags
  }
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
