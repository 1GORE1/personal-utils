local currentcam = workspace.CurrentCamera
local players = game:GetService('Players')
local lp = players.LocalPlayer
local part = 'Head'

getmouse = function()
    return lp:GetMouse()
end

function GetClosest(plr)
    local dist,person = math.huge,nil
    for i, v in pairs(players:GetChildren()) do 
        if i ~= 1 and v.Character and v.Character.HumanoidRootPart then
            local sc, os = currentcam:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
            local distance = (Vector2.new(sc.X, sc.Y) - Vector2.new(getmouse().X, getmouse().Y)).Magnitude
            if distance < dist then
                dist = distance
                person = v
            end
        end
    end

    return person
end

print(GetClosest())
