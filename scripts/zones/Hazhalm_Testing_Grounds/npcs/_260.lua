-----------------------------------
-- Area: Hazhalm Testing Grounds
--  NPC: Entry Gate (TOAU-36)
-----------------------------------
local ID = require("scripts/zones/Hazhalm_Testing_Grounds/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:getCurrentMission(TOAU) == tpz.mission.id.toau.GAZE_OF_THE_SABOTEUR and player:getCharVar("AhtUrganStatus") == 1) then
        player:startEvent(7)
    end
end

entity.onEventUpdate = function(player, csid, option)

end

entity.onEventFinish = function(player, csid, option)

    if (csid == 7) then
        player:completeMission(tpz.mission.log_id.TOAU, tpz.mission.id.toau.GAZE_OF_THE_SABOTEUR)
        player:setCharVar("AhtUrganStatus", 0)
        player:setTitle(tpz.title.EMISSARY_OF_THE_EMPRESS)
        player:addKeyItem(tpz.ki.LUMINIAN_DAGGER)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.LUMINIAN_DAGGER)
        player:addMission(tpz.mission.log_id.TOAU, tpz.mission.id.toau.PATH_OF_BLOOD)
    end

end

return entity
