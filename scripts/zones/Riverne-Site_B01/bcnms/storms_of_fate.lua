-----------------------------------
-- Area: Riverne Site #B01
-- Name: Storms of Fate
-- !pos 299 -123 345 146
-----------------------------------
local ID = require("scripts/zones/Riverne-Site_B01/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------
local battlefield_object = {}

battlefield_object.onBattlefieldTick = function(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

battlefield_object.onBattlefieldRegister = function(player, battlefield)
end

battlefield_object.onBattlefieldEnter = function(player, battlefield)
    player:delStatusEffect(tpz.effect.LEVEL_RESTRICTION) -- can't be capped at 50 for this fight !
end

battlefield_object.onBattlefieldLeave = function(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getQuestStatus(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.STORMS_OF_FATE) == QUEST_COMPLETED) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

battlefield_object.onEventUpdate = function(player, csid, option)
end

battlefield_object.onEventFinish = function(player, csid, option)
    if csid == 32001 then
        if player:getQuestStatus(tpz.quest.log_id.JEUNO, tpz.quest.id.jeuno.STORMS_OF_FATE) == QUEST_ACCEPTED and player:getCharVar('StormsOfFate') == 2 then
            player:addKeyItem(tpz.ki.WHISPER_OF_THE_WYRMKING)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.WHISPER_OF_THE_WYRMKING)
            player:setCharVar('StormsOfFate', 3)
            player:addTitle(tpz.title.CONQUEROR_OF_FATE)
        end
        if ENABLE_COP_ZONE_CAP == 1 then
            player:addStatusEffect(tpz.effect.LEVEL_RESTRICTION, 50, 0, 0)
        end
    end
end

return battlefield_object
