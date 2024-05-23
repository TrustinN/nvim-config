----------------------------------------------------------------------------
--Tikz-cd Directions
---------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local in_tikz = helpers.in_tikz
local in_tikz_cd = helpers.in_tikzcd
local in_tikz_graph = helpers.in_tikzgraph
local not_in_center = helpers.not_in_center
local str_conv = helpers.str_conv
local mat = helpers.mat

local function one_arg_arrows(key, replacement_table)
    local prior = 500
    local repl = {replacement_table[string.sub(key, 1, 1)]}
    local start = ""

    if #key == 2 then
        prior = 1000
        repl[2] = replacement_table[string.sub(key, 2, 2)]
        start = string.sub(key, 1, 1)
    end


    return s({trig = '(' .. start .. '[' .. key .. ']+)%-', priority = prior, regTrig = true, wordTrig = false, snippetType = 'autosnippet'},
    fmta(
        "\\ar[<>, <><>]",
        {
            f(str_conv, {}, { user_args = {repl} }),
            c(1, {
                fmta(
                    "\"<>\"",
                    {
                        r(1, "1", i(1)),
                    }
                ),
                fmta(
                    "\"<>\"'",
                    {
                        r(1, "1", i(1)),
                    }
                ),
            }),
            c(2, {
                i(1, ""),
                fmta(
                    ", bend left = <>",
                    {
                        r(1, "2", i(1, "20")),
                    }
                ),
                fmta(
                    ", bend right = <>",
                    {
                        r(1, "2", i(1, "20")),
                    }
                ),
            })
        }
    ),
    { condition = in_tikz_cd }
)

end

local function arrow_collect(arrows, keys, replacement_table)
    for k = 1, #keys do
        table.insert(arrows, one_arg_arrows(keys[k], replacement_table))
    end
end

local nodes = {}

local direction_mappings = {
    ["s"] = "l",
    ["f"] = "r",
    ["e"] = "u",
    ["d"] = "d",
}

local arrow_key_triggers = {
    "s", "f", "e", "d",
    "ds", "df", "ef", "es",
}

arrow_collect(nodes, arrow_key_triggers, direction_mappings)

return nodes















