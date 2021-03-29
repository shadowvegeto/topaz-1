-----------------------------------
-- Area: Inner Horutoto Ruins
--  Mob: Blade Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 648, 1, tpz.regime.type.GROUNDS)
end

return entity
