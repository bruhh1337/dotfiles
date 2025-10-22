local etc_dir = vim.fn.stdpath("config") .. "/etc"
local config_path = etc_dir .. "/colorscheme.txt"

-- Create the etc/ directory if it doesn't exist
if vim.fn.isdirectory(etc_dir) == 0 then
	vim.fn.mkdir(etc_dir, "p")
end

local function load_colorscheme()
	local f = io.open(config_path, "r")
	if f then
		local name = f:read("*l")
		f:close()
		if name and name ~= "" then
			pcall(vim.cmd, "colorscheme " .. name)
			return
		end
	end
	-- fallback default if nothing saved
	pcall(vim.cmd, "colorscheme vague")
end

load_colorscheme()

vim.keymap.set("n", "<leader>cs", function()
	require("telescope.builtin").colorscheme({
		enable_preview = true,
		attach_mappings = function(_, map)
			map("i", "<CR>", function(prompt_bufnr)
				local entry = require("telescope.actions.state").get_selected_entry()
				local name = entry.value
				-- Save the selected colorscheme to etc/colorscheme.txt
				local f = io.open(config_path, "w")
				if f then
					f:write(name)
					f:close()
				end
				require("telescope.actions").close(prompt_bufnr)
				vim.cmd("colorscheme " .. name)
			end)
			return true
		end,
	})
end, { desc = "Pick colorscheme", noremap = true, silent = true })
