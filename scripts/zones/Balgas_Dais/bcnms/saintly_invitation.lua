-----------------------------------
-- Area: Horlais Peak
-- Name: Saintly Invitation
-- !pos 299 -123 345 146
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------
local battlefield_object = {}

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldEnter = function(player, battlefield)
end

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()

        if player:hasCompletedMission(tpz.mission.log_id.WINDURST, tpz.mission.id.windurst.SAINTLY_INVITATION) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        end
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(WINDURST) == tpz.mission.id.windurst.SAINTLY_INVITATION then
            player:addTitle(tpz.title.VICTOR_OF_THE_BALGA_CONTEST)
            npcUtil.giveKeyItem(player, tpz.ki.BALGA_CHAMPION_CERTIFICATE)
            player:setCharVar("MissionStatus", 2)
        end
    end
end

return battlefield_object
