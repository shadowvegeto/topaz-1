-----------------------------------
-- Area: Empyreal_Paradox
--  NPC: ??? (qm1)
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player,npc)
    if
        player:hasCompletedQuest(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.APOCALYPSE_NIGH) and not
        (
            player:hasItem(15962) or
            player:hasItem(15963) or
            player:hasItem(15964) or
            player:hasItem(15965)
        )
    then
        player:startEvent(5)
    else
        player:messageSpecial(ID.text.QM_TEXT)
    end
end

entity.onEventUpdate = function(player,csid,option,extras)
end

entity.onEventFinish = function(player,csid,option)
    if csid == 5 and option == 1 then
        player:delMission(tpz.mission.log_id.COP, tpz.mission.id.cop.THE_LAST_VERSE)
        player:delMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.THE_LAST_VERSE)
        player:addMission(tpz.mission.log_id.COP, tpz.mission.id.cop.DAWN)
        player:addMission(tpz.mission.log_id.ZILART, tpz.mission.id.zilart.AWAKENING)
        player:setCharVar("ZilartStatus", 3)
        player:setCharVar("PromathiaStatus", 7)
        player:delQuest(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED)
        player:delQuest(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.APOCALYPSE_NIGH)
    end
end

return entity
