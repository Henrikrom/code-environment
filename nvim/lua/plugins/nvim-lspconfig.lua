return {
    -- LSP Config plugin
    {
        'neovim/nvim-lspconfig', -- Core LSP support
        dependencies = {
            'williamboman/mason.nvim',          -- For LSP management
            'williamboman/mason-lspconfig.nvim' -- Bridges Mason and nvim-lspconfig
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls"

                }
            })

            local on_attach = function(_, _)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
                vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, {})
            end

            require("lspconfig").lua_ls.setup {
                on_attach = on_attach
            }

            require('lspconfig').omnisharp.setup({
                cmd = { "omnisharp" },  -- This assumes omnisharp is available in your PATH
                filetypes = { "cs" },
                on_attach = on_attach
            })

            require('roslyn').setup {
                args = {
                    '--logLevel=Information',
                    '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
                    '--razorSourceGenerator=' .. vim.fs.joinpath(
                    vim.fn.stdpath 'data' --[[@as string]],
                    'mason',
                    'packages',
                    'roslyn',
                    'libexec',
                    'Microsoft.CodeAnalysis.Razor.Compiler.dll'
                    ),
                    '--razorDesignTimePath=' .. vim.fs.joinpath(
                    vim.fn.stdpath 'data' --[[@as string]],
                    'mason',
                    'packages',
                    'rzls',
                    'libexec',
                    'Targets',
                    'Microsoft.NET.Sdk.Razor.DesignTime.targets'
                    ),
                },
                config = {
                    --[[ the rest of your roslyn config ]]
                    handlers = require 'rzls.roslyn_handlers',
                },
            }
        end,
    },
}

