-----------------------------------
-- Area: Metalworks
--  NPC: Alois
-- Involved in Missions: Wading Beasts
-- !pos 96 -20 14 237
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    if (player:getCurrentMission(BASTOK) == tpz.mission.id.bastok.WADING_BEASTS and trade:hasItemQty(4362, 1) and trade:getItemCount() == 1) then -- Trade Lizard Egg
        if (player:hasCompletedMission(tpz.mission.log_id.BASTOK, tpz.mission.id.bastok.WADING_BEASTS) == false) then
            player:startEvent(372)
        else
            player:startEvent(373)
        end
    end
end

entity.onTrigger = function(player, npc)
    local FadedPromises = player:getQuestStatus(tpz.quest.log_id.BASTOK, tpz.quest.id.bastok.FADED_PROMISES)

    if (player:getCurrentMission(BASTOK) == tpz.mission.id.bastok.THE_SALT_OF_THE_EARTH and player:getCharVar("BASTOK91") == 0) then
        player:startEvent(773)
    elseif (player:getCharVar("BASTOK91") == 1) then
        player:startEvent(774)
    elseif (player:getCharVar("BASTOK91") == 3) then
        player:startEvent(775)
    elseif (player:getCharVar("BASTOK91") == 4) then
        player:startEvent(776)
    elseif (player:getCharVar("FadedPromises") == 4) then
        player:startEvent(805)
    else
        player:startEvent(370)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 372 or csid == 373) then
        finishMissionTimeline(player, 1, csid, option)
    elseif (csid == 773) then
        player:setCharVar("BASTOK91", 1)
    elseif (csid == 776) then
        player:setCharVar("BASTOK91", 0)
        player:completeMission(tpz.mission.log_id.BASTOK, tpz.mission.id.bastok.THE_SALT_OF_THE_EARTH)
        player:addRankPoints(1500)
        player:setCharVar("OptionalcsCornelia", 1)
    elseif (csid == 805) then
        if npcUtil.completeQuest(
            player,
            tpz.quest.log_id.BASTOK,
            tpz.quest.id.bastok.FADED_PROMISES,
            {item = 17775, tpz.title.ASSASSIN_REJECT, var = {"FadedPromises"}, fame=10})
        then
            player:delKeyItem(tpz.ki.DIARY_OF_MUKUNDA)
        end
    end
end

return entity
