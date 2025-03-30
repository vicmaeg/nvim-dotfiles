-- Autocmds are automatically loaded on the VeryLazy event
-- Add any additional autocmds here

local augroup = vim.api.nvim_create_augroup
local ViMarEgeGroup = augroup('ViMarEge', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ViMarEgeGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
