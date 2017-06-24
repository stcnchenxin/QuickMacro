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
MacroID=52956366-c2de-4e55-9fa8-040c17f2c24c
Description=¼ÓËùÓÐ»ï°éËéÆ¬
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
//PartnerChip = 1001
Text = Plugin.File.ReadFileEx("C:\Q6Ö¸Áî\»ï°éËéÆ¬.txt")
text1 = Split(Text, "|")



Do 

    MoveTo 866, 372
    Delay 500
    LeftClick 1
    Delay 1000
    KeyDown 17, 1
    KeyPress 65, 1
    KeyUp 17, 1

    Delay 300
    KeyPress "BackSpace", 1
    Delay 500
    //SayString "$eval return ""module/partner/main""->AddPartnerChip(selfobj, " & PartnerChip & ",10)"
    SayString "$add_chip " & text1(i) & ",10"
    //MessageBox "$eval return ""module/partner/main""->AddPartnerChip(selfobj, " & PartnerChip & ",500)"
    Delay 1000

    MoveTo 993, 373
    Delay 500
    LeftClick 1
    Delay 800


	i = i + 1
// //   MessageBox PartnerChip
//    If PartnerChip = 1010 or PartnerChip = 2010 Then 
//        PartnerChip = PartnerChip + 990
//    End If
//    PartnerChip = PartnerChip + 1
loop until (i >= Ubound(text1))
