-----------------------------------
-- Area: Kuftal Tunnel
--  Mob: Haunt
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 736, 2, tpz.regime.type.GROUNDS)
end

return entity
