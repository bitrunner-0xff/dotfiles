vim.opt.guicursor = ""
vim.opt.termguicolors = true

-- APPEARANCE -----------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wrap = false

-- TAB INDENT -----------------------------------------------------------------
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- MISC ----------------------------------------------------------------------
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt_global.backupdir = { "/tmp//" }
vim.opt.backupcopy = "auto"
vim.opt.backupext = ".vimbak"

-- TODO: check if anything is broken
vim.opt_global.completeopt = { "menu", "menuone", "noselect" }
vim.opt.conceallevel = 3 -- Hide * markup for bold and italic
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
-- Highlight matching brace
vim.opt.showmatch = true
vim.opt.complete = "kspell" -- TODO: test if it works at all
-- vim.opt.autocomplete = true
vim.opt.spelllang = {"en"}
vim.opt.spellsuggest = {"best", 9}
vim.opt_global.diffopt:append({ "vertical" })
vim.opt.wildignorecase = true
vim.opt.confirm = true
vim.opt.autowriteall = true
vim.opt.list = true
vim.opt.listchars =
    { tab = [[│ ]], trail = "•", extends = "»", precedes = "«" }
vim.opt.foldenable = false

-- SEARCH ---------------------------------------------------------------------
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 100
vim.opt.timeoutlen = 500

vim.opt.colorcolumn = "80"
vim.opt.background = "dark"

vim.opt.clipboard = 'unnamedplus'   -- use system clipboard


