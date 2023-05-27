---------------------------------[ MENU ]-----------------------------------

function RASSettings(panel)

    panel:Help("")
    panel:Button("Unequip kevlar vest", "unequipKevlar")
    panel:Help("")

end

---------------------------------[ HOOKS ]----------------------------------

hook.Add("PopulateToolMenu", "ras_PopulateToolMenu", function(ply)

    spawnmenu.AddToolMenuOption("Options", "Realistic Armor", "RAS_Settings", "Settings", "", "", RASSettings)

end)

--[ @NoxTGM on all platforms ]--