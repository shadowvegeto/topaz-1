-----------------------------------
-- Area: Al Zahbi
--  NPC: Suldiran
-- Type: NPC Quest
-- !pos 42 -7 -43 48
-----------------------------------
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if player:getQuestStatus(tpz.quest.log_id.AHT_URHGAN, tpz.quest.id.ahtUrhgan.FEAR_OF_THE_DARK_II) >= QUEST_AVAILABLE and npcUtil.tradeHas( trade, {{2163, 2}} ) then
        player:startEvent(16)
    end
end

entity.onTrigger = function(player, npc)
    if player:getQuestStatus(tpz.quest.log_id.AHT_URHGAN, tpz.quest.id.ahtUrhgan.FEAR_OF_THE_DARK_II) == QUEST_AVAILABLE then
        player:startEvent(14)
    else
        player:startEvent(15)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 14 and option == 1 then
        player:addQuest(tpz.quest.log_id.AHT_URHGAN, tpz.quest.id.ahtUrhgan.FEAR_OF_THE_DARK_II)
    elseif csid == 16 then
        if npcUtil.completeQuest(player, AHT_URHGAN, tpz.quest.id.ahtUrhgan.FEAR_OF_THE_DARK_II, {title=tpz.title.DARK_RESISTANT, gil=200}) then
            player:confirmTrade()
        end
    end
end

return entity
