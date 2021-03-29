-----------------------------------
-- tpz.effect.FAN_DANCE
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effect_object = {}

effect_object.onEffectGain = function(target, effect)
    -- Waltz recast effect is handled in the waltz scripts
    target:delStatusEffect(tpz.effect.HASTE_SAMBA)
    target:delStatusEffect(tpz.effect.ASPIR_SAMBA)
    target:delStatusEffect(tpz.effect.DRAIN_SAMBA)
    target:delStatusEffect(tpz.effect.SABER_DANCE)
    target:addMod(tpz.mod.ENMITY, 15)
end

effect_object.onEffectTick = function(target, effect)
end

effect_object.onEffectLose = function(target, effect)
    target:delMod(tpz.mod.ENMITY, 15)
end

return effect_object
