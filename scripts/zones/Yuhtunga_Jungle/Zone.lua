-----------------------------------
--
-- Zone: Yuhtunga_Jungle (123)
--
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/quests/i_can_hear_a_rainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/helm")
require("scripts/globals/zone")
require("scripts/globals/beastmentreasure")
-----------------------------------
local zone_object = {}

zone_object.onChocoboDig = function(player, precheck)
    return tpz.chocoboDig.start(player, precheck)
end

zone_object.onInitialize = function(zone)
    tpz.conq.setRegionalConquestOverseers(zone:getRegionID())

    tpz.helm.initZone(zone, tpz.helm.type.HARVESTING)
    tpz.helm.initZone(zone, tpz.helm.type.LOGGING)

    tpz.bmt.updatePeddlestox(tpz.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

zone_object.onGameDay = function()
    tpz.bmt.updatePeddlestox(tpz.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

zone_object.onConquestUpdate = function(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onZoneIn = function( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(116.825, 6.613, 100, 140)
    end

    if quests.rainbow.onZoneIn(player) then
        cs = 11
    end

    return cs
end

zone_object.onRegionEnter = function( player, region)
end

zone_object.onEventUpdate = function( player, csid, option)
    if csid == 11 then
        quests.rainbow.onEventUpdate(player)
    end
end

zone_object.onEventFinish = function( player, csid, option)
end

return zone_object
