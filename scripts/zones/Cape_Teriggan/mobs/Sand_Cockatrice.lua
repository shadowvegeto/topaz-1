-----------------------------------
-- Area: Cape Teriggan
--  Mob: Sand Cockatrice
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 107, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 108, 1, tpz.regime.type.FIELDS)
end

return entity
