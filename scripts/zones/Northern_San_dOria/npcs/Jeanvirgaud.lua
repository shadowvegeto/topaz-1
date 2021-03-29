-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Jeanvirgaud
-- Outpost Teleporter NPC
-- !pos 111 -0.199 -6 231
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------
local entity = {}

local teleporterNation = tpz.nation.SANDORIA
local teleporterEvent  = 716

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
