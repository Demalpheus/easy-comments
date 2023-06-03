local M = {}

function M.insert_comment()
    -- Detect file language
    --
    -- change to insert mode
    --
    -- insert comment text at beginning of line
    local c = '-- '
    vim.api.nvim_buf_set_text(0, 0, 0, 0, { c })
end

return M
