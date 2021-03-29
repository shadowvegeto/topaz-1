-----------------------------------
-- Area: Port Windurst
--  NPC: Rottata
-- Outpost Teleporter NPC
-- !pos 193.111 -12.999 215.638 240
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------
local entity = {}

local teleporterNation = tpz.nation.WINDURST
local teleporterEvent  = 552

entity.onTrigger = function(player, npc)
    tpz.conquest.teleporterOnTrigger(player, teleporterNation, teleporterEvent)
end

entity.onEventUpdate = function(player, csid, option)
    tpz.conquest.teleporterOnEventUpdate(player, csid, option, teleporterEvent)
end

entity.onEventFinish = function(player, csid, option)
    tpz.conquest.teleporterOnEventFinish(player, csid, option, teleporterEvent)
end

return entity
