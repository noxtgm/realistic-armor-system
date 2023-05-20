AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()
    self:SetModel( "models/weapons/thenextscp/vest_w.mdl" )
    self:PhysicsInit( SOLID_VPHYSICS )
    self:SetMoveType( MOVETYPE_VPHYSICS )
    self:SetSolid( SOLID_VPHYSICS )
    self:SetUseType( SIMPLE_USE )
	self:SetNWInt( "kevlarDurability", 100 ) -- Set the initial vest durability to 100

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end
end

function ENT:Use( ply )

    if ( ply:GetNWBool( "wearingKevlar" ) == true ) then -- Checks if the player is already wearing a kevlar vest
        ply:PrintMessage( HUD_PRINTCENTER, "You are already wearing a kevlar vest" )
    return end

    ply:PrintMessage( HUD_PRINTCENTER, "You have equipped a kevlar vest" )
    ply:SetArmor( self:GetNWInt( "kevlarDurability" ) ) -- Set the player's armor to the durability of the kevlar vest
    sound.Play( "helmet_pickup.wav", Vector( ply:GetPos() ) ) -- Emit the pickup sound on the player's position

    self:Remove()

	ply:SetNWBool( "wearingKevlar", true )
    
end