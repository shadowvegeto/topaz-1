-----------------------------------
-- tpz.effect.BUST
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    if (effect:getSubType() == tpz.mod.DMG) then
        target:addMod(tpz.mod.DMG, effect:getPower())
    else
        if (effect:getSubType() == tpz.mod.ACC) then
            target:addMod(tpz.mod.RACC, -effect:getPower())
        elseif (effect:getSubType() == tpz.mod.ATTP) then
            target:addMod(tpz.mod.RATTP, -effect:getPower())
        -- elseif (effect:getSubType() == MOD_PET_MACC) then
        --     target:addMod(MOD_PET_MATT, -effect:getPower())
        end
        target:addMod(effect:getSubType(), -effect:getPower())
    end
    --print("added "..effect:getPower().." of mod "..effect:getSubType())
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    if (effect:getSubType() == tpz.mod.DMG) then
        target:delMod(tpz.mod.DMG, effect:getPower())
    else
        if (effect:getSubType() == tpz.mod.ACC) then
            target:delMod(tpz.mod.RACC, -effect:getPower())
        elseif (effect:getSubType() == tpz.mod.ATTP) then
            target:delMod(tpz.mod.RATTP, -effect:getPower())
        -- elseif (effect:getSubType() == MOD_PET_MACC) then
        --     target:delMod(MOD_PET_MATT, -effect:getPower())
        end
        target:delMod(effect:getSubType(), -effect:getPower())
    end
    --print("removed "..effect:getPower().." of mod "..effect:getSubType())
end

return effect_object
