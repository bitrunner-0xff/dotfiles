return {
    {
        "williamboman/mason.nvim",
        config = function() 
            require('mason').setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function() 
            require('mason-lspconfig').setup({
                opts = {
                    ensure_installed = { "gopls", "pyright" }

                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function() 
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('my.lsp', {}),
                callback = function(args)
                    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
                    local opts = {buffer = args.buf, noremap = true, silent = true }

                    -- Keymaps (instead of old on_attach)
                    if client:supports_method("textDocument/definition") then
                        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    end

                    if client:supports_method("textDocument/hover") then
                        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    end

                    -- Renaming
                    if client:supports_method("textDocument/rename") then
                        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    end

                    -- Enable autocompletion
                    if client:supports_method("textDocument/completion") then
                        vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
                    end

                    if client:supports_method("textDocument/formatting") then
                        local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ async = false, timeout_ms = 1500 })
                            end,
                        })
                    end

                    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                end,
            })

            -- === Define new-style server configs ===

            vim.lsp.config["gopls"] = {
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                root_markers = { "go.work", "go.mod", ".git" },
                capabilities = capabilities,
            }

            -- === Enable servers ===

            vim.lsp.enable("gopls")
        end
    }
}
