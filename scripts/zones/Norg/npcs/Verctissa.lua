-----------------------------------
-- Area: Norg
--  NPC: Verctissa
-- Starts Quest: Trial Size Trial By Water
-- !pos -13 1 -20 252
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/quests")
require("scripts/globals/teleports")
local ID = require("scripts/zones/Norg/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)

    if (trade:hasItemQty(1549, 1) and player:getQuestStatus(tpz.quest.log_id.OUTLANDS, tpz.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER) == QUEST_ACCEPTED and player:getMainJob() == tpz.job.SMN) then
        player:startEvent(200, 0, 1549, 2, 20)
    end

end

entity.onTrigger = function(player, npc)

    local TrialSizeWater = player:getQuestStatus(tpz.quest.log_id.OUTLANDS, tpz.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER)
    if (player:getMainLvl() >= 20 and player:getMainJob() == tpz.job.SMN and TrialSizeWater == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 2) then --Requires player to be Summoner at least lvl 20
        player:startEvent(199, 0, 1549, 2, 20)     --mini tuning fork of water, zone, level
    elseif (TrialSizeWater == QUEST_ACCEPTED) then
        local WaterFork = player:hasItem(1549)

        if (WaterFork) then
            player:startEvent(111) --Dialogue given to remind player to be prepared
        else
            player:startEvent(203, 0, 1549, 2, 20) --Need another mini tuning fork
        end
    elseif (TrialSizeWater == QUEST_COMPLETED) then
        player:startEvent(202) --Defeated Avatar
    else
        player:startEvent(114) --Standard dialogue
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 199 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1549) --Mini tuning fork
        else
            player:addQuest(tpz.quest.log_id.OUTLANDS, tpz.quest.id.outlands.TRIAL_SIZE_TRIAL_BY_WATER)
            player:addItem(1549)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 1549)
        end
    elseif (csid == 203 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 1549) --Mini tuning fork
        else
            player:addItem(1549)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 1549)
        end
    elseif (csid == 200 and option == 1) then
        tpz.teleport.to(player, tpz.teleport.id.CLOISTER_OF_TIDES)
    end

end

return entity
