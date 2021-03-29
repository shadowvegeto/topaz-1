-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Telepoint
-- !pos 305.989 -14.980 18.960 97
-----------------------------------
local ID = require("scripts/zones/Meriphataud_Mountains_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if not player:hasKeyItem(tpz.ki.MERIPHATAUD_GATE_CRYSTAL) then
        npcUtil.giveKeyItem(player, tpz.ki.MERIPHATAUD_GATE_CRYSTAL)
    else
        player:messageSpecial(ID.text.ALREADY_OBTAINED_TELE)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
