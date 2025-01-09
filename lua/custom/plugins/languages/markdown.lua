return {
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",

        dependencies = {
            "nvim-lua/plenary.nvim",

        },
        opts = {
            workspaces = {
                {
                    name = "obsidian_vauld",
                    path = "~/obsidian"
                },
            },
        },
    },
    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown", -- or 'event = "VeryLazy"'
        opts = {
            -- configuration here or empty for defaults
        },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            latex = { enabled = false },
            bullet = {
                -- Turn on / off list bullet rendering
                enabled = true,
                -- Replaces '-'|'+'|'*' of 'list_item'
                -- How deeply nested the list is determines the 'level' which is used to index into the list using a cycle
                -- The item number in the list is used to index into the value using a clamp if the value is also a list
                -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
                icons = { ' ' },
                -- Replaces 'n.'|'n)' of 'list_item'
                -- How deeply nested the list is determines the 'level' which is used to index into the list using a cycle
                -- The item number in the list is used to index into the value using a clamp if the value is also a list
                ordered_icons = {},
                -- Padding to add to the left of bullet point
                left_pad = 0,
                -- Padding to add to the right of bullet point
                right_pad = 0,
                -- Highlight for the bullet icon
                highlight = 'RenderMarkdownBullet',
            },
            heading = {
                -- Turn on / off heading icon & background rendering
                enabled = true,
                -- Turn on / off any sign column related rendering
                sign = false,
                -- Determines how icons fill the available space:
                --  inline:  underlying '#'s are concealed resulting in a left aligned icon
                --  overlay: result is left padded with spaces to hide any additional '#'
                position = 'overlay',
                -- Replaces '#+' of 'atx_h._marker'
                -- The number of '#' in the heading determines the 'level'
                -- The 'level' is used to index into the array using a cycle
                icons = { '  ', ' 󰛄  ', '󰫢  ', '󰫣  ', '󰫤  ', '󰫥  ' },
                -- Added to the sign column if enabled
                -- The 'level' is used to index into the array using a cycle
                signs = { ' ' },
                -- Width of the heading background:
                --  block: width of the heading text
                --  full:  full width of the window
                -- Can also be an array of the above values in which case the 'level' is used
                -- to index into the array using a clamp
                width = 'full',
                -- Amount of padding to add to the left of headings
                left_pad = 0,
                -- Amount of padding to add to the right of headings when width is 'block'
                right_pad = 0,
                -- Minimum width to use for headings when width is 'block'
                min_width = 0,
                -- Determins if a border is added above and below headings
                border = false,
                -- Highlight the start of the border using the foreground highlight
                border_prefix = false,
                -- Used above heading for border
                above = '▄',
                -- Used below heading for border
                below = '▀',
                -- The 'level' is used to index into the array using a clamp
                -- Highlight for the heading icon and extends through the entire line
                backgrounds = {
                    '',
                    '',
                    '',
                    '',
                    '',
                    '',
                },
                -- The 'level' is used to index into the array using a clamp
                -- Highlight for the heading and sign icons
                foregrounds = {
                    'RenderMarkdownH1',
                    'RenderMarkdownH2',
                    'RenderMarkdownH3',
                    'RenderMarkdownH4',
                    'RenderMarkdownH5',
                    'RenderMarkdownH6',
                },
            },
        },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    }
}
