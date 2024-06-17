local function rangeCheck(grid, i, j)
    if 0 < i and i < #(grid[1]) then
        if 0 < j and i < #grid then
            return true
        end
    end
    return false
end

local function getTile(grid, i, j)
    if rangeCheck(grid, i, j) then
        return grid[i][j]
    end
end

local moveTable = {}

local function mv(dx, dy)
    local function mv2(i, j)
        return i + dx, j + dy
    end

    return mv2
end

table.insert(moveTable, mv(-1, 0))
table.insert(moveTable, mv(0, 1))
table.insert(moveTable, mv(1, 0))
table.insert(moveTable, mv(0, -1))

local function searchCC(grid, i, j, beginX, beginY, f)
    local currX = beginX
    local currY = beginY
    while true do
        if currY - j > 0 and currX - i > -1 then
            currX, currY = moveTable[1](currX, currY)

        elseif currX - i < 0 and currY - j < 1 then
            currX, currY = moveTable[2](currX, currY)

        elseif currY - j < 0 and currX - i < 1 then
            currX, currY = moveTable[3](currX, currY)

        elseif currX - i > 0 and currY - j > -1 then
            currX, currY = moveTable[4](currX, currY)

        end

        if f(grid, i, j, currX, currY) then
            return currX, currY
        end

        if currX == beginX and currY == beginY then
            break
        end

    end
end

local function withinDist(grid, i, j, x, y)
    local length = #(grid[1])
    local width = #grid
    local centerX = math.ceil((length + 1) / 2)
    local centerY = math.ceil(width / 2)

    local targetDist = math.ceil(math.sqrt(math.pow(centerX - i, 2) + math.pow(centerY - j, 2)))
    local currDist = math.ceil(math.sqrt(math.pow(centerX - x, 2) + math.pow(centerY - y, 2)))

    if currDist <= targetDist then
        return true
    end
    return false
end

local function swapPerim(grid, startX, startY, xfirst)

    local prevX, prevY = startX, startY
    local currX, currY

    if xfirst then
        currX, currY = searchCC(grid, startX, startY, startX + 1, startY, withinDist)

    else
        currX, currY = searchCC(grid, startX, startY, startX, startY - 1, withinDist)

    end

    local tmpX, tmpY
    local prev = grid[startY][startX]
    while true do
        if rangeCheck(grid, currX, currY) then
            prev, grid[currY][currX] = grid[currY][currX], prev
        end

        tmpX, tmpY = currX, currY
        currX, currY = searchCC(grid, currX, currY, prevX, prevY, withinDist)
        prevX, prevY = tmpX, tmpY

        if xfirst then
            if currY == startY then
                break
            end
        else
            if currX == startX then
                break
            end
        end
    end

end

-- update function
local function spin(grid)
    local length = #(grid[1])
    local width = #grid
    local centerX = math.ceil((length + 1) / 2)
    local centerY = math.ceil(width / 2)

    local xfirst = true
    if length < width then
        xfirst = false
    end


    if xfirst then
        for i = 1, centerX - 1 do
            swapPerim(grid, centerX + i, centerY, xfirst)
        end
    else
        for i = 1, centerY - 1 do
            swapPerim(grid, centerX, centerY - i, xfirst)
        end

    end

    return true
end

local grid = {}
local g

for i = 1, 5 do
    g = {}
    for j = 1, 5 do
        g[j] = i * j
    end
    table.insert(grid, g)
end

spin(grid)





