-----------------------------------
-- Area: Sea Serpent Grotto
--   NM: Masan
-----------------------------------
require("scripts/globals/hunts")
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(tpz.mobMod.GIL_MIN, 1500)
    mob:setMobMod(tpz.mobMod.GIL_MAX, 1800)
end

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 371)
end

return entity
