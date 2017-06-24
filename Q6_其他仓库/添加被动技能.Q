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
MacroID=5b18ab01-4141-494b-be76-cb7218e5bd73
Description=添加被动技能
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
Text = Plugin.File.ReadFileEx("C:\Q6指令\被动技能.txt")
text1 = Split(Text, "|")

i = 0
Do 

    MoveTo 866, 372
    Delay 300
    LeftClick 1
    Delay 500


    SayString "$initskill " & text1(2 * i) & "," & text1(2 * i + 1)
	
    Delay 800

    MoveTo 993, 373
    Delay 300
    LeftClick 1
    Delay 800
	i = i + 1
loop until (i >= Ubound(text1) / 2)
