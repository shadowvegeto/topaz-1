-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Balakaf
-- Type: Standard NPC
-- !pos 25.505 -6.999 126.478 50
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(515)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
