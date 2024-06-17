local config = {
    fps = 50,
    name = 'spin',
}

local function rangeCheck(grid, i, j)
    if 0 < i and i <= #(grid[1]) then
        if 0 < j and j <= #grid then
            return true
        end
    end
    return false
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

local function withinDist(x1, y1, x2, y2, r)
    local d = math.ceil(math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2)))
    return d <= r

end

local function ccStep(i, j, currX, currY)
    if currY - j < 0 and currX - i > -1 then
        return moveTable[1](currX, currY)

    elseif currX - i < 0 and currY - j < 1 then
        return moveTable[2](currX, currY)

    elseif currY - j > 0 and currX - i < 1 then
        return moveTable[3](currX, currY)

    elseif currX - i > 0 and currY - j > -1 then
        return moveTable[4](currX, currY)

    end
end

local function searchCC(centerX, centerY, i, j, beginX, beginY, r)
    local currX = beginX
    local currY = beginY
    while true do
        currX, currY = ccStep(i, j, currX, currY)

        if withinDist(centerX, centerY, currX, currY, r) then
            return currX, currY
        end

        if currX == beginX and currY == beginY then
            break
        end

    end
end

local function swapPerim(grid, centerX, centerY, startX, startY, r)

    local prevX, prevY = startX, startY
    local currX, currY = searchCC(centerX, centerY, startX, startY, startX + 1, startY, r)

    local tmpX, tmpY
    local prev = grid[startY][startX]

    while true do
        if rangeCheck(grid, currX, currY) then
            prev, grid[currY][currX] = grid[currY][currX], prev
        end

        if currX == startX and currY == startY then
            break
        end

        tmpX, tmpY = currX, currY
        currX, currY = searchCC(centerX, centerY, currX, currY, prevX, prevY, r)
        prevX, prevY = tmpX, tmpY

    end

end

-- update function
config.update = function(grid)
    local length = #(grid[1])
    local width = #grid

    local centerX = math.ceil((length + 1) / 2)
    local centerY = math.ceil((width + 1) / 2)

    for i = 1, math.max(centerX, centerY) - 1 do
        swapPerim(grid, centerX, centerY, centerX + i, centerY, i)
    end

    return true
end

require("cellular-automaton").register_animation(config)

