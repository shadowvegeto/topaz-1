-----------------------------------
-- Attachment: Flashbulb
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local attachment_object = {}

attachment_object.onEquip = function(pet)
    pet:addListener("AUTOMATON_ATTACHMENT_CHECK", "ATTACHMENT_FLASHBULB", function(automaton, target)
        local master = automaton:getMaster()
        if not automaton:hasRecast(tpz.recast.ABILITY, 1947) and master and master:countEffect(tpz.effect.LIGHT_MANEUVER) > 0 and (automaton:checkDistance(target) - target:getModelSize()) < 7 then
            automaton:useMobAbility(1947)
        end
    end)
end

attachment_object.onUnequip = function(pet)
    pet:removeListener("ATTACHMENT_FLASHBULB")
end

attachment_object.onManeuverGain = function(pet, maneuvers)
end

attachment_object.onManeuverLose = function(pet, maneuvers)
end

return attachment_object
