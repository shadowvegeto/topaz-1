-----------------------------------
-- Area: Western Adoulin (256)
--  NPC: Levil
-- Type: Quest and SoA Missions NPC
-- !pos -87.204 3.350 12.655
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local arceliaAppears = player:getCurrentMission(SOA) == tpz.mission.id.soa.ARCIELA_APPEARS_AGAIN

    if arceliaAppears and player:getFameLevel(ADOULIN) >= 4 then
        if player:getCharVar("SOA") == 0 then
            player:startEvent(6)
        else
            player:startEvent(7)
        end
    else
        player:startEvent(40)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 6 or csid == 7) and option == 1 then
        player:setCharVar("SOA", 0)
        player:completeMission(tpz.mission.log_id.SOA, tpz.mission.id.soa.ARCIELA_APPEARS_AGAIN)
        player:addMission(tpz.mission.log_id.SOA, tpz.mission.id.soa.BUILDING_PROSPECTS)
    elseif csid == 6 and option == 0 then
        player:setCharVar("SOA", 1)
    end
end

return entity
