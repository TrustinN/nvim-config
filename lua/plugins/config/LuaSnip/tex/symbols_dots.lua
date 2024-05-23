----------------------------------------------------------------------------
--Dots
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local in_mathzone = helpers.in_mathzone
local in_tikz_graph = helpers.in_tikzgraph
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

s({trig = 'dp', regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	t("\\cdot"), conditions(in_mathzone)
),

s({trig = 'ld', regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	t("\\ldots"), conditions(in_mathzone)

),

s({trig = 'vd', regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	t("\\vdots"), conditions(in_mathzone)
),

s({trig = 'dd', priority = 500, regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	t("\\ddots"), conditions(math_but_not_tikzcd)
),

s({trig = 'cd', regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
	t("\\cdots"), conditions (in_mathzone)
),

s({trig = '%.', regTrig = false, wordTrig = false, snippetType = 'autosnippet'},
	t("\\bullet"), conditions(in_tikz_graph)
),

}
