-- This crap for formatters and linters
return {
    "nvimtools/none-ls.nvim",
    config = function() 
        local null_ls = require("null-ls")

        null_ls.setup({
            debug = false,
            sources = {
                null_ls.builtins.diagnostics.golangci_lint,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
            },
        })
    end
}

