-----------------------------------
-- Area: Qufim Island
--  MOB: Ophiotaurus
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs")
require("scripts/globals/missions")
require("scripts/globals/mobs")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(tpz.mobMod.IDLE_DESPAWN, 5)
end

entity.onMobDeath = function(mob, player, isKiller)
    local party = player:getParty()
    for _, member in pairs(party) do
        if member:getCurrentMission(ROV) == tpz.mission.id.rov.THE_LIONS_ROAR then
            member:completeMission(tpz.mission.log_id.ROV, tpz.mission.id.rov.THE_LIONS_ROAR)
            member:addMission(tpz.mission.log_id.ROV, tpz.mission.id.rov.EDDIES_OF_DESPAIR_I)
        end
    end
end

return entity
