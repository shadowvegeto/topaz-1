-----------------------------------
-- Spell: Tractor
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------
local spell_object = {}

spell_object.onMagicCastingCheck = function(caster, target, spell)
    if target:isMob() then -- Because Prishe in CoP mission
        return tpz.msg.basic.CANNOT_ON_THAT_TARG
    end

    return 0
end

spell_object.onSpellCast = function(caster, target, spell)
    if target:getObjType() == tpz.objType.PC then
        target:sendTractor(caster:getXPos(), caster:getYPos(), caster:getZPos(), target:getRotPos())
        spell:setMsg(tpz.msg.basic.MAGIC_CASTS_ON)
        return 1
    end
    return 0
end

return spell_object
