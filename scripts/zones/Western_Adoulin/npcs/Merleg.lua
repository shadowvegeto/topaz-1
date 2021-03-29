-----------------------------------
-- Area: Western Adoulin
--  NPC: Merleg
-- Type: Standard NPC and Quest Giver
-- Starts, Involved with, and Finishes Quest: 'A Pioneers Best (Imaginary) Friend'
-- !pos 34 0 -131 256
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/keyitems")
require("scripts/globals/status")
local ID = require("scripts/zones/Western_Adoulin/IDs")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local APBIF = player:getQuestStatus(tpz.quest.log_id.ADOULIN, tpz.quest.id.adoulin.A_PIONEERS_BEST_IMAGINARY_FRIEND)
    if (APBIF == QUEST_ACCEPTED) then
        if (player:hasStatusEffect(tpz.effect.IONIS)) then
            -- Finishing Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(2522)
        else
            -- Dialgoue during Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(2521)
        end
    elseif (APBIF == QUEST_AVAILABLE) then
        player:startEvent(2520)
    else
        -- Standard dialogue
        player:startEvent(543)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 2520) then
        -- Starting Quest: 'A Pioneers Best (Imaginary) Friend'
        player:addQuest(tpz.quest.log_id.ADOULIN, tpz.quest.id.adoulin.A_PIONEERS_BEST_IMAGINARY_FRIEND)
        if (player:hasStatusEffect(tpz.effect.IONIS)) then
            -- Finishes quest if Ionis is already active
            player:startEvent(2522)
        end
    elseif (csid == 2522) then
        -- Finishing Quest: 'A Pioneers Best (Imaginary) Friend'
        player:completeQuest(tpz.quest.log_id.ADOULIN, tpz.quest.id.adoulin.A_PIONEERS_BEST_IMAGINARY_FRIEND)
        player:addExp(500 * EXP_RATE)
        player:addCurrency('bayld', 200 * BAYLD_RATE)
        player:messageSpecial(ID.text.BAYLD_OBTAINED, 200 * BAYLD_RATE)
        player:addKeyItem(tpz.ki.FAIL_BADGE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.FAIL_BADGE)
        player:addFame(ADOULIN)
    end
end

return entity
