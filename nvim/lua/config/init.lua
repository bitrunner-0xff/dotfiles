require("config.options")
require("config.keymaps")
require("config.lazy_init")

-- To fold sstructure and function bodies

vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    callback = function(args)
        local ok = pcall(vim.treesitter.start)
        if ok then
            vim.opt_local.foldmethod = "expr"
            vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        else
            vim.opt_local.foldmethod = "indent" -- fallback if no parser
        end
    end
})

