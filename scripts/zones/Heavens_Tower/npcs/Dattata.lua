-----------------------------------
-- Area: Heavens Tower
--  NPC: Dattata
-- Type: Standard NPC
-- !pos -6.172 -26.5 5.310 242
-----------------------------------
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local pNation = player:getNation()
    local currentMission = player:getCurrentMission(pNation)
    local missionStatus = player:getCharVar("MissionStatus")

    if
        (player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.MOON_READING and missionStatus >= 3) or
        player:hasCompletedMission(tpz.mission.log_id.WINDURST, tpz.mission.id.windurst.MOON_READING)
    then
        player:startEvent(392)
    else
        player:startEvent(61)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 392 then
        player:setCharVar("NoFear", 0)
    end
end

return entity
