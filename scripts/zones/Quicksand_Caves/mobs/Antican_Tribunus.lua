-----------------------------------
-- Area: Quicksand Caves
--   NM: Antican Tribunus
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 432)
end

return entity
