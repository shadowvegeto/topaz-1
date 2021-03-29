-----------------------------------
-- Area: Ghelsba Outpost
--   NM: Sureshot Snatgat
-- Involved in Mission: Save the Children
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(tpz.mobMod.GIL_MAX, -1)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
