-----------------------------------
-- Area: Al Zahbi
--  NPC: Danaaba
-- Type: Standard NPC
-- !pos -17.375 -6.999 59.161 48
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(248)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
