-----------------------------------
-- tpz.effect.INNIN
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect) --power=30 initially, subpower=20 for enmity
    target:addMod(tpz.mod.EVA, -effect:getPower())
    target:addMod(tpz.mod.ENMITY, -effect:getSubPower())
end

effect_object.onEffectTick = function(target, effect)
    --tick down the effect and reduce the overall power
    effect:setPower(effect:getPower()-1)
    target:delMod(tpz.mod.EVA, -1)
    if (effect:getPower() % 2 == 0) then -- enmity- decays from -20 to -10, so half as often as the rest.
        effect:setSubPower(effect:getSubPower()-1)
        target:delMod(tpz.mod.ENMITY, -1)
    end
end

effect_object.onEffectLose = function(target, effect)
    --remove the remaining power
    target:delMod(tpz.mod.EVA, -effect:getPower())
    target:delMod(tpz.mod.ENMITY, -effect:getSubPower())
end

return effect_object
