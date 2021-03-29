-----------------------------------
-- Area: Western Adoulin
--  NPC: Eternal Flame
-- Records of Eminence NPC
-----------------------------------
local ID = require("scripts/zones/Western_Adoulin/IDs")
require("scripts/globals/sparkshop")
require("scripts/globals/keyitems")
require("scripts/globals/msg")
require("scripts/globals/roe")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    tpz.sparkshop.onTrade(player, npc, trade, 5086)
end

entity.onTrigger = function(player, npc)
    if player:getEminenceProgress(1) then
        player:startEvent(5079)
    elseif player:hasKeyItem(tpz.ki.MEMORANDOLL) == false then
        player:startEvent(5080)
    else
        player:messageSpecial(ID.text.SPARK_EXCHANGE)
        tpz.sparkshop.onTrigger(player, npc, 5081)
    end
end

entity.onEventUpdate = function(player, csid, option)
    tpz.sparkshop.onEventUpdate(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if csid == 5079 and option == 1 then
        tpz.roe.onRecordTrigger(player, 1)
        player:messageBasic(tpz.msg.basic.ROE_BONUS_ITEM_PLURAL, 4376, 6)
    end
end

return entity
