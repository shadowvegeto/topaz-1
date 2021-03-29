-----------------------------------
-- Area: Windurst Walls
--  NPC: Yoriri
-- Type: Standard NPC
-- !pos 65.268 -8.5 -58.309 239
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    local WildcatWindurst = player:getCharVar("WildcatWindurst")

    if (player:getQuestStatus(tpz.quest.log_id.WINDURST, tpz.quest.id.windurst.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and not utils.mask.getBit(WildcatWindurst, 5)) then
        player:startEvent(496)
    else
        player:startEvent(313)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 496) then
        player:setCharVar("WildcatWindurst", utils.mask.setBit(player:getCharVar("WildcatWindurst"), 5, true))
    end

end

return entity
