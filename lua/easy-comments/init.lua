local insert = require("easy-comments.insert")

-- Create module object
local M = {}

M.setup = function(parameters)
end

-- Route function calls
M.insert_comment_at_cursor = insert.insert_comment_at_cursor
M.comment_line = insert.comment_line
M.uncomment_line = insert.uncomment_line
M.insert_comment_block = insert.insert_comment_block
M.local_lua_function = function ()
    print "My new plugin hello world example"
end
-- M.toggle_comment() = toggle.toggle_comment
-- M.toggle_comment_block() = toggle.toggle_comment_block

return M
