-----------------------------------
-- Area: Bibiki Bay
--  NPC: Fheli Lapatzuo
-- Type: Manaclipper Timekeeper
-- !pos 488.793 -4.003 709.473 4
-----------------------------------
require("scripts/globals/manaclipper")
-----------------------------------
local entity = {}

local timekeeperLocation = tpz.manaclipper.location.SUNSET_DOCKS
local timekeeperEventId = 18

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    tpz.manaclipper.timekeeperOnTrigger(player, timekeeperLocation, timekeeperEventId)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
