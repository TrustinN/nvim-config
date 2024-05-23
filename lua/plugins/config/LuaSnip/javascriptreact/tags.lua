---------------------------------------------------------------------------
--Tags
----------------------------------------------------------------------------

local helpers = require('plugins/config/LuaSnip/luasnip-helper-funcs')
local get_visual = helpers.get_visual
local emp_lister = helpers.emp_lister
local session = require("luasnip").session

local nodes = {}

local tags = {
    ["h"] = "h1",
    ["em"] = "e0",
    ["div"] = "d0",
}

function make_tags(tag_type, trig_info)
    local trig = string.sub(trig_info, 1, 1)
    local counted = tonumber(string.sub(trig_info, 2, 2))
    local nodes1 = {
            r(1, "r1", i(1, "1")),
            r(2, "r2", d(2, get_visual)),
            rep(1),
        }
    local nodes2 = {
            t(tag_type),
            r(1, "r1", i(1, "1")),
            r(2, "r2", d(2, get_visual)),
            t(tag_type),
            rep(1),
        }

    local number_inserted = "{}"
    if counted == 0 then
        number_inserted = ""
        nodes1 = {
                r(1, "r1", d(1, get_visual)),
            }
        nodes2 = {
                t(tag_type),
                r(1, "r1", d(1, get_visual)),
                t(tag_type),
            }
    end

    local string1 = "<" .. tag_type .. number_inserted .. "> {} </" .. tag_type .. number_inserted .. ">"
    local string2 = [[
        <]] .. number_inserted .. [[{}>
            {}
        </]] .. number_inserted .. [[{}>
    ]]
    return s({trig = trig .. "%-", wordTrig = false, regTrig = true, snippetType = 'autosnippet'},
            c(1, {
                fmt(string1, nodes1),
                fmt(string2, nodes2),
            })
        )
end


for k, v in pairs(tags) do
    table.insert(nodes, make_tags(k, v))
end

return nodes



