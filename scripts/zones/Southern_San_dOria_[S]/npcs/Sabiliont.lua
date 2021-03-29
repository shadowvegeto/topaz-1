-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Sabiliont
-- !pos 9 2 -87 80
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/utils")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if (player:getQuestStatus(tpz.quest.log_id.CRYSTAL_WAR, tpz.quest.id.crystalWar.GIFTS_OF_THE_GRIFFON) == QUEST_ACCEPTED and player:getCharVar("GiftsOfGriffonProg") == 2) then
        local mask = player:getCharVar("GiftsOfGriffonPlumes")
        if (trade:hasItemQty(2528, 1) and trade:getItemCount() == 1 and not utils.mask.getBit(mask, 4)) then
            player:startEvent(27) -- Gifts of Griffon Trade
        end
    end
end

entity.onTrigger = function(player, npc)
    player:showText(npc, 6999) -- (Couldn't find default dialogue) What are you doing here? This is no place for civillians
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 27) then -- Gifts Of Griffon Trade
        player:tradeComplete()
        player:setCharVar("GiftsOfGriffonPlumes", utils.mask.setBit(player:getCharVar("GiftsOfGriffonPlumes"), 4, true))
    end
end

return entity
