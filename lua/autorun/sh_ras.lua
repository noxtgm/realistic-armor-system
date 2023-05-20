MsgC( Color( 50, 200, 50 ), "[RAS] ", Color( 255, 255, 255 ), "Thank you for using Realistic Armor System! Don't forget to like the addon on the workshop if you enjoy it <3\n" )

---------------------------- [ ConCMD & Hooks ] ----------------------------

concommand.Add( "unequipKevlar",
	function( ply )
		if not IsValid( ply ) or not ply:Alive() then return end -- Makes sure the player is valid and alive
		if ( ply:GetNWBool( "wearingKevlar" ) == false ) then -- Checks if the player is not wearing a kevlar vest
			ply:PrintMessage( HUD_PRINTCENTER, "You don't have any kevlar vest equipped" )
		return end

		ply:PrintMessage( HUD_PRINTCENTER, "You have unequipped your kevlar vest" )

		local ent = ents.Create( "kevlar_vest" )
		ent:SetPos( ply:GetPos() + Vector( 0, -25, 25 ) )
		ent:Spawn()
		ent:Activate()
		ent:SetNWInt( "kevlarDurability", ply:Armor() ) -- Sets the entity durability to the player's armor

		ply:SetArmor( 0 )
		sound.Play( "helmet_pickup.wav", Vector( ply:GetPos() ) ) -- Emit the pickup sound on the player's position
		
		ply:SetNWInt( "kevlarDurability", 0 )
		ply:SetNWBool( "wearingKevlar", false )
	end
)

concommand.Add( "vestDurability", function( ply )
	if ( ply:GetNWBool( "wearingKevlar" ) == false ) then -- Checks if the player is not wearing a kevlar vest
		ply:PrintMessage( HUD_PRINTCENTER, "You don't have any kevlar vest equipped" )
	return end

	ply:PrintMessage( HUD_PRINTCENTER, ply:Armor() )
end )

hook.Add( "PlayerDeath", "ras_PlayerDeath", function( victim )
	victim:SetNWBool( "wearingVest", false )
end )

--------------------------------- [ MENU ] ---------------------------------

function RASSettings( Panel )
	Panel:Help( "" )
	Panel:Button( "Unequip kevlar vest", "unequipKevlar" )
	Panel:Button( "Check vest durability", "vestDurability" )
	Panel:Help( "" )
end

function RASMenuMaker()
	spawnmenu.AddToolMenuOption( "Options", "Realistic Armor", "rasmenu", "Settings", "custom_doit", "", RASSettings )
end

hook.Add( "PopulateToolMenu", "BallisticVestpleaseworkpls", RASMenuMaker )