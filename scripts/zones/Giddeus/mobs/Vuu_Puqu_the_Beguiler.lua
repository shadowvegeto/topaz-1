-----------------------------------
-- Area: Giddeus (145)
--   NM: Vuu Puqu the Beguiler
-----------------------------------
require("scripts/globals/hunts")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 282)
end

return entity
