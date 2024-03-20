---------------------------------------------------------------------------
--Notes
---------------------------------------------------------------------------

local helpers = require('plugins/luasnip-helper-funcs')
local get_visual = helpers.get_visual

return {

s({trig = "<", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    {t("<"), d(1, get_visual), t(">")}
),

s({trig = "{", wordTrig = false, regTrig = false, snippetType = 'autosnippet'},
    {t("{"), d(1, get_visual), t("}")}
),








}
