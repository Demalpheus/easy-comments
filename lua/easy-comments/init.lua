-- Create module object
local M = {}

-- Route function calls
M.insert_comment() = insert.insert_comment
M.insert_comment_block() = insert.insert_comment_block

M.toggle_comment() = toggle.toggle_comment
M.toggle_comment_block() = toggle.toggle_comment_block

return M

