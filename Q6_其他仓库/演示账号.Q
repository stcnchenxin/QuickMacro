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
MacroID=eea5957d-d0d9-42ea-894e-9e0a4a70d6e9
Description=生成指令
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

Call 输入指令("战斗测试")


Sub 输入指令(orderText)	
    Text = Plugin.File.ReadFileEx("C:\Q6指令\" & orderText & ".txt")
    text1 = Split(Text, "|")
   
   //MessageBox Text
    Do
        MoveTo 910,370 
        Delay 500
        LeftClick 1
        Delay 500

	
        If text1(i) = "" Then 
            Exit Do
        Else 
            SayString text1(i)
        End If
    
        Delay 1000
        MoveTo 995,370
        Delay 500
        LeftClick 1
        Delay 100

    
        i = i + 1
    Loop Until (i > Ubound(text1))
End sub
