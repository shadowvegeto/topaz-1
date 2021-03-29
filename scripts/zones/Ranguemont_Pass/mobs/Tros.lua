-----------------------------------
-- Area: Ranguemont Pass
--   NM: Tros
-- Used in Quests: Painful Memory
-- !pos -289 -45 212 166
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    if (player:hasKeyItem(tpz.ki.MERTAIRES_BRACELET)) then
        player:setCharVar("TrosKilled", 1)
        player:setCharVar("Tros_Timer", os.time())
    end
end

return entity
