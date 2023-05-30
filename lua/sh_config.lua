ras = {}

-------------------------------[ VARIABLES ]--------------------------------

-- Wether the player should be notified when they equip a kevlar vest
ras.NotifyOnEquip = true
-- Wether the player should be notified when they unequip a kevlar vest
ras.NotifyOnUnequip = true
-- Wether the player should be notified when an action can't be done because they already have a kevlar vest equipped
ras.NotifyAlreadyEquipped = true
-- Wether the player should be notified when an action can't be done because they don't have a kevlar vest equipped
ras.NotifyNothingEquipped = true

-- Initial kevlar vest durability (amount of armor given when equipping a brand new kevlar vest)
ras.InitialKevlarVestDurability = 100 -- TODO: NOT WORKING
-- Kevlar vest world model that should be used for the entity and to be drawn on the player
ras.KevlarVestModel = "models/weapons/thenextscp/vest_w.mdl" -- TODO: NOT WORKING
-- Kevlar vest equip sound
ras.KevlarVestEquipSound = "helmet_pickup.wav" -- TODO: NOT WORKING
-- Kevlar vest unequip sound
ras.KevlarVestUnequipSound = "helmet_pickup.wav" -- TODO: NOT WORKING

-- Usergroups allowed to access and modify the in-game settings
ras.InGameSettingsUsergroups = {"superadmin"}

--------------------------------[ LANGUAGE ]--------------------------------

ras.LanguageEquipMessage = "You have equipped a kevlar vest."
ras.LanguageUnequipMessage = "You have unequipped your kevlar vest."
ras.LanguageAlreadyEquippedMessage = "You already have a kevlar vest equipped."
ras.LanguageNothingEquippedMessage = "You don't have any kevlar vest equipped."

--[ @NoxTGM on all platforms ]--