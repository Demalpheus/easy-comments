local M = {}

function M.insert_comment_at_cursor()
    -- Get cursor position
    local pos = vim.api.nvim_win_get_cursor(0)
    local luaversion = _VERSION
    -- Neovim currently uses Lua 5.1 so use unpack isntead of table.unpack
    local row, col = unpack(pos)
    -- update varialbes to 0-indexed values
    row = row - 1
    -- col = col - 1
    -- Detect file language
    --
    -- change to insert mode
    --
    -- insert comment text at beginning of line
    local c = '-- '
    -- buffer, start row, start col, end row, end col, text
    vim.api.nvim_buf_set_text(0, row, col, row, col, { c })
end

function M.comment_line()
    local pos = vim.api.nvim_win_get_cursor(0)
    local row, col = unpack(pos)
    row = row - 1
    local c = '-- '
    vim.api.nvim_buf_set_text(0, row, 0, row, 0, { c })
end

function M.uncomment_line()
    local pos = vim.api.nvim_win_get_cursor(0)
    local row, col = unpack(pos)
    row = row - 1
    col = col - 1

    -- Get the current line
    local linetext = vim.api.nvim_buf_get_lines(0, row, row+1, false)
    local str = linetext[1]
    local c_pattern = "%-%- "
    local has_comment = string.match(str, c_pattern)
    if has_comment ~= nil then
        local newstr = string.gsub(str, "%-%- ", "", 1)
        vim.api.nvim_buf_set_lines(0, row, row+1, false, { })
        vim.api.nvim_buf_set_lines(0, row, row, false, { newstr })
        -- return cursor to original position
        vim.api.nvim_win_set_cursor(0, {row+1, col-2})
    end
end

return M
