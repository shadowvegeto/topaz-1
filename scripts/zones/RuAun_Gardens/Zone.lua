-----------------------------------
--
-- Zone: RuAun_Gardens (130)
--
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
require("scripts/globals/missions")
require("scripts/globals/conquest")
require("scripts/globals/treasure")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    for k, v in pairs(ID.npc.PORTALS) do
        zone:registerRegion(k, unpack(v["coords"]))
    end

    tpz.treasure.initZone(zone)

    tpz.conq.setRegionalConquestOverseers(zone:getRegionID())
end

zone_object.onConquestUpdate = function(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(333.017, -44.896, -458.35, 164)
    end
    if (player:getCurrentMission(ZILART) == tpz.mission.id.zilart.THE_GATE_OF_THE_GODS and player:getCharVar("ZilartStatus") == 1) then
        cs = 51
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
    local p = ID.npc.PORTALS[region:GetRegionID()]

    if (p["green"] ~= nil) then -- green portal
        if (player:getCharVar("skyShortcut") == 1) then
            player:startEvent(42)
        else
            title = player:getTitle()
            if (title == tpz.title.WARRIOR_OF_THE_CRYSTAL) then
                player:startEvent(41, title)
            else
                player:startEvent(43, title)
            end
        end

    elseif (p["portal"] ~= nil) then -- blue portal
        if (GetNPCByID(p["portal"]):getAnimation() == tpz.anim.OPEN_DOOR) then
            player:startEvent(p["event"])
        end

    elseif (type(p["event"]) == "table") then -- portal with random destination
        local events = p["event"]
        player:startEvent(events[math.random(#events)])

    else -- portal with static destination
        player:startEvent(p["event"])
    end
end

zone_object.onRegionLeave = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if (csid == 41 and option ~= 0) then
        player:setCharVar("skyShortcut", 1)
    elseif (csid == 51) then
        player:setCharVar("ZilartStatus", 0)
        player:completeMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.THE_GATE_OF_THE_GODS)
        player:addMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.ARK_ANGELS)
    end
end

return zone_object
