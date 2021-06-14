local fn = vim.fn
local api = vim.api

local M = {}

-- highlight groups
-- TODO: add blink to statusline
M.colors = {
	active       = "%#StatusLine#",
	inactive     = "%#StatusLineNC#",
}

M.trunc_width = setmetatable({
	git_status = 90,
	filename   = 140,
}, {
__index = function()
	return 80
	end,
})

M.is_truncated = function(_, width)
	local current_width = api.nvim_win_get_width(0)
	return current_width < width
end

M.modes = setmetatable({
	['n']  = 'Normal',
	['no'] = 'N·Pending',
	['v']  = 'Visual',
	['V']  = 'V·Line',
	[''] = 'V·Block',
	['s']  = 'Select',
	['S']  = 'S·Line',
	[''] = 'S·Block',
	['i']  = 'Insert',
	['ic'] = 'Insert',
	['R']  = 'Replace',
	['Rv'] = 'V·Replace',
	['c']  = 'Command',
	['cv'] = 'Vim·Ex ',
	['ce'] = 'Ex ',
	['r']  = 'Prompt ',
	['rm'] = 'More ',
	['r?'] = 'Confirm ',
	['!']  = 'Shell ',
	['t']  = 'Terminal ',
}, {
	__index = function()
		return "U" -- handle edge cases
	end,
})

M.get_current_mode = function(self)
	local current_mode = api.nvim_get_mode().mode
	return string.format(" %s ", self.modes[current_mode]):upper()
end

M.get_git_status = function(self)
	-- use fallback because it doesn't set this variable on the initial `BufEnter`
	local signs = vim.b.gitsigns_status_dict
	or { head = "", added = 0, changed = 0, removed = 0 }
	local is_head_empty = signs.head ~= ""

	if self:is_truncated(self.trunc_width.git_status) then
		return is_head_empty and string.format("  %s ", signs.head or "") or ""
	end

	return is_head_empty and string.format(
	"  %s 柳%s  %s   %s ",
	signs.added,
	signs.changed,
	signs.removed,
	signs.head
	) or ""
end

M.get_filepath = function(self)
	local filepath = fn.fnamemodify(fn.expand("%"), ":.:h")
	if
		filepath == ""
		or filepath == "."
		or self:is_truncated(self.trunc_width.filename)
	then
		return " "
	end

	return string.format(" %%<%s/", filepath)
end

M.get_filename = function()
	local filename = fn.expand("%:t")
	if filename == "" then return "" end
	return filename
end

local function tchelper(first, rest)
	return first:upper()..rest:lower()
end

local function firstUpper(str)
	return str:gsub("(%a)([%w_']*)", tchelper)
end

M.get_filetype = function()
	local file_name, file_ext = fn.expand("%:t"), fn.expand("%:e")
	local icon = require("nvim-web-devicons").get_icon(file_name, file_ext, { default = true })
	local filetype = vim.bo.filetype

	if filetype == "" then
		return " No FT "
	end

	filetype = string.format(" %s %s ", icon, filetype):lower()

	return firstUpper(filetype)
end

M.get_fileencoding = function()
	local fileencoding = vim.bo.fileencoding

	if fileencoding == "" then
		return " none "
	end
	return string.format(" %s ", fileencoding):upper()
end

M.get_filesize = function()
	local file = vim.fn.expand('%:p')
	if string.len(file) == 0 then return '' end
	return M.format_file_size(file)
end

M.format_file_size = function(file)
	local size = vim.fn.getfsize(file)
	if size == 0 or size == -1 or size == -2 then
		return ''
	end
	if size < 1024 then
		size = size .. 'b'
	elseif size < 1024 * 1024 then
		size = string.format('%.1f',size/1024) .. 'k'
	elseif size < 1024 * 1024 * 1024 then
		size = string.format('%.1f',size/1024/1024) .. 'm'
	else
		size = string.format('%.1f',size/1024/1024/1024) .. 'g'
	end
	return ' ' .. size .. ' '
end

M.get_tabwidth = function()
	return string.format(" Tab Size: %s ", vim.bo.tabstop)
end

M.get_line_col = function()
	return " %l:%c "
end

M.get_position = function()
	return " %P "
end

M.lsp_progress = function()
	local lsp = vim.lsp.util.get_progress_messages()[1]
	if lsp then
		local name = lsp.name or ""
		local msg = lsp.message or ""
		local percentage = lsp.percentage or 0
		local title = lsp.title or ""
		return string.format(" %s: %s %s (%s%%%%) ", name, title, msg, percentage)
	end

	return ""
end

M.set_active = function(self)
	local colors = self.colors

	local mode = self:get_current_mode()
	local git = self:get_git_status()

	local filename = string.format(
		"%s%s",
		self:get_filepath(),
		self:get_filename()
	)

	local filetype = self:get_filetype()
	local filesize = self:get_filesize()
	local fileencoding = self:get_fileencoding()
	local line_col = self:get_line_col()
	local tabwidth = self:get_tabwidth()
	local position = self:get_position()
	local lsp = self:lsp_progress()

	return table.concat({
		colors.active,
		filesize,
		git,
		lsp,
		filename,
		line_col,
		mode,
		colors.inactive,
		"%=",
		colors.active,
		tabwidth,
		fileencoding,
		filetype,
		position,
	})
end

M.set_inactive = function(self)
	return self.colors.inactive .. "%= %F %="
end

M.set_explorer = function(self)
	local title = "   "

	return table.concat({ self.colors.active, title, title_alt })
end

Statusline = setmetatable(M, {
__call = function(statusline, mode)
	if mode == "active" then
		return statusline:set_active()
	end
	if mode == "inactive" then
		return statusline:set_inactive()
	end
	if mode == "explorer" then
		return statusline:set_explorer()
	end
end,
})

Statusline.get_lsp_diagnostic = function(self)
	local result = {}
	local levels = {
		errors = 'Error',
		warnings = 'Warning',
		info = 'Information',
		hints = 'Hint'
	}

	for k, level in pairs(levels) do
		result[k] = vim.lsp.diagnostic.get_count(0, level)
	end

	if self:is_truncated(120) then
		return ''
	else
	return string.format(
		" :%s :%s :%s :%s ",
		result['errors'] or 0, result['warnings'] or 0,
		result['info'] or 0, result['hints'] or 0
	)
	end
end
