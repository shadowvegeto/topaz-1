-----------------------------------
-- Area: Western Adoulin
--  NPC: Noan
-- Type: Standard NPC
-- !pos 23 0 -84 256
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- Standard dialogue
    player:startEvent(544)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
