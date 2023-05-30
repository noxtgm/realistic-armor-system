--------------------------------[ FRAME ]-----------------------------------

local frame = vgui.Create("DFrame")
frame:SetSize(1200, 720)
frame:SetVisible(true)
frame:Center()
frame:MakePopup()
frame.Paint = function(s, w, h)

    draw.RoundedBox(5, 0, 0, w, h, Color(110, 221, 255))
    draw.RoundedBox(5, 7, 7, w - 14, h - 14, Color(151, 231, 255))
    draw.RoundedBox(5, 0, 0, w / 7, h, Color(110, 221, 255))

end

-------------------------------[ BUTTONS ]----------------------------------

local button = vgui.Create("DButton", frame)
button:SetPos(10, 35)
button:SetSize(110, 30)
button:SetText("Unequip Kevlar Vest")
button.DoClick = function()

    net.Start("dropKevlarVest")
    net.SendToServer()

end
button.Paint = function(s, w, h)

    draw.RoundedBox(0, 0, 0, w, h, Color(151, 231, 255))

end

--[ @NoxTGM on all platforms ]--