AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-------------------------------[ FUNCTIONS ]--------------------------------

function ENT:Initialize()

    self:SetModel("models/weapons/thenextscp/vest_w.mdl") -- TODO: Config var for the model reference
    self:PhysicsInit(SOLID_VPHYSICS) -- Use the PhysObjects of the entity
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- Doesn't collide with players and vehicles
    self:SetUseType(SIMPLE_USE) -- Fire a USE_ON signal only once when the player presses their use key

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

function ENT:Use(act, ply)

    -- TODO: Plate regen logic
    
end

--[ @NoxTGM on all platforms ]--