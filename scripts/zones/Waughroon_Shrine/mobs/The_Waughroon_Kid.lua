-----------------------------------
-- Area: Waughroon Shrine
--  Mob: The Waughroon Kid
-- BCNM: The Final Bout
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMod(tpz.mod.REGAIN, 100)
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity
