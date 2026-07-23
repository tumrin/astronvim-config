local M = {}

function M.setup()
	require("base16-colorscheme").setup({
		base00 = "#2e3440",
		base01 = "#3b4252",
		base02 = "#444c5e",
		base03 = "#707d99",
		base04 = "#d8dee9",
		base05 = "#eceff4",
		base06 = "#eceff4",
		base07 = "#eceff4",
		base08 = "#bf616a",
		base09 = "#5e81ac",
		base0A = "#88c0d0",
		base0B = "#8fbcbb",
		base0C = "#96bbe9",
		base0D = "#96e9e7",
		base0E = "#96d6e9",
		base0F = "#bf616a",
	})

	local hi = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	hi("TelescopeNormal", { fg = "#eceff4", bg = "#2e3440" })
	hi("TelescopeBorder", { fg = "#707d99", bg = "#2e3440" })
	hi("TelescopePromptNormal", {
		fg = "#eceff4",
		bg = "#2e3440",
	})
	hi("TelescopePromptBorder", {
		fg = "#707d99",
		bg = "#2e3440",
	})
	hi("TelescopePromptPrefix", {
		fg = "#8fbcbb",
		bg = "#2e3440",
	})
	hi(
		"TelescopePromptCounter",
		{ fg = "#d8dee9", bg = "#2e3440" }
	)
	hi("TelescopePromptTitle", {
		fg = "#2e3440",
		bg = "#8fbcbb",
	})
	hi("TelescopePreviewTitle", {
		fg = "#2e3440",
		bg = "#88c0d0",
	})
	hi("TelescopeResultsTitle", {
		fg = "#2e3440",
		bg = "#5e81ac",
	})
	hi(
		"TelescopeSelection",
		{ fg = "#eceff4", bg = "#444c5e" }
	)
	hi(
		"TelescopeSelectionCaret",
		{ fg = "#8fbcbb", bg = "#444c5e" }
	)
	hi("TelescopeMatching", { fg = "#8fbcbb", bold = true })
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
