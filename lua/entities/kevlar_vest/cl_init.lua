include("shared.lua")

---------------------------------[ FONTS ]----------------------------------

surface.CreateFont("KevlarVestFont", {
	font = "Rubik Light",
	extended = false,
	size = 30,
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

	cam.Start3D2D(pos, ang, 0.05)

		draw.RoundedBox(2, -40, -25, 25, 50, Color(25, 120, 120))
        draw.DrawText(self:GetNWInt("kevlarDurability") .. "/100", "KevlarVestFont", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER)

	cam.End3D2D()

end