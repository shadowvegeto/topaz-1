-----------------------------------
-- Area: Jugner Forest [S]
--  NPC: Telepoint
-- !pos -122.862 0.000 -163.154 82
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if not player:hasKeyItem(tpz.ki.JUGNER_GATE_CRYSTAL) then
        npcUtil.giveKeyItem(player, tpz.ki.JUGNER_GATE_CRYSTAL)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
