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
MacroID=e75136b0-9a7e-4c92-8180-00f305f6218d
Description=ǰ���ɸѡ
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
Const BUG_TEXT_0 = "C:\Users\chenxin\Desktop\bug������0.txt"
Const BUG_TEXT_1 = "C:\Users\chenxin\Desktop\bug������1.txt"

Call WriteBugPer()

Sub WriteBugPer()
    Dim clientPer, serverPer, plotPer, bugText, bugArr, i, writeInText
    clientPer = "����ΰ����Ң�������죬��չ�ȣ������ȣ����磬����ԣ���־�ģ����������ܺ�֣��������"
    serverPer = "������������ΰ���������Σ����ҿ����޺ƺ�, ���ٿ�"
    plotPer = "�»������ۣ���˸������ܣ��׷�����ά�У�����Ҧ������壬½�ܷ����ɣ��������������ٻ�����Ž���"
	
    If Plugin.File.IsFileExist(BUG_TEXT_1) Then 
        Call Plugin.File.DeleteFile(BUG_TEXT_1)
    End If

    bugText = Plugin.File.ReadFileEx(BUG_TEXT_0)
    bugArr = Split(bugText, "|")
    For i = 0 To (Ubound(bugArr) - 1)
        writeInText = ""
        If bugArr(i) = "" Then 
            writeInText = ""
        ElseIf InStr(clientPer, bugArr(i)) > 0 Then 
            writeInText = "ǰ��"
        ElseIf InStr(serverPer, bugArr(i)) > 0 Then 
            writeInText = "���"
        ElseIf InStr(plotPer, bugArr(i)) > 0 Then 
            writeInText = "�߻�"
        End If
        Call Plugin.File.WriteFileEx(BUG_TEXT_1, writeInText)

    Next
	
End Sub
