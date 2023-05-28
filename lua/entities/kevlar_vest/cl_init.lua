include("shared.lua")

---------------------------------[ FONTS ]----------------------------------

surface.CreateFont("KevlarVestFont", {
	font = "Rubik Light",
	extended = false,
	size = 15,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

-------------------------------[ FUNCTIONS ]--------------------------------

function ENT:Draw()

    self:DrawModel()

	local ang = self:GetAngles()
	ang:RotateAroundAxis(self:GetAngles():Right(), -90)

	local pos = self:GetPos()

	cam.Start3D2D(pos, ang, 1)

		draw.RoundedBox(2, 0, 0, 100, 25, Color(255, 120, 120))
		draw.RoundedBox(2, 0, 0, 50, 25, Color(25, 120, 120))
        draw.DrawText(eyetrace.Entity:GetNWInt("kevlarDurability") .. "/100", "KevlarVestFont", ScrW() / 2, ScrH() / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER)

	cam.End3D2D()

end

---------------------------------[ HOOKS ]----------------------------------

hook.Add("HUDPaint", "kevlarVest_HUDPaint", function()

    local eyetrace = LocalPlayer():GetEyeTrace()

    if eyetrace.Entity:GetClass() == "kevlar_vest" then
        draw.DrawText(eyetrace.Entity:GetNWInt("kevlarDurability") .. "/100", "KevlarVestFont", ScrW() / 2, ScrH() / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER)
    end

end)