function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

    grey = "#505050"

    vim.api.nvim_set_hl(0, "Normal", { bg =  "none" } )
    vim.api.nvim_set_hl(0, "NormalFloat", { bg =  "none" } )
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" } )
    vim.api.nvim_set_hl(0, "StatusLine", { bg =  grey } )
end

ColorMyPencils()
