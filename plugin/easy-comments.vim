" Title:        Easy Comments
" Description:  A plugin to easily add comments to files
" Last Change:  3 June 2023
" Maintainer:   Travis Weddle <https://github.com/demalpheus>
echo "Loading Easy Comments"
if exists("g:loaded_easycomments")
    finish
endif
let g:loaded_easycomments = 1

" let s:lua_loc = expand("<sfile>:h:r") . "/../lua/easy-comments/deps"
" exe "lua package.path = package.path .. ';" . s:lua_loc . "/lua-?/init.lua'"

" Expose Plugin Commands
command! -nargs=0 EasyCommentsLine lua require("easy-comments").insert_comment()
command! -nargs=0 EasyCommentsBlock lua require("easy-comments").insert_comment_block()
