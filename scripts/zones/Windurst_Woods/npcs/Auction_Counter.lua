-----------------------------------
-- Area: Windurst Woods
--  NPC: Auction Counter
-----------------------------------
require("scripts/quests/tutorial")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    tpz.tutorial.onAuctionTrigger(player)
    player:sendMenu(3)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
