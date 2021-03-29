-----------------------------------
--
-- Zone: Abyssea - Grauberg
--
-----------------------------------
local ID = require("scripts/zones/Abyssea-Grauberg/IDs")
require("scripts/globals/quests")
require("scripts/globals/helm")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
    tpz.helm.initZone(zone, tpz.helm.type.HARVESTING)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-555, 31, -760, 0)
    end

    if player:getQuestStatus(tpz.quest.log_id.ABYSSEA, tpz.quest.id.abyssea.THE_TRUTH_BECKONS) == QUEST_ACCEPTED and player:getCharVar("1stTimeAbyssea") == 0 then
        player:setCharVar("1stTimeAbyssea", 1)
    end

    return cs
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
end

return zone_object
