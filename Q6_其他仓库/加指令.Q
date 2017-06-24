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
MacroID=cbf7c759-6bba-4dce-8e23-ba568d882ab6
Description=º”÷∏¡Ó
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Const pointX = 426
Const pointY = 377
BSnumber = 1


Do 
	MoveTo pointX, pointY
	Delay 200
	LeftClick 1
	Delay 300

    If BSnumber < 10 Then
        SayString "$ni BS5000" & BSnumber & ", 1"
    Else 
        SayString "$ni BS500" & BSnumber & ", 1"
    End If
    Delay 500
    KeyPress "Enter", 1
	Delay 200
    
    BSnumber = BSnumber + 1
Loop until BSnumber > 13

