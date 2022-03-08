local gl = require('galaxyline')
local colors = {
  bg = '#13141f',
  fg = '#f8f8f2',
  yellow = '#f1fa8c',
  cyan = '#8BE9FD',
  darkblue = '#21222C',
  green = '#50FA7B',
  orange = '#FFB86C',
  violet = '#BD93F9',
  magenta = '#FF79C6',
  blue = '#44475A',
  red = '#FF5555',
}
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.blue, i = colors.violet,v=colors.magenta,
                          [''] = colors.orange,V=colors.orange,
                          c = colors.magenta,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '▊ '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
}
gls.left[2] = {
}
gls.left[3] = {
}
gls.left[4] = {}
gls.left[5] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}
gls.left[6] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'}
  }
}
gls.left[7] = {}
gls.left[8] = {}
gls.left[9] = {}
gls.left[10] = {}
gls.left[11] = {}

gls.mid[1] = {
}

gls.right[1] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = '',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}
gls.right[2] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}
gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg},
  },
}

gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'},
  }
}

gls.right[5] = {}
gls.right[6] = {}
gls.right[7] = {}
gls.right[8] = {}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
