-----------------------------------
-- tpz.effect.EARTH_MANEUVER
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    local pet = target:getPet()
    if (pet) then
        pet:addMod(tpz.mod.VIT, effect:getPower())
    end
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    local pet = target:getPet()
    if (pet) then
        pet:delMod(tpz.mod.VIT, effect:getPower())
    end
end

return effect_object
