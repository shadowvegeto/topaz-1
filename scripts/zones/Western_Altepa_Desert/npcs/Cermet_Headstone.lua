-----------------------------------
-- Area: Western Altepa Desert
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Earth Fragment)
-- !pos -108 10 -216 125
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

local function hasAllFragments(player)
    return
        player:hasKeyItem(tpz.ki.FIRE_FRAGMENT) and
        player:hasKeyItem(tpz.ki.ICE_FRAGMENT) and
        player:hasKeyItem(tpz.ki.WIND_FRAGMENT) and
        player:hasKeyItem(tpz.ki.EARTH_FRAGMENT) and
        player:hasKeyItem(tpz.ki.LIGHTNING_FRAGMENT) and
        player:hasKeyItem(tpz.ki.WATER_FRAGMENT) and
        player:hasKeyItem(tpz.ki.LIGHT_FRAGMENT) and
        player:hasKeyItem(tpz.ki.DARK_FRAGMENT)
end

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if player:getCurrentMission(ZILART) == tpz.mission.id.zilart.HEADSTONE_PILGRIMAGE then
        if not player:hasKeyItem(tpz.ki.EARTH_FRAGMENT) then
            player:startEvent(200, tpz.ki.EARTH_FRAGMENT)
        elseif hasAllFragments(player) then
            player:messageSpecial(ID.text.ALREADY_HAVE_ALL_FRAGS)
        elseif player:hasKeyItem(tpz.ki.EARTH_FRAGMENT) then
            player:messageSpecial(ID.text.ALREADY_OBTAINED_FRAG, tpz.ki.EARTH_FRAGMENT)
        end
    elseif player:hasCompletedMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.HEADSTONE_PILGRIMAGE) then
        player:messageSpecial(ID.text.ZILART_MONUMENT)
    else
        player:messageSpecial(ID.text.CANNOT_REMOVE_FRAG)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 200 and option == 1 then
        player:addKeyItem(tpz.ki.EARTH_FRAGMENT)

        -- Check and see if all fragments have been found (no need to check earth and dark frag)
        if hasAllFragments(player) then
            player:messageSpecial(ID.text.FOUND_ALL_FRAGS, tpz.ki.EARTH_FRAGMENT)
            player:addTitle(tpz.title.BEARER_OF_THE_EIGHT_PRAYERS)
            player:completeMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.HEADSTONE_PILGRIMAGE)
            player:addMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES)
        else
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.EARTH_FRAGMENT)
        end
    end
end

return entity
