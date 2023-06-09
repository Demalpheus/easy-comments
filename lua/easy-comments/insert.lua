local inline = require("easy-comments.inline")
local M = {}

function M.insert_comment_at_cursor()
    -- Get cursor position
    local pos = vim.api.nvim_win_get_cursor(0)
    -- Neovim currently uses Lua 5.1 so use unpack isntead of table.unpack
    local row, col = unpack(pos)
    -- update varialbes to 0-indexed values
    row = row - 1
    -- col = col - 1
    -- Detect file language
    local filetype = vim.bo.filetype
    -- change to insert mode
    --
    -- insert comment text at beginning of line
    local c = inline[filetype]
    -- buffer, start row, start col, end row, end col, text
    vim.api.nvim_buf_set_text(0, row, col, row, col, { c })
    -- move cursor appropriately and change to insert mode
    local c_length = string.len(c)
    vim.api.nvim_win_set_cursor(0, {row+1, col+c_length})
    vim.cmd('startinsert')
end

function M.comment_line()
    local pos = vim.api.nvim_win_get_cursor(0)
    local row, col = unpack(pos)
    row = row - 1
    local filetype = vim.bo.filetype
    local c = inline[filetype]
    vim.api.nvim_buf_set_text(0, row, 0, row, 0, { c })
end

function M.uncomment_line()
    local pos = vim.api.nvim_win_get_cursor(0)
    local row, col = unpack(pos)
    row = row - 1
    -- col = col - 1
    local filetype = vim.bo.filetype
    local c = inline[filetype]
    local c_length = string.len(c)
    -- Get the current line
    local linetext = vim.api.nvim_buf_get_lines(0, row, row+1, false)
    local str = linetext[1]
    local c_pattern = "%-%- "
    local has_comment = string.match(str, c_pattern)
    if has_comment ~= nil then
        -- Find location of existing comment
        local c_start = string.find(str, c_pattern)
        local newstr = string.gsub(str, "%-%- ", "", 1)
        vim.api.nvim_buf_set_lines(0, row, row+1, false, { })
        vim.api.nvim_buf_set_lines(0, row, row, false, { newstr })
        -- return cursor to original position
        if c_start < col then
            -- Comment is before the cursor
            col = col - c_length 
        end
        vim.api.nvim_win_set_cursor(0, {row+1, col})
    end
end

return M
