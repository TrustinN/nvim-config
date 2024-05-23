---------------------------------------------------------------------------
--Entity References
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local emp_lister = helpers.emp_lister

return {

s({trig = "<-", wordTrig = false, snippetType = 'autosnippet'},
    t("&lt;")
),

s({trig = ">-", wordTrig = false, snippetType = 'autosnippet'},
    t("&gt;")
),

s({trig = "\"-", wordTrig = false, snippetType = 'autosnippet'},
    { t("&quot;"), i(1), t("&quot;") }
),

s({trig = "\'-", wordTrig = false, snippetType = 'autosnippet'},
    { t("&apos;"), i(1), t("&apos;") }
),

s({trig = "&-", wordTrig = false, snippetType = 'autosnippet'},
    t("&amp;")
),



}
