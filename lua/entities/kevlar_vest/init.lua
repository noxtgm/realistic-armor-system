AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

-------------------------------[ FUNCTIONS ]--------------------------------

function ENT:Initialize()

    self:SetModel("models/weapons/thenextscp/vest_w.mdl") -- TODO: Implement config
    self:PhysicsInit(SOLID_VPHYSICS) -- Use the PhysObjects of the entity
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- Doesn't collide with players and vehicles
    self:SetUseType(SIMPLE_USE) -- Fire a USE_ON signal only once when the player presses their use key

	self:SetNWInt("kevlarDurability", 100) -- TODO: Implement config

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

function ENT:Use(act, ply)

    if ply:GetNWBool("wearingKevlar") == true then
        --if ras.NotifyAlreadyEquipped then ply:PrintMessage(HUD_PRINTCENTER, ras.LanguageAlreadyEquippedMessage) end -- TODO: Implement new notification system
    return end
    
    --if ras.NotifyPlayerOnEquip then ply:PrintMessage(HUD_PRINTCENTER, ras.LanguageEquipMessage) end -- TODO: Implement new notification system

    sound.Play("helmet_pickup.wav", Vector(ply:GetPos())) -- TODO: Implement config
    ply:SetArmor(self:GetNWInt("kevlarDurability"))
	ply:SetNWBool("wearingKevlar", true)

    self:Remove()
    
end

function ENT:Think()

    -- TODO: Kevlar model logic

end

--[ @NoxTGM on all platforms ]--