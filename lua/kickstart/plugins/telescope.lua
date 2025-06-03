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
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            "debugloop/telescope-undo.nvim",
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- Telescope is a fuzzy finder that comes with a lot of different things that
            -- it can fuzzy find! It's more than just a "file finder", it can search
            -- many different aspects of Neovim, your workspace, LSP, and more!
            --
            -- The easiest way to use Telescope, is to start by doing something like:
            --  :Telescope help_tags
            --
            -- After running this command, a window will open up and you're able to
            -- type in the prompt window. You'll see a list of `help_tags` options and
            -- a corresponding preview of the help.
            --
            -- Two important keymaps to use while in Telescope are:
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            --
            -- This opens a window that shows you all of the keymaps for the current
            -- Telescope picker. This is really useful to discover what Telescope can
            -- do as well as how to actually do it!

            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            require('telescope').setup {
                require("telescope").load_extension("undo"),
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                --
                defaults = {
                    file_ignore_patterns = {
                        "node_modules",
                        "%.png", "%.jpg", "%.jpeg", "%.gif", "%.bmp", "%.tiff", "%.webp", "%jfif",
                        -- Compiled files
                        "%.class", "%.jar", "%.pyc", "%.o", "%.obj", "%.so", "%.dll", "%.a",
                        "%.lib", "%.bin", "%.exe", "%.out", "%.hex", "%.elf", "%.ko", "%.mod",
                        "%.ko", "%.dwo", "%.lo", "%.o", "%.ko", "%.so", "%.slo", "%.a", "%.la",
                        "%.node", "%.d.ts", "%.js.map", "%.d.ts.map", "%.js.map", "%.ts.map",
                        "%.d.ts.map", "%.ts.map", "%.d.ts.map", "%.ts.map", "%.d.ts.map",
                        "%.ts.map", "%.d.ts.map", "%.ts.map", "%.d.ts.map", "%.ts.map",
                        "%.d.ts.map", "%.ts.map", "%.d.ts.map", "%.ts.map", "%.d.ts.map",
                        "%.ts.map", "%.d.ts.map", "%.ts.map", "%.d.ts.map", "%.ts.map",
                        -- temprary files
                        "%.tmp",
                        -- Videos
                        "%.mp4", "%.mkv", "%.avi", "%.mov", "%.wmv", "%.flv", "%.webm",
                        -- PDFs
                        "%.pdf",
                        "__pycache__",
                    },

                    layout_config = {
                        width = 0.9,
                    },
                    mappings = {
                        i = { ['<c-enter>'] = 'to_fuzzy_refine' }
                    },
                },
                -- pickers = {}
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }

            -- Enable Telescope extensions if they are installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            -- See `:help telescope.builtin`
            Builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>o', Builtin.oldfiles, { desc = 'old  opened files' })
            vim.keymap.set('n', '<leader>b', Builtin.buffers, { desc = 'search in buffers' })
            vim.keymap.set('n', '<localleader>o', Builtin.oldfiles, { desc = 'old  opened files' })
            vim.keymap.set('n', '<leader>fo', Builtin.oldfiles, { desc = 'search in buffers(the opened files rn)' })
            vim.keymap.set('n', '<leader>ff', Builtin.find_files, { desc = 'find files' })
            vim.keymap.set('n', '<leader><space>', Builtin.find_files, { desc = 'find files' })
            vim.keymap.set('n', '<leader>fc', Builtin.colorscheme, { desc = 'colorscheme' })



            -- vim.api.nvim_set_keymap('n', '<localleader>a',
            --     [[<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>]],
            --     { noremap = true, silent = true, desc = 'find in all files' })

            vim.api.nvim_set_keymap('n', '<leader>fa',
                [[<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>]],
                { noremap = true, silent = true, desc = 'find in all files' })
            ----------------------------------------------------------------------------------------

            -- move in out of your code base and shit
            vim.keymap.set('n', '<leader>sj', Builtin.jumplist, { desc = 'find in jumplist' })
            vim.keymap.set('n', '<leader>sq', Builtin.quickfix, { desc = 'find in quickfix' })
            vim.keymap.set('n', '<leader>ss', Builtin.treesitter, { desc = 'search symbol in the buffer' })
            vim.keymap.set('n', '<leader>sm', Builtin.marks, { desc = 'search marks' })
            vim.keymap.set('n', '<leader>sm', Builtin.marks, { desc = 'search marks' })
            vim.keymap.set('n', '<leader>sg', Builtin.live_grep, { desc = 'search by grep' })
            vim.keymap.set('n', '<leader>sw', Builtin.grep_string, { desc = 'search current Word' })


            ----------------------------------------------------------------------------------------

            -- extra telescope
            vim.keymap.set('n', '<leader>sh', Builtin.help_tags, { desc = 'Search Help' })
            vim.keymap.set('n', '<leader>sk', Builtin.keymaps, { desc = 'Search Keymaps' })
            vim.keymap.set('n', '<leader>st', Builtin.builtin, { desc = 'Search Telescope builtin' })
            --resume last search
            vim.keymap.set('n', '<leader>sr', Builtin.resume, { desc = 'Search Resume' })

            ----------------------------------------------------------------------------------------

            -- git
            vim.keymap.set('n', '<leader>gf', Builtin.git_files, { desc = 'Search git files' })

            vim.keymap.set('n', '<leader>sd', function()
                Builtin.diagnostics(require('telescope.themes').get_dropdown {
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

            ----------------------------------------------------------------------------------------

            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                Builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 1,
                    previewer = false,
                    layout_config = {
                        height = 20,
                    }
                })
            end, { desc = 'Fuzzily search in current buffer' })

            vim.keymap.set('n', '<localleader>g', function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                Builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 1,
                    previewer = false,
                    layout_config = {
                        height = 20,
                    }
                })
            end, { desc = 'Fuzzily search in current buffer' })


            vim.keymap.set('n', '<leader>wg', function()
                Builtin.live_grep(require('telescope.themes').get_dropdown {
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
                Builtin.commands(require('telescope.themes').get_dropdown {
                    prompt_title = 'search commands',
                    winblend = 1,
                    previewer = false,

                    layout_config = {
                        height = 0,
                        width = 100,
                    }
                })
            end, { desc = 'grep in file' })

            vim.keymap.set('n', '<leader>sc', function()
                Builtin.commands(require('telescope.themes').get_dropdown {
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
            ----------------------------------------------------------------------------------------

            vim.keymap.set('n', 'gw', function()
                Builtin.grep_string(require('telescope.themes').get_cursor {
                    winblend = 1,
                    previewer = true,
                    layout_config = {
                        height = 20,
                        width = 158,
                    }
                })
            end, { desc = 'current word' })

            ----------------------------------------------------------------------------------------


            ----------------------------------------------------------------------------------------

            vim.keymap.set('n', '<leader>sg', function()
                Builtin.live_grep(require('telescope.themes').get_dropdown {
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

            ----------------------------------------------------------------------------------------

            vim.keymap.set('n', '<localleader>s', function()
                Builtin.spell_suggest(require('telescope.themes').get_cursor {
                    winblend = 0,
                    previewer = true,
                    layout_config = {
                        width = 30,
                        height = 15,
                    }
                })
            end, { desc = 'spell suggest' })

            ----------------------------------------------------------------------------------------

            vim.keymap.set('n', '<leader>sn', function()
                Builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = 'Neovim files' })
        end,

    },
}
-- vim: ts=4 sts=4 sw=4 et
