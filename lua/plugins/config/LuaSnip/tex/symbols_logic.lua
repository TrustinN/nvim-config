---------------------------------------------------------------------------
--Logic
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_tikzcd = helpers.in_tikzcd
local math_but_not_tikzcd = helpers.math_but_not_tikzcd
local function conditions(env) 
    return {
        condition = env,
        callbacks = {
            [-1] = {
                [events.leave] = function ()
                  vim.cmd([[
                    autocmd InsertCharPre <buffer> ++once lua _G.if_char_insert_space()
                  ]])
                end
            }
        },
    }
end

return {

s({trig = 'and', wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\land") },
    conditions(in_mathzone)
),

s({trig = 'or', wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\lor") },
    conditions(in_mathzone)
),

s({trig = 'fa', wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\forall") },
    conditions(in_mathzone)
),

s({trig = 'eit', wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\exists") },
    conditions(in_mathzone)
),

s({trig = 'imp', wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\implies") },
    conditions(in_mathzone)
),

s({trig = 'iff', wordTrig = false, snippetType = 'autosnippet'},
	{ t("\\iff") },
	conditions(math_but_not_tikzcd)
),












}
