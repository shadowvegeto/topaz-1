-----------------------------------
-- Area: Port Windurst
--  NPC: Kucha Malkobhi
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Port_Windurst/IDs")
require("scripts/globals/shop")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local stock =
    {
        12635, 273,    -- Tarutaru Kaftan
        12756, 163,    -- Tarutaru Mitts
        12886, 236,    -- Tarutaru Braccae
        13007, 163,    -- Tarutaru Clomps
        12636, 273,    -- Mithran Separates
        12757, 163,    -- Mithran Gauntlets
        12887, 236,    -- Mithran Loincloth
        13008, 163,    -- Mithran Gaiters
    }

    player:showText(npc, ID.text.KUCHAMALKOBHI_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
