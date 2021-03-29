-----------------------------------
-- Area: Maze of Shakhrami
--  Mob: Bleeder Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 701, 2, tpz.regime.type.GROUNDS)
end

return entity
