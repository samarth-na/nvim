local M = {}

-- Function to run live-server
M.start_live_server = function()
    local live_server_path = vim.fn.executable("live-server")
    if live_server_path == 0 then
        print("Error: 'live-server' is not installed. Install it using 'npm install -g live-server'.")
        return
    end

    -- Open a terminal and run live-server
    vim.cmd("split | term live-server")
end

-- Create a Neovim command for convenience
vim.api.nvim_create_user_command("LiveServer", function()
    M.start_live_server()
end, {})

return M
