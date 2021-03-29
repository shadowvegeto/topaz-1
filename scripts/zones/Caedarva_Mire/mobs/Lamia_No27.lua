-----------------------------------
-- Area: Caedarva Mire
--   NM: Lamia No.27
-- Note: Spawned during quest: "Not Meant to Be"
-----------------------------------
require("scripts/globals/quests")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    if player:getQuestStatus(tpz.quest.log_id.AHT_URHGAN, tpz.quest.id.ahtUrhgan.NOT_MEANT_TO_BE) == QUEST_ACCEPTED and player:getCharVar("notmeanttobeCS") == 3 and player:getCharVar("notmeanttobeLamia27Killed") < 1 then
        player:setCharVar("notmeanttobeLamia27Killed", 1)
    end
end

return entity
