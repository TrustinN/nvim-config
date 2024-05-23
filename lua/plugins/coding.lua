local dir = "plugins/coding"
local returnTable = require(dir .. "/auto-completion")

local otherTables = {
    require(dir .. "/comments"),
    require(dir .. "/debugging"),
    require(dir .. "/julia"),
    require(dir .. "/latex"),
    require(dir .. "/lsp"),
    require(dir .. "/project"),
    require(dir .. "/python"),
    require(dir .. "/snippets"),
    require(dir .. "/syntax-highlighting"),
}

for i=1, #otherTables do
    returnTable = table.combine(returnTable, otherTables[i])
end

return returnTable




