-----------------------------------
-- Area: La Theine Plateau
--  NPC: Chocobo Tracks
-- Involved in quest: Chocobo on the Loose!
-- !pos -556 0 523 102
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if (player:getQuestStatus(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.CHOCOBO_ON_THE_LOOSE) == QUEST_ACCEPTED and player:getCharVar("ChocoboOnTheLoose") < 2) then
        player:startEvent(209)
    else
        player:messageSpecial(ID.text.CHOCOBO_TRACKS)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 209) then
        player:setCharVar("ChocoboOnTheLoose", 2)
    end
end

return entity
