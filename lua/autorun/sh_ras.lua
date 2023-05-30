if SERVER then

	AddCSLuaFile("sh_config.lua")
	AddCSLuaFile("client/cl_functions.lua")
	AddCSLuaFile("client/cl_menu.lua")

	include("server/sv_functions.lua")

elseif CLIENT then

	include("sh_config.lua")
	include("client/cl_functions.lua")
	include("client/cl_menu.lua")

end

--[ @NoxTGM on all platforms ]--