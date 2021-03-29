-----------------------------------
-- Area: Gusgen Mines
--  Mob: Bandersnatch
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 681, 2, tpz.regime.type.GROUNDS)
end

return entity
