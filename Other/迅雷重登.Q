[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=2
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=2
RunOnce=1
EnableWindow=
MacroID=2b9410e1-c059-40d4-9eb4-41cb4d31cd00
Description=迅雷重登
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=10
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Attachment]
UEsDBBQAAgAIAKIdm0dysYVUOwQAAE4IAAAMABEA16Ky4dXLusUuYm1wVVQNAAfdXn9W3V5/Vt1ef1bNlE1s22QYx82NE+cWiStMGzsgIQTaWhAHQIK1TSvGhJDGxk5DQuIAt2oFKsI6pLVdq7azvbVqEeWCJk3QrVm/lqT5cBMnjRO/Tho7H3McO12X+iN2bjyNi2e11eDAAev/Wr/3eZ/3//5tOXn3TNfzWOt6A8YxGK/BeAHGc1hbq962v+6+mrWt/5uwppLLLd7f9X1aE1KUt4/qbz8smXxVWF406Ct8YoMaeBNdfelR8MrOwlc8vUL/eIr+/lh94aOmkgQrXckx5Iwe6QOWOKY084XJzwGDGlLOfBS12ZaQiFMDb8UHXkwMndz0ntxZONuUY1CHTNlcJFS5+XZTegBsqyZkudHepjBtTy0lm6ci0u33LGlFq6IUPiGteHKTl6z8FCyh9UCN7GwqIejUlSxDTuuRXmCF5+JDPdzw6+r6N48LsU2yX/7lVFPyO6e4tV1gucnLVu4GMGbJSM5n0I1PzNwYsC2FR2i01+JvOZWawHLj583cuCYjhrz1JNybnp3R1s9ZcgaFgwrZaclBaLNXtXCvY/KYwbn5wc3RvtqdD6yK35K5I6XJHDs7bdBfAmNWNaOKGQYf1oJnrSoDU5ACKUc9Vp60p6C6mMnc9Br0Za2aYUhSDXvY+3/u/P6+VY2isH8vU9UPUCE7k+QQ/fPL/PArSnoeTIw8mbl7pzp32hKXbStwoEny8BdC97ergR7IgJlS2pDSWd8fTxY+k7coyus50Iq87eYWoVbSDDGlhj9WJQBCDXlQYFW5/Y4p+VHooUx0mtJDAJHoZIgh8YEH0sibBNxrKYIdu2ikB+EgWw0pnQ+sVmY/NMuLTtEtzBSZw5KzDBrxmFnCqagisxcl6HEABddkosMU19wgEh0McVX0eQ4/G6hCnKCJ60f+jNyvADKldvgE+vXa7uoFU4zBFCRnU2ikx8zi9lQVUzSB/6MXCq7+nakHtssJ3G3y74U1ykk0d3373ueNwhqwLRklwa6BppzKbjmZwqd2Az0OoMCyjHc0ystuEPGOFO4VF1uZ4lNw36ZG9MxvjXLiGeZuf2DIRNsyyjQbWKL6Txz+9OqB7nqZTuGTboDmKn7aKC+5wdkOr02OT7Ij3aXVn9DYuXrga6McMcpxOKWKaMrbfeQ3DrbQgOnFmFakRdqfwy9pzLBejIOqGYobv6gmfzBKcaNEg+qlVhR/twOsvxWltOSAuw0YzoZMBppUEJUmv93xnTeKIXfddj7gD4xpAiWmQln8Qj36nVaI6MWN3WKM892tzJ/R+HuQ2Fa9GKPxiacP5O9i/T6q/7hdkfDjetFnt8E/KqwCS2yMHe7S2Qng7a2NrflBdfOaXae8Xa2NbQff097GDUzLRyCWxkd1IWqDxtv3vYouUP+RjnKDIwotKDiCShRT82FdCGt8ROcBIiBNeMr7FT7iLLVW92FfB6ZHig8/sxjdV8sK+wtQSwECFwsUAAIACACiHZtHcrGFVDsEAABOCAAADAAJAAAAAAAAACAAgIEAAAAA16Ky4dXLusUuYm1wVVQFAAfdXn9WUEsFBgAAAAABAAEAQwAAAHYEAAAAAA==


[Script]
accountNumber = "724015859:1"
passWord = "5591559"
Delay 1000
a = 0
For 24
    MoveTo 300, 80
    Delay 1000
    LeftClick 1
    Delay 1000
    LeftClick 1
    Delay 1000
    LeftClick 1
    Delay 1000
    MoveTo 552, 156
    Delay 1000
    LeftClick 1
    Delay 1000
    LeftClick 1

	If a = 10 or a = 22 Then 
		MoveTo 582, 155
		Delay 1000
		LeftClick 1
	End If
	
	
	
    FindPic 610,310,1000,590,"Attachment:\注册账号.bmp",0.9,intX,intY
    If intX > 0 And intY > 0 Then 
        TracePrint "账号被踢下线时间------" & Time
        Call 移动点击(890, 455)	'输入账号
        Call 全选()
        //Call 删除(15)
        Delay 500
        SayString accountNumber
        Delay 500
        LeftClick 1
        Delay 1000
    
        Call 移动点击(890, 490)'输入密码
        Call 全选()
        //Call 删除(15)
        Delay 500
        SayString passWord
        Delay 1000
    
        Call 移动点击(955, 560) '登陆
    End If
    Delay 300 * 1000
    a = a + 1
Next 

Sub 移动点击(x, y)
    MoveTo x, y
    Delay 500
    LeftClick 1
    Delay 1000
End Sub

Sub 全选()
    KeyDown 17, 1
    KeyPress 65, 1
    KeyUp 17, 1
End Sub

Sub 删除(x)
    For x
        KeyPress "BackSpace", 1
        Delay 30
    Next
End Sub
