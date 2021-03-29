-----------------------------------
-- tpz.effect.SUPER_BUFF
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    local power = effect:getPower()
    target:addMod(tpz.mod.ATTP, power)
    target:addMod(tpz.mod.DEFP, power)
    target:addMod(tpz.mod.MATT, power)
    target:addMod(tpz.mod.MEVA, power)
    -- The following only applies to Nidhogg.  If this buff is to be used anywhere else, a check on mob name (NOT ID) would be a good choice
    target:setAnimationSub(2)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    local power = effect:getPower()
    target:delMod(tpz.mod.ATTP, power)
    target:delMod(tpz.mod.DEFP, power)
    target:delMod(tpz.mod.MATT, power)
    target:delMod(tpz.mod.MEVA, power)
    target:setAnimationSub(0)
end

return effect_object
