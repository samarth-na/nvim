-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
    { -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        -- Remove branch specification temporarily
        -- branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            -- Useful for getting pretty icons, but requires a Nerd Font.
            { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- Setup with your custom defaults
            require('telescope').setup {
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        "%.png", "%.jpg", "%.jpeg", "%.gif", "%.bmp", "%.tiff", "%.webp", "%jfif",
                        -- Compiled files
                        "%.class", "%.jar", "%.pyc", "%.o", "%.obj", "%.so", "%.dll", "%.a",
                        "%.lib", "%.bin", "%.exe", "%.out", "%.hex", "%.elf", "%.ko", "%.mod",
                        -- Videos
                        "%.mp3", "%.mp4", "%.mkv", "%.avi", "%.mov", "%.wmv", "%.flv", "%.webm",
                        -- PDFs
                        "%.pdf", "%.PDF",
                        "__pycache__",
                    },
                    layout_config = {
                        width = 0.9,
                    },
                },
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }

            -- Enable Telescope extensions if they are installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            -- All your keymaps
            local builtin = require('telescope.builtin')

            -- File operations
            vim.keymap.set('n', '<leader>o', builtin.oldfiles, { desc = 'old opened files' })
            vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'search in buffers' })
            vim.keymap.set('n', '<localleader>o', builtin.oldfiles, { desc = 'old opened files' })
            vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'search in buffers(the opened files rn)' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'find files' })
            vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'find files' })
            vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'colorscheme' })

            vim.api.nvim_set_keymap('n', '<leader>fa',
                [[<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>]],
                { noremap = true, silent = true, desc = 'find in all files' })

            -- Navigation in code
            vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = 'find in jumplist' })
            vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = 'find in quickfix' })
            vim.keymap.set('n', '<leader>ss', builtin.treesitter, { desc = 'search symbol in the buffer' })
            vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'search marks' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'search by grep' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'search current Word' })

            -- Extra telescope features
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
            vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = 'Search Telescope builtin' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })

            -- Git
            vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search git files' })

            -- Custom themed pickers
            vim.keymap.set('n', '<leader>sd', function()
                builtin.diagnostics(require('telescope.themes').get_dropdown {
                    winblend = 0,
                    previewer = true,
                    layout_config = {
                        width = 200,
                        height = 15,
                        prompt_position = 'top',
                        mirror = true,
                        anchor = 'N',
                    },
                })
            end, { desc = 'diagnostics' })

            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 1,
                    previewer = false,
                    layout_config = {
                        height = 20,
                    }
                })
            end, { desc = 'Fuzzily search in current buffer' })

            vim.keymap.set('n', '<localleader>g', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 1,
                    previewer = false,
                    layout_config = {
                        height = 20,
                    }
                })
            end, { desc = 'Fuzzily search in current buffer' })

            vim.keymap.set('n', '<leader>wg', function()
                builtin.live_grep(require('telescope.themes').get_dropdown {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                    winblend = 1,
                    previewer = false,
                    layout_config = {
                        height = 20,
                    }
                })
            end, { desc = 'grep in file' })

            vim.keymap.set('n', '<localleader>c', function()
                builtin.commands(require('telescope.themes').get_dropdown {
                    prompt_title = 'search commands',
                    winblend = 1,
                    previewer = false,
                    layout_config = {
                        height = 0,
                        width = 100,
                    }
                })
            end, { desc = 'search commands' })

            vim.keymap.set('n', '<leader>sc', function()
                builtin.commands(require('telescope.themes').get_dropdown {
                    grep_open_files = true,
                    prompt_title = 'search commands',
                    winblend = 1,
                    previewer = false,
                    layout_config = {
                        height = 20,
                        width = 158,
                    }
                })
            end, { desc = 'commands' })

            vim.keymap.set('n', 'gw', function()
                builtin.grep_string(require('telescope.themes').get_cursor {
                    winblend = 1,
                    previewer = true,
                    layout_config = {
                        height = 20,
                        width = 158,
                    }
                })
            end, { desc = 'current word' })

            vim.keymap.set('n', '<leader>sg', function()
                builtin.live_grep(require('telescope.themes').get_dropdown {
                    winblend = 0,
                    previewer = true,
                    layout_config = {
                        width = 120,
                        height = 15,
                        prompt_position = 'top',
                        mirror = true,
                        anchor = 'N',
                    },
                })
            end, { desc = 'grep in directory' })

            vim.keymap.set('n', '<localleader>s', function()
                builtin.spell_suggest(require('telescope.themes').get_cursor {
                    winblend = 0,
                    previewer = true,
                    layout_config = {
                        width = 30,
                        height = 15,
                    }
                })
            end, { desc = 'spell suggest' })

            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = 'Neovim files' })
        end,
    },
}
-- vim: ts=4 sts=4 sw=4 et
