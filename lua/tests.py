import math


def rangeCheck(grid, i, j):
    if 0 <= i and i < len(grid[0]):
        if 0 <= j and i < len(grid):
            return True

    return False


def getTile(grid, i, j):
    if rangeCheck(grid, i, j):
        return grid[i][j]


def mv(dx, dy):
    def mv2(i, j):
        return i + dx, j + dy

    return mv2


moveTable = []
moveTable.append(mv(-1, 0))
moveTable.append(mv(0, 1))
moveTable.append(mv(1, 0))
moveTable.append(mv(0, -1))


def searchCC(grid, i, j, beginX, beginY, f):
    currX = beginX
    currY = beginY
    while True:
        if currY - j < 0 and currX - i > -1:
            currX, currY = moveTable[0](currX, currY)

        elif currX - i < 0 and currY - j < 1:
            currX, currY = moveTable[1](currX, currY)

        elif currY - j > 0 and currX - i < 1:
            currX, currY = moveTable[2](currX, currY)

        elif currX - i > 0 and currY - j > -1:
            currX, currY = moveTable[3](currX, currY)

        if f(grid, i, j, currX, currY):
            return currX, currY

        if currX == beginX and currY == beginY:
            break


def withinDist(grid, i, j, x, y):
    length = len(grid[0])
    width = len(grid)
    centerX = math.floor(length // 2)
    centerY = math.floor(width // 2)

    targetDist = math.floor(math.sqrt(math.pow(centerX - i, 2) + math.pow(centerY - j, 2)))
    currDist = math.floor(math.sqrt(math.pow(centerX - x, 2) + math.pow(centerY - y, 2)))

    if currDist <= targetDist:
        return True
    return False


def swapPerim(grid, startX, startY, xfirst):

    prevX, prevY = startX, startY
    currX, currY = 0, 0

    if xfirst:
        currX, currY = searchCC(grid, startX, startY, startX + 1, startY, withinDist)

    else:
        currX, currY = searchCC(grid, startX, startY, startX, startY - 1, withinDist)

    tmpX, tmpY = 0, 0
    prev = grid[startY][startX]
    while True:
        if rangeCheck(grid, currX, currY):
            printG(grid)
            prev, grid[currY][currX] = grid[currY][currX], prev

        if currX == startX and currY == startY:
            break

        tmpX, tmpY = currX, currY
        currX, currY = searchCC(grid, currX, currY, prevX, prevY, withinDist)
        prevX, prevY = tmpX, tmpY


def spin(grid):
    length = len(grid[0])
    width = len(grid)
    centerX = math.ceil(length // 2)
    centerY = math.ceil(width // 2)

    xfirst = True
    if length < width:
        xfirst = False

    if xfirst:
        for i in range(centerX):
            swapPerim(grid, centerX + i + 1, centerY, xfirst)
    else:
        for i in range(centerY):
            swapPerim(grid, centerX, centerY - i, xfirst)
    printG(grid)

    return True


grid = []
num = 11
for i in range(num):
    g = []
    for j in range(num):
        g.append(num * i + j)
    grid.append(g)


def printG(grid):
    for i in grid:
        print(i)


print("grid1:")
spin(grid)

print("grid2:")
spin(grid)

print("grid3:")
spin(grid)

print("Done")


