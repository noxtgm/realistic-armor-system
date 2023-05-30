util.AddNetworkString("dropKevlarVest")

-------------------------------[ FUNCTIONS ]--------------------------------

local function DropArmor(len, ply)

    if ply:GetNWBool("wearingKevlar") == false then
        --if ras.NotifyNothingEquipped then ply:PrintMessage(HUD_PRINTCENTER, ras.LanguageNothingEquippedMessage) end -- TODO: Implement new notification system
    return end
    
    --if ras.NotifyOnUnequip then ply:PrintMessage(HUD_PRINTCENTER, ras.LanguageUnequipMessage) end -- TODO: Implement new notification system

    -- Create a new kevlar entity on the player's position
    -- Store the player's armor count as the entity's durability
    local ent = ents.Create("kevlar_vest")
    ent:SetPos(ply:GetPos() + Vector(0, 0, 35))
    ent:Spawn()
    ent:Activate()
    ent:SetNWInt("kevlarDurability", ply:Armor())
    
    -- Reset the player's armor and player stored int to 0 
    -- Notify the player by emitting a sound on his position
    sound.Play("helmet_pickup.wav", Vector(ply:GetPos())) -- TODO: Implement config
    ply:SetArmor(0)
    ply:SetNWInt("kevlarDurability", 0)
    ply:SetNWBool("wearingKevlar", false)

end

net.Receive("dropKevlarVest", DropArmor)

---------------------------------[ HOOKS ]----------------------------------

hook.Add("PlayerDeath", "ras_PlayerDeath", DropArmor)

--------------------------------[ CONCMDS ]---------------------------------

concommand.Add("unequip_kevlar_vest", DropArmor)

--[ @NoxTGM on all platforms ]--