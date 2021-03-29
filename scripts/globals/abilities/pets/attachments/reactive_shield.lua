-----------------------------------
-- Attachment: Reactive Shield
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local attachment_object = {}

attachment_object.onEquip = function(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_REACTIVE_SHIELD", function(automaton, target)
        local master = automaton:getMaster()
        if not automaton:hasRecast(tpz.recast.ABILITY, 2031) and master and master:countEffect(tpz.effect.FIRE_MANEUVER) > 0 then
            automaton:useMobAbility(2031, automaton)
        end
    end)
end

attachment_object.onUnequip = function(pet)
    pet:removeListener("ATTACHMENT_REACTIVE_SHIELD")
end

attachment_object.onManeuverGain = function(pet, maneuvers)
end

attachment_object.onManeuverLose = function(pet, maneuvers)
end

return attachment_object
