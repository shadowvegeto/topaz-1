-----------------------------------
-- Area: Metalworks
--  NPC: Takiyah
-- Type: Regional Merchant
-----------------------------------
local ID = require("scripts/zones/Metalworks/IDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if GetRegionOwner(tpz.region.QUFIMISLAND) ~= tpz.nation.BASTOK then
        player:showText(npc, ID.text.TAKIYAH_CLOSED_DIALOG)
    else
        local stock =
        {
            954, 4121,    -- Magic Pot Shard
        }

        player:showText(npc, ID.text.TAKIYAH_OPEN_DIALOG)
        tpz.shop.general(player, stock, BASTOK)
    end

end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
