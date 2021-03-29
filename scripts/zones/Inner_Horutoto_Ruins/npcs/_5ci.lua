-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: _5ci (Gate of Light)
-- Involved In Mission: 3-2
-- !pos -331 0 139 192
-----------------------------------
local ID = require("scripts/zones/Inner_Horutoto_Ruins/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if
        player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.WRITTEN_IN_THE_STARS and
        player:getCharVar("MissionStatus") == 1
    then
        player:startEvent(41, 0, tpz.ki.CHARM_OF_LIGHT)
    else
        player:messageSpecial(ID.text.DOOR_FIRMLY_CLOSED)
    end

    return 1
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 41 then
        player:setCharVar("MissionStatus", 2)
        player:delKeyItem(tpz.ki.CHARM_OF_LIGHT)
    end
end

return entity
