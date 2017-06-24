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
Description=Ç°ºó¶ËÉ¸Ñ¡
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
Const BUG_TEXT_0 = "C:\Users\chenxin\Desktop\bug¸ºÔðÈË0.txt"
Const BUG_TEXT_1 = "C:\Users\chenxin\Desktop\bug¸ºÔðÈË1.txt"

Call WriteBugPer()

Sub WriteBugPer()
    Dim clientPer, serverPer, plotPer, bugText, bugArr, i, writeInText
    clientPer = "ÐìÎÄÎ°£¬»ÆÒ¢£¬³ÂÒËÐì£¬ÀîÕ¹îÈ£¬ÁÖÏþîÈ£¬ÁõÜç£¬ÁõÐñ»Ô£¬ÁÖÖ¾ÎÄ£¬Ñî³©´ï£¬ÑîÐý£¬ÖÜº£Ö££¬ÖÓÃú¿µ"
    serverPer = "³Âî££¬Àî³ÌÂú£¬»ÆÎ°³¬£¬ÁºÈóöÎ£¬ÁºÖÒ¿­£¬ÂÞºÆºã, ÁºÖÙ¿­"
    plotPer = "³Â»ª£¬Áõ³Û£¬»ÆË¸£¬»ÆÕñ½Ü£¬¿×·±±ó£¬ÀîÎ¬ÚÐ£¬Àî×ÚÒ¦£¬ÁõÓî·å£¬Â½½Ü·ò£¬Êæºé·É£¬Ò×Á¢£¬ÎäÖÅÓî£¬ÔøÙ»âù£¬ÕÅ½ðÓî"
	
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
            writeInText = "Ç°¶Ë"
        ElseIf InStr(serverPer, bugArr(i)) > 0 Then 
            writeInText = "ºó¶Ë"
        ElseIf InStr(plotPer, bugArr(i)) > 0 Then 
            writeInText = "²ß»®"
        End If
        Call Plugin.File.WriteFileEx(BUG_TEXT_1, writeInText)

    Next
	
End Sub
