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
MacroID=5de67209-09ec-4c23-9e0c-9c56bd71d0c4
Description=设置技能
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
Text = Plugin.File.ReadFileEx("D:\Work\Q6项目相关\Q6项目相关\Q6指令\被动技能.txt")
skillData = split(Text, "|")

i = 0
Do
	MoveTo 845, 370
	Delay 300
	LeftClick 1
	Delay 300
	
	SayString "$initskill " & skillData(2 * i) & "," & skillData(2 * i + 1)
	i = i + 1
	Delay 200
	
	MoveTo 910, 370
	Delay 300
	LeftClick 1
	Delay 300
	
Loop until (i >= (Ubound(skillData) / 2))
