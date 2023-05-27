include( "shared.lua" )

local kevlarVest = ClientsideModel( "models/weapons/thenextscp/vest_w.mdl" )
kevlarVest:SetNoDraw( true )

local offsetvec = Vector( -1, 1.8, 0 )
local offsetang = Angle( 0, 91, 90 )

local function DrawArmor( ply )
    
    if ( ply:GetNWBool( "wearingKevlar" ) == true ) then
        if not IsValid( ply ) or not ply:Alive() then return end

        local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )
        if not boneid then return end

        local matrix = ply:GetBoneMatrix( boneid )
        if not matrix then return end
        
        -- Draw the kevlar vest model on the calculated position and angle
        local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )
        kevlarVest:SetPos( newpos )
        kevlarVest:SetAngles( newang )
        kevlarVest:SetupBones()
        kevlarVest:DrawModel()
    end

end

hook.Add( "PostPlayerDraw", "ras_PostPlayerDraw", DrawArmor )

--------------------------------
--[ @NoxTGM on all platforms ]--
--------------------------------