-----------------------------------
-- Area: Port San d'Oria
--  NPC: Apstaule
-- Not used cutscenes: 541
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
    local count = trade:getItemCount()
    local AuctionParcel = trade:hasItemQty(594, 1)

    if (AuctionParcel == true and count == 1) then
        local TheBrugaireConsortium = player:getQuestStatus(tpz.quest.log_id.SANDORIA, tpz.quest.id.sandoria.THE_BRUGAIRE_CONSORTIUM)
        if (TheBrugaireConsortium == 1) then
            player:tradeComplete()
            player:startEvent(540)
            player:setCharVar("TheBrugaireConsortium-Parcels", 21)
        end
    end

end

entity.onTrigger = function(player, npc)
    player:startEvent(542)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
