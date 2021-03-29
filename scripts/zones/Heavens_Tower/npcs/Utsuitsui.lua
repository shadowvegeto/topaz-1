-----------------------------------
-- Area: Heavens Tower
--  NPC: Utsuitsui
-- Type: Standard NPC
-- !pos 6.379 -26.5 -4.043 242
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
        player:startEvent(397)
    else
        player:startEvent(66)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 397 then
        player:setCharVar("PainJoy", 0)
    end
end

return entity
