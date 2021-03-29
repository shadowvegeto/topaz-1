-----------------------------------
-- Area: Port San d'Oria
--  NPC: Altiret
-- NPC for Quest "The Pickpocket"
-- !pos 21.263 -3.999 -65.776 232
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    -- THE PICKPOCKET
    if player:getQuestStatus(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 579) then
        player:startEvent(550)

    -- DEFAULT DIALOG
    else
        player:startEvent(551)
    end
end

entity.onTrigger = function(player, npc)
    -- THE PICKPOCKET
    if player:getCharVar("thePickpocket") > 0 then
        player:startEvent(547)
    elseif player:getQuestStatus(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET) == QUEST_COMPLETED then
        player:startEvent(580)

    -- STANDARD DIALOG
    else
        player:startEvent(559)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    -- THE PICKPOCKET
    if csid == 547 and player:getQuestStatus(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET) == QUEST_AVAILABLE then
        player:addQuest(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET)
    elseif csid == 550 and npcUtil.completeQuest(player, SANDORIA, tpz.quest.id.sandoria.THE_PICKPOCKET, {item = 16667, title = tpz.title.PICKPOCKET_PINCHER, var = {"thePickpocket", "thePickpocketSkipNPC", "thePickpocketEagleButton"}}) then
        player:confirmTrade()
    end
end

return entity
