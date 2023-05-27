AddCSLuaFile("shared.lua")
include("shared.lua")

function ENT:Initialize()

    self:SetModel("models/weapons/thenextscp/vest_w.mdl") -- TODO: Config var for the model reference
    self:PhysicsInit(SOLID_VPHYSICS) -- Use the PhysObjects of the entity
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON) -- Doesn't collide with players and vehicles
    self:SetUseType(SIMPLE_USE) -- Fire a USE_ON signal only once when player presses their use key
	self:SetNWInt("kevlarDurability", 100)

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

function ENT:Use(ply)

    if ply:GetNWBool("wearingKevlar") == true then
        if NotifyAlreadyEquipped then ply:PrintMessage(HUD_PRINTCENTER, LanguageAlreadyEquippedMessage) end -- TODO: Implement new notification system
    return end
    
    if NotifyPlayerOnEquip then ply:PrintMessage(HUD_PRINTCENTER, LanguageEquipMessage) end -- TODO: Implement new notification system

    ply:SetArmor(self:GetNWInt("kevlarDurability"))
    sound.Play("helmet_pickup.wav", Vector(ply:GetPos())) -- TODO: Change equip sound
    
    self:Remove()

	ply:SetNWBool("wearingKevlar", true)
    
end

--[ @NoxTGM on all platforms ]--