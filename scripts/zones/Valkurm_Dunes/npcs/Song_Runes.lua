-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Song Runes
-- Finishes Quest: Path of the Bard
-- !pos -721 -7 102 103
-----------------------------------
local ID = require("scripts/zones/Valkurm_Dunes/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- PATH OF THE BARD (Bard Flag)
    if (player:getQuestStatus(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.PATH_OF_THE_BARD) == QUEST_AVAILABLE and player:getCharVar("PathOfTheBard_Event") == 1) then
        player:startEvent(2)

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.SONG_RUNES_DEFAULT)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 2) then
        player:addGil(GIL_RATE*3000)
        player:messageSpecial(ID.text.GIL_OBTAINED, GIL_RATE*3000)
        player:addTitle(tpz.title.WANDERING_MINSTREL)
        player:unlockJob(tpz.job.BRD) -- Bard
        player:messageSpecial(ID.text.UNLOCK_BARD)  --You can now become a bard!
        player:setCharVar("PathOfTheBard_Event", 0)
        player:addFame(JEUNO, 30)
        player:completeQuest(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.PATH_OF_THE_BARD)
    end
end

return entity
