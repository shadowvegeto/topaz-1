-----------------------------------
--
-- Zone: Bastok_Mines (234)
--
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs")
require("scripts/globals/events/harvest_festivals")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/chocobo")
require("scripts/globals/zone")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    SetExplorerMoogles(ID.npc.EXPLORER_MOOGLE)

    applyHalloweenNpcCostumes(zone:getID())
    tpz.chocobo.initZone(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if ENABLE_ROV == 1 and player:getCurrentMission(ROV) == tpz.mission.id.rov.RHAPSODIES_OF_VANADIEL and player:getMainLvl()>=3 then
        cs = 30035
    end

    if player:getCurrentMission(ROV) == tpz.mission.id.rov.FATES_CALL and player:getCurrentMission(player:getNation()) > 15 then
        cs = 30036
    end

    -- FIRST LOGIN (START CS)
    if player:getPlaytime(false) == 0 then
        if NEW_CHARACTER_CUTSCENE == 1 then
            cs = 1
        end
        player:setPos(-45, -0, 26, 213)
        player:setHomePoint()
    -- ENTER THE TALEKEEPER
    elseif prevZone == tpz.zone.ZERUHN_MINES and player:getCurrentMission(BASTOK) == tpz.mission.id.bastok.ENTER_THE_TALEKEEPER and player:getCharVar("MissionStatus") == 5 then
        cs = 176
    end

    -- MOG HOUSE EXIT
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        local position = math.random(1, 5) - 75
        player:setPos(116, 0.99, position, 127)
    end

    return cs
end

zone_object.onConquestUpdate = function(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 1 then
        player:messageSpecial(ID.text.ITEM_OBTAINED, 536) -- adventurer coupon
    elseif csid == 176 then
        finishMissionTimeline(player, 1, csid, option)
    elseif csid == 30035 then
        player:completeMission(tpz.mission.log_id.ROV, tpz.mission.id.rov.RHAPSODIES_OF_VANADIEL)
        player:addMission(tpz.mission.log_id.ROV, tpz.mission.id.rov.RESONACE)
    elseif csid == 30036 then
        player:completeMission(tpz.mission.log_id.ROV, tpz.mission.id.rov.FATES_CALL)
        player:addMission(tpz.mission.log_id.ROV, tpz.mission.id.rov.WHAT_LIES_BEYOND)
    end
end

return zone_object
