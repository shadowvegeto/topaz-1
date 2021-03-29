-----------------------------------
-- Area: Mount Zhayolm
--  NPC: Engraved Tablet
-- !pos 320 -15.35 -379 61
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:hasKeyItem(tpz.ki.SILVER_SEA_SALT) then
        player:startEvent(12)
    else
        player:startEvent(14)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 12 and option == 1 then
        player:delKeyItem(tpz.ki.SILVER_SEA_SALT)
    end
end

return entity
