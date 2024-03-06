require("keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:2"
-- vim.opt.nuw = 6
vim.opt.cursorline = true
-- vim.cmd([[highlight CursorLine ctermbg=0 guibg=#560404]])
-- vim.cmd([[highlight LineNr ctermbg=0 guibg=#032843 guifg=grey]])
vim.cmd([[highlight TreesitterContextBottom gui=underline guisp=Green]])
vim.cmd([[highlight TreesitterContextLineNumberBottom gui=underline guisp=Grey]])
-- Keymaps
