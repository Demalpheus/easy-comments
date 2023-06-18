local M = {}

function M.insert_comment()
    -- Get cursor position
    local pos = vim.api.nvim_win_get_cursor(0)
    local luaversion = _VERSION
    -- Neovim currently uses Lua 5.1 so use unpack isntead of table.unpack
    local row, column = unpack(pos)
    -- update varialbes to 0-indexed values
    row = row - 1
    column = column - 1
    -- Detect file language
    --
    -- change to insert mode
    --
    -- insert comment text at beginning of line
    local c = '-- '
    -- buffer, start row, start col, end row, end col, text
    vim.api.nvim_buf_set_text(0, row, 0, row, 0, { c })
end

return M
