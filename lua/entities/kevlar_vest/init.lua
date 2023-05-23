AddCSLuaFile( "shared.lua" )
include( "shared.lua" )

function ENT:Initialize()

    self:SetModel( "models/weapons/thenextscp/vest_w.mdl" )
    self:PhysicsInit( SOLID_VPHYSICS ) -- Use the PhysObjects of the entity
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON ) -- Doesn't collide with players and vehicles
    self:SetUseType( SIMPLE_USE ) -- Fire a USE_ON signal only once when player presses their use key
	self:SetNWInt( "kevlarDurability", 100 )

    local phys = self:GetPhysicsObject()

    if phys:IsValid() then
        phys:Wake()
    end

end

function ENT:Use( ply )

    if ( ply:GetNWBool( "wearingKevlar" ) == true ) then
        ply:PrintMessage( HUD_PRINTCENTER, "You are already wearing a kevlar vest" )
    return end

    ply:PrintMessage( HUD_PRINTCENTER, "You have equipped a kevlar vest" )
    ply:SetArmor( self:GetNWInt( "kevlarDurability" ) )
    sound.Play( "helmet_pickup.wav", Vector( ply:GetPos() ) )

    self:Remove()

	ply:SetNWBool( "wearingKevlar", true )
    
end

--------------------------------
--[ @NoxTGM on all platforms ]--
--------------------------------