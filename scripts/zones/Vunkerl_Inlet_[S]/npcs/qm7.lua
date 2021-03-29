-----------------------------------
-- Area: Vunkerl Inlet (S) (H-6)
--  NPC: ???
-- Involved in Quests
-- !pos -26 -31 364
-----------------------------------
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)

    if (player:getQuestStatus(tpz.quest.log_id.CRYSTAL_WAR, tpz.quest.id.crystalWar.BOY_AND_THE_BEAST) == QUEST_AVAILABLE and player:getCharVar("BoyAndTheBeast") == 2) then
        player:startEvent(105)
    elseif (player:getQuestStatus(tpz.quest.log_id.CRYSTAL_WAR, tpz.quest.id.crystalWar.BOY_AND_THE_BEAST) == QUEST_ACCEPTED and player:getCharVar("BoyAndTheBeast") == 3) then
        player:startEvent(108)
    elseif (player:getQuestStatus(tpz.quest.log_id.CRYSTAL_WAR, tpz.quest.id.crystalWar.BOY_AND_THE_BEAST) == QUEST_ACCEPTED and player:getCharVar("BoyAndTheBeast") == 4) then
        player:startEvent(109)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 105) then
        player:addQuest(tpz.quest.log_id.CRYSTAL_WAR, tpz.quest.id.crystalWar.BOY_AND_THE_BEAST)
        player:addKeyItem(tpz.ki.VUNKERL_HERB_MEMO)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.VUNKERL_HERB_MEMO)
    elseif (csid == 108) then
        if(player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 17384) -- Carbon Fishing Rod
        else
            player:completeQuest(tpz.quest.log_id.CRYSTAL_WAR, tpz.quest.id.crystalWar.BOY_AND_THE_BEAST)
            player:delKeyItem(tpz.ki.VUNKERL_HERB_MEMO)
            player:delKeyItem(tpz.ki.VUNKERL_HERB)
            player:addItem(17384)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 17384) --Carbon Fishing Rod
        end
    elseif (csid == 109) then
        player:delKeyItem(tpz.ki.VUNKERL_HERB)
        player:setCharVar("BoyAndTheBeast", 2)
    end
end

return entity
