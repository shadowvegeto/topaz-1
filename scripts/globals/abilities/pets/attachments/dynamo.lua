-----------------------------------
-- Attachment: Dynamo
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local attachment_object = {}

attachment_object.onEquip = function(pet)
    pet:addMod(tpz.mod.CRITHITRATE, 3)
end

attachment_object.onUnequip = function(pet)
    pet:delMod(tpz.mod.CRITHITRATE, 3)
end

attachment_object.onManeuverGain = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:addMod(tpz.mod.CRITHITRATE, 2)
    elseif maneuvers == 2 then
        pet:addMod(tpz.mod.CRITHITRATE, 2)
    elseif maneuvers == 3 then
        pet:addMod(tpz.mod.CRITHITRATE, 2)
    end
end

attachment_object.onManeuverLose = function(pet, maneuvers)
    if maneuvers == 1 then
        pet:delMod(tpz.mod.CRITHITRATE, 2)
    elseif maneuvers == 2 then
        pet:delMod(tpz.mod.CRITHITRATE, 2)
    elseif maneuvers == 3 then
        pet:delMod(tpz.mod.CRITHITRATE, 2)
    end
end

return attachment_object
