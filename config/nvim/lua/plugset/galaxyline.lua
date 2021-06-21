local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
	ViMode = {
		provider = function()
			-- auto change color according the vim mode
			local mode_color = {
				n = colors.red,
				i = colors.green,
				v=colors.blue,
				[''] = colors.blue,
				V=colors.blue,
				c = colors.magenta,
				no = colors.red,
				s = colors.orange,
				S=colors.orange,
				[''] = colors.orange,
				ic = colors.yellow,
				R = colors.violet,
				Rv = colors.violet,
				cv = colors.red,
				ce=colors.red,
				r = colors.cyan,
				rm = colors.cyan,
				['r?'] = colors.cyan,
				['!']  = colors.red,
				t = colors.red
			}
			vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
			return '▊ '
		end,
		highlight = {colors.red, colors.bg}
	}
}

gls.left[2] = {
	FileSize = {
		provider = 'FileSize',
		condition = condition.hide_in_width,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.left[3] = {
	FileName = {
		provider = 'FileName',
		condition = condition.hide_in_width,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.left[4] = {
	GitIcon = {
		provider = function() return ' ' end,
		condition = condition.check_git_workspace,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.orange, colors.bg}
	}
}

gls.left[5] = {
	GitBranch = {
		provider = 'GitBranch',
		condition = condition.check_git_workspace,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.left[6] = {
	DiffAdd = {
		provider = 'DiffAdd',
		condition = condition.hide_in_width,
		icon = '  ',
		highlight = {colors.green, colors.bg}
	}
}

gls.left[7] = {
	DiffModified = {
		provider = 'DiffModified',
		condition = condition.hide_in_width,
		icon = ' 柳',
		highlight = {colors.blue, colors.bg}
	}
}

gls.left[8] = {
	DiffRemove = {
		provider = 'DiffRemove',
		condition = condition.hide_in_width,
		icon = '  ',
		highlight = {colors.red, colors.bg}
	}
}

gls.right[1] = {
	DiagnosticError = {
		provider = 'DiagnosticError',
		icon = '  ',
		highlight = {colors.error_red, colors.bg}
	}
}

gls.right[2] = {
	DiagnosticWarn = {
		provider = 'DiagnosticWarn',
		icon = '  ',
		highlight = {colors.orange, colors.bg}
	}
}

gls.right[3] = {
	DiagnosticWarn = {
		provider = 'DiagnosticHint',
		icon = '  ',
		highlight = {colors.vivid_blue, colors.bg}
	}
}

gls.right[4] = {
	DiagnosticInfo = {
		provider = 'DiagnosticInfo',
		icon = '  ',
		highlight = {colors.info_yellow, colors.bg}
	}
}

gls.right[5] = {
	TreesitterIcon = {
		provider = function()
			if next(vim.treesitter.highlighter.active) ~= nil then return ' ' end
			return ''
		end,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.green, colors.bg}
	}
}

gls.right[6] = {
	ShowLspClient = {
		provider = 'GetLspClient',
		condition = function()
			local tbl = {['dashboard'] = true, [' '] = true}
			if tbl[vim.bo.filetype] then return false end
			return true
		end,
		icon = '  ',
		highlight = {colors.grey, colors.bg}
	}
}

gls.right[7] = {
	LineInfo = {
		provider = 'LineColumn',
		separator = '  ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.right[8] = {
	PerCent = {
		provider = 'LinePercent',
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.right[9] = {
	Tabstop = {
		provider = function()
			return "Tab Size: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") .. " "
		end,
		condition = condition.hide_in_width,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.right[10] = {
	FileIcon = {
		provider= 'FileIcon',
		highlight = {colors.fg,colors.bg}
	}
}

gls.right[11] = {
	BufferType = {
		provider = 'FileTypeName',
		condition = condition.hide_in_width,
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.right[12] = {
	FileEncode = {
		provider = 'FileEncode',
		condition = condition.hide_in_width,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.grey, colors.bg}
	}
}

gls.right[13] = {
	Space = {
		provider = function()
			return ' '
		end,
		separator = ' ',
		separator_highlight = {'NONE', colors.bg},
		highlight = {colors.orange, colors.bg}
	}
}

gls.short_line_left[1] = {
	BufferIcon = {
		provider= 'BufferIcon',
		highlight = {colors.fg,colors.bg}
	}
}

gls.short_line_left[2] = {
	SFileName = {
		provider =  'SFileName',
		condition = condition.buffer_not_empty,
		highlight = {colors.fg,colors.bg,'bold'}
	}
}
