-----------------------------------
-- Area: West Sarutabaruta (115)
--   NM: Nunyenunc
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 251)
end

return entity
