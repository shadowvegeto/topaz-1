-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: Luminus convergence
-----------------------------------
require("scripts/globals/settings")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

end

entity.onTrigger = function(player, npc)
    if (player:getCurrentMission(COP) == tpz.mission.id.cop.WHEN_ANGELS_FALL and player:getCharVar("PromathiaStatus")==5) then
        player:startEvent(204)
    end
end

entity.onEventUpdate = function(player, csid, option)
    -- printf("onUpdate CSID: %u", csid)
    -- printf("onUpdate RESULT: %u", option)
end

entity.onEventFinish = function(player, csid, option)
    -- printf("onFinish CSID: %u", csid)
    -- printf("onFinish RESULT: %u", option)
    if (csid==204) then
        player:completeMission(tpz.mission.log_id.COP, tpz.mission.id.cop.WHEN_ANGELS_FALL)
        player:addMission(tpz.mission.log_id.COP, tpz.mission.id.cop.DAWN)
        player:setCharVar("PromathiaStatus", 0)
    end
end

return entity
