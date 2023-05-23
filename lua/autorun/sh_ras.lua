MsgC( Color( 50, 200, 50 ), "[RAS] ", Color( 255, 255, 255 ), "Thank you for using Realistic Armor System! Don't forget to like the addon on the workshop if you enjoy it <3\n" )

------------------------------- [ Functions ] ------------------------------

local function DropArmor( ply )

	if ( ply:GetNWBool( "wearingKevlar" ) == false ) then
		ply:PrintMessage( HUD_PRINTCENTER, "You don't have any kevlar vest equipped" )
	return end

	ply:PrintMessage( HUD_PRINTCENTER, "You have unequipped your kevlar vest" )
	
	-- Create a new kevlar entity on the player's position
	-- Store the player's armor count as the entity's durability
	local ent = ents.Create( "kevlar_vest" )
	ent:SetPos( ply:GetPos() + Vector( 0, 0, 25 ) )
	ent:Spawn()
	ent:Activate()
	ent:SetNWInt( "kevlarDurability", ply:Armor() )

	-- Reset the player's armor and player stored var to 0 
	-- Notify the player by emitting a sound on his position
	sound.Play( "helmet_pickup.wav", Vector( ply:GetPos() ) ) 
	ply:SetArmor( 0 )
	ply:SetNWInt( "kevlarDurability", 0 )
	ply:SetNWBool( "wearingKevlar", false )
	
end

hook.Add( "PlayerDeath", "ras_PlayerDeath", DropArmor )

-------------------------------- [ ConCMD ] --------------------------------

concommand.Add( "unequipKevlar", DropArmor )

concommand.Add( "vestDurability", function( ply )

	if ( ply:GetNWBool( "wearingKevlar" ) == false ) then
		ply:PrintMessage( HUD_PRINTCENTER, "You don't have any kevlar vest equipped" )
	return end

	ply:PrintMessage( HUD_PRINTCENTER, ply:Armor() )

end )

--------------------------------- [ MENU ] ---------------------------------

function RASSettings( Panel )

	Panel:Help( "" )
	Panel:Button( "Unequip kevlar vest", "unequipKevlar" )
	Panel:Button( "Check vest durability", "vestDurability" )
	Panel:Help( "" )

end

hook.Add( "PopulateToolMenu", "BallisticVestpleaseworkpls", function( ply )

	spawnmenu.AddToolMenuOption( "Options", "Realistic Armor", "rasmenu", "Actions", "", "", RASSettings )

end )

--------------------------------
--[ @NoxTGM on all platforms ]--
--------------------------------