-----------------------------------
-- Area: Throne Room
-- NPC:  Throne Room
-- Type: Door
-- !pos -111 -6 0 165
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/bcnm")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    TradeBCNM(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:getCurrentMission(player:getNation()) == tpz.mission.id.nation.SHADOW_LORD and player:getCharVar("MissionStatus") == 2) then
        player:startEvent(6)
    elseif (EventTriggerBCNM(player, npc)) then
        return 1
    end
end

entity.onEventUpdate = function(player, csid, option, extras)
    EventUpdateBCNM(player, csid, option, extras)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 6) then
        player:setCharVar("MissionStatus", 3)
    elseif (EventFinishBCNM(player, csid, option)) then
        return
    end
end

return entity
