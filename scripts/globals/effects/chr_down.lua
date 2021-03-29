-----------------------------------
-- tpz.effect.CHR_DOWN
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    if ((target:getStat(tpz.mod.CHR) - effect:getPower()) < 0) then
        effect:setPower(target:getStat(tpz.mod.CHR))
    end
    target:addMod(tpz.mod.CHR, -effect:getPower())
end

effect_object.onEffectTick = function(target, effect)
    -- the effect restore charism of 1 every 3 ticks.
    local downCHR_effect_size = effect:getPower()
    if (downCHR_effect_size > 0) then
        effect:setPower(downCHR_effect_size - 1)
        target:delMod(tpz.mod.CHR, -1)
    end
end

effect_object.onEffectLose = function(target, effect)
    downCHR_effect_size = effect:getPower()
    if (downCHR_effect_size > 0) then
        target:delMod(tpz.mod.CHR, -downCHR_effect_size)
    end
end

return effect_object
