-- Ramda: методы массивов.
local M = {}

-- Map для таблиц
M.map = function(array, func)
    local result = {}
    for i, v in ipairs(array) do
        table.insert(result, func(v, i))
    end
    return result
end

-- Reduce для таблиц
M.reduce = function(array, func, initial)
    local result = initial
    for i, v in ipairs(array) do
        result = func(result, v, i)
    end
    return result
end

return M
