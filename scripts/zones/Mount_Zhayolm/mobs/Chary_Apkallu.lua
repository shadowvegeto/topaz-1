-----------------------------------
-- Area: Mount Zhayolm
--   NM: Chary Apkallu
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 456)
end

return entity
