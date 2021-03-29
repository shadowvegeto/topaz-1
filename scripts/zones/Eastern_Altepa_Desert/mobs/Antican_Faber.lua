-----------------------------------
-- Area: Eastern Altepa Desert
--  Mob: Antican Faber
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 110, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 111, 2, tpz.regime.type.FIELDS)
end

return entity
