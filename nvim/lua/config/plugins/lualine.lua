return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() 
        require('lualine').setup({
            options = {
                always_show_tabline = true,
                icons_enabled = true,
                theme = 'nightfly',
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff'},
                lualine_c = {'lsp_status',  {
                    'diagnostics',
                    sources = { 'nvim_lsp', 'coc' },
                    sections = { 'error', 'warn', 'info', 'hint' },
                    diagnostics_color = {
                        error = 'DiagnosticError', -- Changes diagnostics' error color.
                        warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                        info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                        hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                    },
                    symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
                    colored = true,  
                    update_in_insert = false,
                    always_visible = false
                }, 
                    'filesize',
                    'filename'
                },
                lualine_x = {'encoding', 'fileformat', {
                    'filetype',
                    colored = true,   -- Displays filetype icon in color if set to true
                    icon_only = true, -- Display only an icon for filetype
                    icon = { align = 'center' }, -- Display filetype icon on the right hand side
                } },
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            tabline = {
                lualine_a = {'tabs'}
            }
        })
    end
}

