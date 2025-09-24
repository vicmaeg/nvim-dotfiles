-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here
vim.g.mapleader = " "

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- utils
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- execute cursor
vim.keymap.set("n", "<leader>rc", "<cmd>!cursor . %<CR><CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Leader mappings ============================================================

-- Create `<Leader>` mappings
local nmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set("n", "<Leader>" .. suffix, rhs, opts)
end
local xmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set("x", "<Leader>" .. suffix, rhs, opts)
end

-- b is for 'buffer'
nmap_leader('ba', '<Cmd>b#<CR>',                                 'Alternate')
nmap_leader('bd', '<Cmd>lua MiniBufremove.delete()<CR>',         'Delete')
nmap_leader('bD', '<Cmd>lua MiniBufremove.delete(0, true)<CR>',  'Delete!')
nmap_leader('bw', '<Cmd>lua MiniBufremove.wipeout()<CR>',        'Wipeout')
nmap_leader('bW', '<Cmd>lua MiniBufremove.wipeout(0, true)<CR>', 'Wipeout!')

-- e is for 'explore'
nmap_leader("ed", "<Cmd>lua MiniFiles.open()<CR>", "Directory")
nmap_leader("ef", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", "File directory")
vim.keymap.set("n", "-", function()
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      MiniFiles.open(path)
      MiniFiles.reveal_cwd()
    end, { desc = "Open current directory" })

-- f is for 'fuzzy find'
nmap_leader("f/", '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader("f:", '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader("fa", '<Cmd>Pick git_hunks scope="staged"<CR>', "Added hunks (all)")
nmap_leader("fA", '<Cmd>Pick git_hunks path="%" scope="staged"<CR>', "Added hunks (current)")
nmap_leader("fb", "<Cmd>Pick buffers<CR>", "Buffers")
nmap_leader("fc", "<Cmd>Pick git_commits<CR>", "Commits (all)")
nmap_leader("fC", '<Cmd>Pick git_commits path="%"<CR>', "Commits (current)")
nmap_leader("fd", '<Cmd>Pick diagnostic scope="all"<CR>', "Diagnostic workspace")
nmap_leader("fD", '<Cmd>Pick diagnostic scope="current"<CR>', "Diagnostic buffer")
nmap_leader("ff", "<Cmd>Pick files<CR>", "Files")
nmap_leader("fg", "<Cmd>Pick grep_live<CR>", "Grep live")
nmap_leader("fG", '<Cmd>Pick grep pattern="<cword>"<CR>', "Grep current word")
nmap_leader("fh", "<Cmd>Pick help<CR>", "Help tags")
nmap_leader("fH", "<Cmd>Pick hl_groups<CR>", "Highlight groups")
nmap_leader("fl", '<Cmd>Pick buf_lines scope="all"<CR>', "Lines (all)")
nmap_leader("fL", '<Cmd>Pick buf_lines scope="current"<CR>', "Lines (current)")
nmap_leader("fm", "<Cmd>Pick git_hunks<CR>", "Modified hunks (all)")
nmap_leader("fM", '<Cmd>Pick git_hunks path="%"<CR>', "Modified hunks (current)")
nmap_leader("fr", "<Cmd>Pick resume<CR>", "Resume")
nmap_leader("fp", "<Cmd>Pick projects<CR>", "Projects")
nmap_leader("fR", '<Cmd>Pick lsp scope="references"<CR>', "References (LSP)")
nmap_leader("fs", '<Cmd>Pick lsp scope="workspace_symbol"<CR>', "Symbols workspace (LSP)")
nmap_leader("fS", '<Cmd>Pick lsp scope="document_symbol"<CR>', "Symbols buffer (LSP)")
nmap_leader("fv", '<Cmd>Pick visit_paths cwd=""<CR>', "Visit paths (all)")
nmap_leader("fV", "<Cmd>Pick visit_paths<CR>", "Visit paths (cwd)")
nmap_leader("fk", "<Cmd>Pick keymaps<CR>", "Keymaps")

-- Git
local git_log_cmd = [[Git log --pretty=format:\%h\ \%as\ │\ \%s --topo-order]]
nmap_leader("gg", "<cmd>Neogit<CR>", "Git tab")
nmap_leader("gb", ":Gitsigns blame<CR>", "Git blame")
nmap_leader("gB", ":Gitsigns toggle_current_line_blame<CR>", "Git toggle line blame")
nmap_leader("ga", "<Cmd>Git diff --cached<CR>", "Added diff")
nmap_leader("gA", "<Cmd>Git diff --cached -- %<CR>", "Added diff buffer")
nmap_leader("gc", "<Cmd>Git commit<CR>", "Commit")
nmap_leader("gC", "<Cmd>Git commit --amend<CR>", "Commit amend")
nmap_leader("gd", "<Cmd>Git diff<CR>", "Diff")
nmap_leader("gD", "<Cmd>Git diff -- %<CR>", "Diff buffer")
nmap_leader("gl", "<Cmd>" .. git_log_cmd .. "<CR>", "Log")
nmap_leader("gL", "<Cmd>" .. git_log_cmd .. " --follow -- %<CR>", "Log buffer")

-- l is for 'LSP' (Language Server Protocol)
nmap_leader('la', '<Cmd>lua vim.lsp.buf.code_action()<CR>',   'Actions') -- default is gra
nmap_leader('ld', '<Cmd>lua vim.diagnostic.open_float()<CR>', 'Diagnostics popup')
nmap_leader('li', '<Cmd>lua vim.lsp.buf.hover()<CR>',         'Information') -- default is K
nmap_leader('lj', '<Cmd>lua vim.diagnostic.goto_next()<CR>',  'Next diagnostic')
nmap_leader('lk', '<Cmd>lua vim.diagnostic.goto_prev()<CR>',  'Prev diagnostic')
nmap_leader('lR', '<Cmd>lua vim.lsp.buf.references()<CR>',    'References') -- default is grr
nmap_leader('lr', '<Cmd>lua vim.lsp.buf.rename()<CR>',        'Rename') -- default is grn
nmap_leader('ls', '<Cmd>lua vim.lsp.buf.definition()<CR>',    'Source definition')
