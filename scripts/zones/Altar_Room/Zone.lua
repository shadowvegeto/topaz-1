-----------------------------------
--
-- Zone: Altar_Room (152)
--
-----------------------------------
local ID = require("scripts/zones/Altar_Room/IDs")
require("scripts/globals/conquest")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------
local zone_object = {}

zone_object.onInitialize = function(zone)
end

zone_object.onZoneIn = function(player, prevZone)
    local cs = -1
    local head = player:getEquipID(tpz.slot.HEAD)

    if player:getCharVar("FickblixCS") == 1 then
        cs = 10000
    elseif player:getQuestStatus(tpz.quest.log_id.OTHER_AREAS, tpz.quest.id.otherAreas.A_MORAL_MANIFEST) == QUEST_AVAILABLE and
        player:getMainLvl() >= 60 and player:getCharVar("moraldecline") <= os.time() then
        cs = 46
    elseif player:getCharVar("moral") == 4 and head == 15202 then -- Yagudo Headgear
        cs = 47
    elseif player:getCharVar("moral") == 8 and head == 15216 then -- Tsoo Headgear
        cs = 51
    end
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(-247.998, 12.609, -100.008, 128)
    end
    return cs
end

zone_object.onConquestUpdate = function(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

zone_object.onRegionEnter = function(player, region)
end

zone_object.onEventUpdate = function(player, csid, option)
end

zone_object.onEventFinish = function(player, csid, option)
    if csid == 10000 then
        player:setCharVar("FickblixCS", 0)
    elseif csid == 46 and option == 0 then
        player:setCharVar("moral", 1)
        player:addQuest(tpz.quest.log_id.OTHER_AREAS, tpz.quest.id.otherAreas.A_MORAL_MANIFEST)
    elseif csid == 46 and option == 1 then
        player:setCharVar("moraldecline", getConquestTally())
    elseif csid == 47 then
        npcUtil.giveKeyItem(player, tpz.ki.VAULT_QUIPUS)
        player:setCharVar("moral", 5)
    elseif csid == 51 then
        player:setCharVar("moralrebuy", 1)
        npcUtil.completeQuest(player, OTHER_AREAS_LOG, tpz.quest.id.otherAreas.A_MORAL_MANIFEST, {
            item = 748,
            var = "moral"
        })
    end
end

return zone_object
