-------------------------------[ FUNCTIONS ]--------------------------------

local function DropArmor(ply)

    if ply:GetNWBool("wearingKevlar") == false then
        if NotifyNothingEquipped then ply:PrintMessage(HUD_PRINTCENTER, LanguageNothingEquippedMessage) end -- TODO: Implement new notification system
    return end
    
    if NotifyOnUnequip then ply:PrintMessage(HUD_PRINTCENTER, LanguageUnequipMessage) end -- TODO: Implement new notification system

    -- Create a new kevlar entity on the player's position
    -- Store the player's armor count as the entity's durability
    local ent = ents.Create("kevlar_vest")
    ent:SetPos(ply:GetPos() + Vector(0, 0, 35))
    ent:Spawn()
    ent:Activate()
    ent:SetNWInt("kevlarDurability", ply:Armor())
    
    -- Reset the player's armor and player stored int to 0 
    -- Notify the player by emitting a sound on his position
    sound.Play("helmet_pickup.wav", Vector(ply:GetPos())) -- TODO: Change unequip sound
    ply:SetArmor(0)
    ply:SetNWInt("kevlarDurability", 0)
    ply:SetNWBool("wearingKevlar", false)
    
end

---------------------------------[ HOOKS ]----------------------------------

hook.Add("PlayerDeath", "ras_PlayerDeath", DropArmor)

--------------------------------[ ConCMDs ]---------------------------------

concommand.Add("unequipKevlar", DropArmor)

--[ @NoxTGM on all platforms ]--