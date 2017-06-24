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
MacroID=fa577f1a-67a2-4f8e-93e1-445eaf0cf57c
Description=讲解用
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
Hwnd = Plugin.Window.Find("UnityWndClass", "game.q6")
sRect = Plugin.Window.GetClientRect(Hwnd)
MessageBox sRect
Dim MyArray
MyArray = Split(sRect, "|")  '分割函数，将第一个参数（字符串）分割成数组储存，标识为第2个参数
L = Clng(MyArray(0))
T = Clng(MyArray(1))  
R = Clng(MyArray(2))
B = Clng(MyArray(3))
Delay 200








For i = 0 To 2

Call GameClick(570, 190, 1000)
Call GameClick(655, 445, 1000)
SayString "123" & i	'字符串可以通过 & 连接
//KeyPress "Num 1", 1
//KeyPress "2", 1

Next

Function GetTxtString(strPath)
	GetTxtString = Plugin.File.ReadFileEx(strPath)	'注意，调用插件函数要有插件的对象等信息
End Function

Sub WriteToTxt(strPath, writeInStr)
	Call Plugin.File.WriteFileEx(strPath, writeInStr)	'如果调用的插件函数没有返回值，则前面要加Call
End Sub

Function IsHasPic(x1, y1, x2, y2, picName, picSim)
    FindPic x1, y1, x2, y2, picName, picSim ,intX,intY
    If intX > 0 And intY > 0 Then 
        IsHasPic = 1'返回的函数值格式为：函数名 = 函数值
        Exit Function 'Exit可以退出函数、子程、循环等
    Else 
        IsHasPic = 0
    End If
End Function




Sub GameClick(x, y, delayTimes)
    MoveTo L + x, T + y
    Delay delayTimes
    LeftClick 1
    Delay 300
End Sub
