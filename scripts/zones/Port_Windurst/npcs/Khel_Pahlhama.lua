-----------------------------------
-- Area: Port Windurst
--  NPC: Khel Pahlhama
--  Linkshell Merchant
-- !pos 21 -2 -20 240
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
        512,  8000,    -- Linkshell
        16285, 375,    -- Pendant Compass
    }

    player:showText(npc, ID.text.KHEL_PAHLHAMA_SHOP_DIALOG, 513)
    tpz.shop.general(player, stock)
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
end

return entity
