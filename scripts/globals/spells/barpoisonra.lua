-----------------------------------
-- Spell: BARPOISONRA
-----------------------------------
require("scripts/globals/spells/barstatus")
require("scripts/globals/status")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    return applyBarstatus(tpz.effect.BARPOISON, caster, target, spell)
end

return spell_object
