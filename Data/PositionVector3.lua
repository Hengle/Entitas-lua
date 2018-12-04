---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2018-12-01 22:36
---

---@class PosV3
local M = {}
local mt = {
    __eq = function(left, right)
        print("i am call")
        if left.x == right.x and left.y == right.y and left.z == right.z then
            return true
        end
        return false
    end
}
local Cache = {}
function M.init(width, height, type)
    for x = 0, width do
        local xTable = {}
        for y = 0, height do
            local yTable = {}
            for z = 0, type do
                yTable[z] = setmetatable({x = x, y = y, z = z},mt)
            end
            xTable[y] = yTable
        end
        Cache[x] = xTable
    end
end

function M.new(x, y, z)
    z = z or 0
    return Cache[x][y][z]
end

PosV3 = M.new
return M