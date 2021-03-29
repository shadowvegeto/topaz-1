-----------------------------------
-- Area: Ordelle's Caves
--  Mob: Bilis Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 662, 1, tpz.regime.type.GROUNDS)
end

return entity
