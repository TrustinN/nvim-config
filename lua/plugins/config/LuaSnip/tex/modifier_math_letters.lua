---------------------------------------------------------------------------
--Math Letters
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local in_mathzone = helpers.in_mathzone
local conditions = {
    condition = in_mathzone,
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

local function make_lower(letter, trigger_choice)
    local first_letter = string.sub(letter, 1, 1)

    return s({trig = ';' .. trigger_choice, priority = 500, wordTrig = false, snippetType = 'autosnippet'},
        t("\\" .. letter),
        conditions
    )
end

local function make_upper(letter, trigger_choice)
    local first_letter = string.sub(letter, 1, 1)
    local capital_first = string.upper(first_letter)
    local rest = string.sub(letter, 2, #letter)
    local capital_word = capital_first .. rest
    if string.sub(letter, 1, 3) == "var" then
        first_letter = string.sub(letter, 4, 4)
        capital_first = string.upper(first_letter)
        rest = string.sub(letter, 5, #letter)
        capital_word = "var" .. capital_first .. rest
    end

    return s({trig = ';;' .. trigger_choice, priority = 1000, wordTrig = false, snippetType = 'autosnippet'},
        t("\\" .. capital_word),
        conditions
    )
end

local function alphabet_maker(snippets, words)
    for k, v in pairs(words) do
        table.insert(snippets, make_lower(k, v))
        table.insert(snippets, make_upper(k, v))
    end
end

local snippets = {}
local words = {
    ["alpha"] = "a",
    ["beta"] = "b",
    ["psi"] = "c",
    ["delta"] = "d",
    ["varepsilon"] = "e",
    ["gamma"] = "g",
    ["xi"] = "h",
    ["iota"] = "i",
    ["kappa"] = "k",
    ["lambda"] = "l",
    ["mu"] = "m",
    ["eta"] = "n",
    ["omicron"] = "o",
    ["pi"] = "p",
    ["rho"] = "r",
    ["sigma"] = "s",
    ["tau"] = "t",
    ["upsilon"] = "u",
    ["nu"] = "v",
    ["omega"] = "w",
    ["chi"] = "x",
    ["varphi"] = "y",
    ["zeta"] = "z",
    ["theta"] = "0",
}

alphabet_maker(snippets, words)

return snippets





















