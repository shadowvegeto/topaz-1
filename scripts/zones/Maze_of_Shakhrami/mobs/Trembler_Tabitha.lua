-----------------------------------
-- Area: Maze of Shakhrami
--   NM: Trembler Tabitha
-----------------------------------
require("scripts/globals/hunts")
-----------------------------------
local entity = {}

entity.onMobDeath = function(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 293)
end

return entity
