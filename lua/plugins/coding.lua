local dir = "plugins/coding"
local returnTable = require(dir .. "/auto-completion")

local otherTables = {
    require(dir .. "/comments"),
    require(dir .. "/debugging"),
    require(dir .. "/lsp"),
    require(dir .. "/project"),
    require(dir .. "/snippets"),
    require(dir .. "/syntax-highlighting"),
    require(dir .. "/languages/julia"),
    require(dir .. "/languages/latex"),
    require(dir .. "/languages/python"),
    require(dir .. "/languages/lua")
}

for i=1, #otherTables do
    returnTable = table.combine(returnTable, otherTables[i])
end

return returnTable





