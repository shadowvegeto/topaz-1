-----------------------------------
-- Area: Beaucedine Glacier (S)
--   NPC: Luhk Leotih, M.C.
-- Type: Campaign Arbiter
-- !pos 76.178 -60.763 -48.775 136
-----------------------------------
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    player:startEvent(452)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
