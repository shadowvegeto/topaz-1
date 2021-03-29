-----------------------------------
-- Area: Waughroon Shrine
--  Mob: Macha
-- BCNM: Birds of a Feather
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(tpz.mod.SLEEPRES, 50)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
