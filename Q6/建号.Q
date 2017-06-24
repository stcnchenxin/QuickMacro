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
MacroID=f87fd7f3-633e-4888-8bfc-096ccb004677
Description=建号
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

'-------------------------   初始化区域   -----------------------------
//'游戏启动窗口
//Hwnd0 = Plugin.Window.Find("#32770", "Q6 Configuration")
//If (Hwnd0) Then
//    sRect = Plugin.Window.GetClientRect(Hwnd0)  
//    Dim clientCoordinates0
//    clientCoordinates0 = Split(sRect, "|")		'将游戏窗口左上角坐标作为游戏窗口的起始坐标
//    '将字符串转换为长整型(Long类型,对于坐标来说，参数只能是整型，所以需要转换)
//    cL0 = Clng(clientCoordinates0(0))
//    cT0 = Clng(clientCoordinates0(1))  
//    cR0 = Clng(clientCoordinates0(2))
//    cB0 = Clng(clientCoordinates0(3))
//End If
//

'对游戏窗口的处理 
Hwnd = Plugin.Window.Find("UnityWndClass", "game.q6")
If (Hwnd = 0) Then
    MessageBox "请先打开游戏！"
    EndScript 
End IF
sRect = Plugin.Window.GetClientRect(Hwnd)  
Dim clientCoordinates
clientCoordinates = Split(sRect, "|")		'将游戏窗口左上角坐标作为游戏窗口的起始坐标
'将字符串转换为长整型(Long类型,对于坐标来说，参数只能是整型，所以需要转换)
cL = Clng(clientCoordinates(0))
cT = Clng(clientCoordinates(1))  
cR = Clng(clientCoordinates(2))
cB = Clng(clientCoordinates(3))



Const accountAmount = 5


exePath = "F:\q6_client_pub\app\debug\win64\q6-v0.0.37.0\q6-v0.0.37.0\q6.exe"
'-------------------------   初始化区域   -----------------------------





'要关闭游戏再打开
Call gameMoveAndClick(780, -20, 1500)

For i = 0 To 4
//    For j = 1 To accountAmount
        Call Lib.API.运行程序(exePath)
        Delay 8000
        MoveTo 900, 640
        Delay 500
        LeftClick 1
        Delay 6000
        
        Call gameMoveAndClick(155, 220, 1000)	'换区
        //Call gameMoveAndClick(580, 190, 1000)'程满257
        
        //Call gameMoveAndClick(355, 260, 1000)'程满258
        
        Call gameMoveAndClick(580, 260, 1000)'程满259
        
        Call gameMoveAndClick(650, 445, 1000)'确定
        
        Call gameMoveAndClick(415, 255, 500)'账号输入框
        KeyDown 17, 1
        KeyPress 65, 1
        KeyUp 17, 1
        Delay 500
        
        SayString "rob" &  i       
        
        Call gameMoveAndClick(520, 370, 5000)	'登陆
        
        //Call gameMoveAndClick(menpaiCoordinates(i)(0), menpaiCoordinates(i)(1), 1000)'选门派
        
        //Call gameMoveAndClick(165, 485, 1500)	'切换性别
        
        Call gameMoveAndClick(400, 575, 1500)'输入名字
        KeyDown 17, 1
        KeyPress 65, 1
        KeyUp 17, 1
        Delay 500
        
        SayString "rob" & i
        Delay 1000
        
        Call gameMoveAndClick(740, 555, 10000)'创建角色并进入游戏
       
        Call gameMoveAndClick(780, -20, 3000)	'关闭游戏	
//    Next
Next 



Sub gameMoveAndClick(x, y, delayTimes)
    MoveTo cL + x, cT + y
    Delay 500
    LeftClick 1
    Delay delayTimes
End Sub


//
/*
Call gameMoveAndClick(30, 145, 3000)	'花果山
Call gameMoveAndClick(60, 215, 3000)	'昆仑山
Call gameMoveAndClick(75, 295, 3000)	'钦天监
Call gameMoveAndClick(60, 375, 3000)	'白骨领
Call gameMoveAndClick(130, 425, 3000)	'切换性别
Call gameMoveAndClick(400, 575, 3000)	'输入名字
Call gameMoveAndClick(740, 555, 3000)	'登陆
*/
