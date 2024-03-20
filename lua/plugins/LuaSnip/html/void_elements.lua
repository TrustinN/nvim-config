---------------------------------------------------------------------------
--Elements
----------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local emp_lister = helpers.emp_lister

return {

s({trig = "doctype-", wordTrig = false, snippetType = 'autosnippet'},
    t("<!doctype html>")
),

s({trig = "meta-", wordTrig = false, snippetType = 'autosnippet'},
    t("<meta charset=\"utf-8\" />")
),

s({trig = "img-", wordTrig = false, snippetType = 'autosnippet'},
    { t("<img src=\""), i(1), t("\">") }
),

s({trig = "link-", wordTrig = false, snippetType = 'autosnippet'},
    { t("<link rel=\""), i(1), t("\" href=\""), i(2), t("\" />") }
),

s({trig = "\\\\", wordTrig = false, snippetType = 'autosnippet'},
    { t("<br />") }
),



}
