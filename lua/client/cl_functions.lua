local kevlarVest = ClientsideModel("models/weapons/thenextscp/vest_w.mdl") -- TODO: Implement config
kevlarVest:SetNoDraw(true)

---------------------------------[ HOOKS ]----------------------------------

hook.Add("PostPlayerDraw", "ras_PostPlayerDraw", function(ply)
    
    if ply:GetNWBool("wearingKevlar") == true then
        if not IsValid(ply) or not ply:Alive() then return end

        local boneid = ply:LookupBone("ValveBiped.Bip01_Spine2")
        if not boneid then return end

        local matrix = ply:GetBoneMatrix(boneid)
        if not matrix then return end
        
        -- Draw the kevlar vest model using the calculated position and angle
        local pos, ang = LocalToWorld(Vector(-1, 1.8, 0), Angle(0, 91, 90), matrix:GetTranslation(), matrix:GetAngles())
        kevlarVest:SetPos(pos)
        kevlarVest:SetAngles(ang)
        kevlarVest:SetupBones()
        kevlarVest:DrawModel()
    end

end)

--[ @NoxTGM on all platforms ]--