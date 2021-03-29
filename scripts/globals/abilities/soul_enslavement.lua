-----------------------------------
-- Ability: Soul Enslavement
-- Description: Melee attacks absorb target's TP.
-- Obtained: DRK Level 96
-- Recast Time: 01:00:00
-- Duration: 00:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------
local ability_object = {}

ability_object.onAbilityCheck = function(player, target, ability)
    return 0, 0
end

ability_object.onUseAbility = function(player, target, ability)
    player:addStatusEffect(tpz.effect.SOUL_ENSLAVEMENT, 8, 1, 30)
end

return ability_object
