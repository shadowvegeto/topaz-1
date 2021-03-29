-----------------------------------
-- Area: Outer Horutoto Ruins
--  Mob: Seven of Cups
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 666, 1, tpz.regime.type.GROUNDS)
end

return entity
