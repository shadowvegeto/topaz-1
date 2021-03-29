-----------------------------------
-- Area: Port San d'Oria
--  NPC: Nogelle
-- Starts Lufet's Lake Salt
-----------------------------------
local ID = require("scripts/zones/Port_San_dOria/IDs")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    if (player:getQuestStatus(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.LUFET_S_LAKE_SALT) == QUEST_ACCEPTED) then
        local count = trade:getItemCount()
        LufetSalt = trade:hasItemQty(1019, 3)
        if (LufetSalt == true and count == 3) then
            player:tradeComplete()
            player:addFame(SANDORIA, 30)
            player:addGil(GIL_RATE*600)
            player:addTitle(tpz.title.BEAN_CUISINE_SALTER)
            player:completeQuest(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.LUFET_S_LAKE_SALT)
            player:startEvent(11)
        end
    end
end

entity.onTrigger = function(player, npc)

    local LufetsLakeSalt = player:getQuestStatus(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.LUFET_S_LAKE_SALT)

    if (LufetsLakeSalt == 0) then
        player:startEvent(12)
    elseif (LufetsLakeSalt == 1) then
        player:startEvent(10)
    elseif (LufetsLakeSalt == 2) then
        player:startEvent(522)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)

    if (csid == 12 and option == 1) then
        player:addQuest(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.LUFET_S_LAKE_SALT)
    elseif (csid == 11) then
        player:messageSpecial(ID.text.GIL_OBTAINED, GIL_RATE*600)
    end
end

return entity
