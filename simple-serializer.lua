function serialize(tbl, indent)
    if type(tbl) ~= "table" then
        return tostring(tbl)
    end
    
    indent = indent or 0
  
    local ind = string.rep("  ", indent)
    local result = {}
  
    for keys, value in pairs(tbl) do
        local key = type(keys) == "number" and "[" .. keys .. "]" or '["' .. tostring(keys) .. '"]'
        local val = serialize(value, indent + 1)
        table.insert(result, ind .. key .. " = " .. val)
    end
    return "{\n" .. table.concat(result, ",\n") .. "\n" .. string.rep("  ", indent - 1) .. "}"
end

-- example usage
local tbl = {
    age = 18,
    name = 'Jacob',
    hobbies = {
        'playing games',
        'programming',
        'reading'
    }
}

print(serialize(tbl))
