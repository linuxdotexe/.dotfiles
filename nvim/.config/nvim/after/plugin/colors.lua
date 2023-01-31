function ColorMyPencils(color)
	color = color or "melange"
	vim.cmd.colorscheme(color)

    grey = "#252525"

    vim.api.nvim_set_hl(0, "Normal", { bg =  "none" } )
    vim.api.nvim_set_hl(0, "NormalFloat", { bg =  "none" } )
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" } )
    vim.api.nvim_set_hl(0, "StatusLine", { bg =  grey } )
end

ColorMyPencils()
