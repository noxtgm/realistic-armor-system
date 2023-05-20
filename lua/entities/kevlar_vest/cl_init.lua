include( "shared.lua" )

local kevlarVest = ClientsideModel( "models/weapons/thenextscp/vest_w.mdl" )
kevlarVest:SetNoDraw( true )

local offsetvec = Vector( -1, 1.8, 0 )
local offsetang = Angle( 0, 91, 90 )

hook.Add( "PostPlayerDraw" , "ras_PostPlayerDraw" , function( ply )
    
    if ( ply:GetNWBool( "wearingKevlar" ) == true ) then -- Checks if the player is already wearing a kevlar vest
        if not IsValid( ply ) or not ply:Alive() then return end -- Makes sure the player is valid and alive

        local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )
        if not boneid then return end

        local matrix = ply:GetBoneMatrix( boneid )
        if not matrix then return end
        
        local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )
        kevlarVest:SetPos( newpos )
        kevlarVest:SetAngles( newang )
        kevlarVest:SetupBones()
        kevlarVest:DrawModel()
    end

end )