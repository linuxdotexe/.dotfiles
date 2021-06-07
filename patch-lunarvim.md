# My Lunar-Vim Patch

This is to help me add my changes to add LunarVim config each time
I upgrade to the recent edits which overwrite my changes.

## Settings

- Change theme to gruvbox
  - Navigate to lv-settings.lua
  - change `O.colorscheme = 'lunar'` to `O.colorscheme = 'gruvbox'`
- Add the code to remember last cursor position (make a PR for this.)
    - Navigate to vimscript/functions.vim
    - Add the following to the file:
    ```
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
    ```

## My plug-ins

Check currently installed plug-ins and add the following:

- VimWiki
    ```
    use {"vimwiki/vimwiki", opt = true}   
    ```

## Discover installed plug-ins

These are the currently installed plug-ins.

- [ ] `folke/trouble.nvim`
- [ ] `kevinhwang91/nvim-bqf`
- [ ] `terrortylor/nvim-comment`
- [ ] `JoosepAlviste/nvim-ts-context-commentstring`
- [ ] `Pocco81/TrueZen.nvim`
