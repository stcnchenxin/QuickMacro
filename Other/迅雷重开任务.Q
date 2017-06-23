[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=c8ef188c-deb6-40be-a943-85a918c4e8bd
Description=下载专用
Enable=1
AutoRun=0
[Repeat]
Type=1
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]

Call 迅雷()


//-------------------------子程区----------------------
'百度云
Sub 百度云()
    Do
        MoveTo 1026, 262
        Delay 2000
        LeftClick 1
        Delay 10000
    
        LeftClick 1
        Delay 20 * 60 * 1000
    Loop
End Sub


'迅雷
Sub 迅雷()
    Do 
        MoveTo 805,240
        Delay 1000
        LeftClick 1
        Delay 10 * 1000

        MoveTo 775,240
        Delay 1000
        LeftClick 1
        Delay 20 * 60 * 1000
    Loop
End Sub


'天谕
Sub 天谕()
    Do 
        MoveTo 960, 513
        Delay 1000
        LeftClick 1
        Delay 10 * 1000

        MoveTo 960, 513
        Delay 1000
        LeftClick 1
        Delay 30 * 60 * 1000
    Loop
End Sub
//-------------------------子程区----------------------
