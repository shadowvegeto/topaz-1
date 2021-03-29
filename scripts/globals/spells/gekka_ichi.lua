-----------------------------------
-- Spell: Gekka: Ichi
--     Grants Enmity Boost +30 for Caster
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    caster:delStatusEffect(tpz.effect.PAX)

    local effect = tpz.effect.ENMITY_BOOST
    caster:addStatusEffect(effect, 30, 0, 300)
    return effect
end

return spell_object
