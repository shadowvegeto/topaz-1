-----------------------------------
-- Area: Qu'Bia Arena
--  NPC: Burning Circle
-- !pos -221 -24 19 206
-----------------------------------
require("scripts/globals/bcnm")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    TradeBCNM(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    -- if (player:hasKeyItem(tpz.ki.MARK_OF_SEED) and player:getCurrentMission(ACP) == tpz.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_II) then
    --     player:startEvent(5)
    -- elseif (EventTriggerBCNM(player, npc)) then
    -- Temp disabled pending fixes for the BCNM mobs.

    EventTriggerBCNM(player, npc)
end

entity.onEventUpdate = function(player, csid, option, extras)
    EventUpdateBCNM(player, csid, option, extras)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 5) then
        player:completeMission(tpz.mission.log_id.ACP, tpz.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_II)
        player:addMission(tpz.mission.log_id.ACP, tpz.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_III)
    else
        EventFinishBCNM(player, csid, option)
    end
end

return entity
