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
MacroID=57c1d100-0c32-43b2-9a04-2257d5b8c0f7
Description=Q6游戏脚本
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
'分辨率为800*600
'************************初始化区域************************* 
'常量定义
'指令的路径定义
Const ORDER_BD_JINENG_PATH = "C:\Q6自动测试数据\数据导出文件夹\指令\被动技能.txt"
Const ORDER_HUOBAN_SUIPIAN_PATH = "C:\Q6自动测试数据\数据导出文件夹\指令\伙伴碎片.txt"
Const ORDER_YANSHI_ZHANGHAO_PATH = "C:\Q6自动测试数据\数据导出文件夹\指令\演示账号.txt"
Const ORDER_ZAOXING_LIEBIAO_PATH = "C:\Q6自动测试数据\数据导出文件夹\指令\造型列表.txt"
Const ORDER_ZHANDOU_CESHI_PATH = "C:\Q6自动测试数据\数据导出文件夹\指令\战斗测试.txt"
'客户端路径
Const EXT_PATH = "F:\q6_client_pub\app\debug\win64\q6-v0.0.124.0\q6.exe"
'坐标脚本路径
Const COORDINATES_FOLDER_PATH = "C:\Q6自动测试数据\数据导出文件夹\坐标"

'句柄操作
Hwnd = Plugin.Window.Find("UnityWndClass", "game.q6")
If (Hwnd = 0) Then
    MessageBox "请先打开游戏！"
    EndScript 
End IF
sRect = Plugin.Window.GetClientRect(Hwnd)  
Dim clientCoordinates	
clientCoordinates = Split(sRect, "|")		'将游戏窗口左上角坐标作为游戏窗口的起始坐标
'将字符串转换为长整型(Long类型,对于坐标来说，参数只能是整型，所以需要转换)
gL = Clng(clientCoordinates(0))
gT = Clng(clientCoordinates(1))  
gR = Clng(clientCoordinates(2))
gB = Clng(clientCoordinates(3))
'************************初始化区域*************************




'************************* 运行区域 ***************************
//Call InputOrderFormTxt( ORDER_ZAOXING_LIEBIAO_PATH )'造型测试
//Call InputOrderFormTxt("C:\Q6自动测试数据\数据导出文件夹\指令\测试指令.txt", "$ni BS10001 ,20")

'特别注意一下：子程中的变量定义如果只想在子程范围内起效，变量的定义要用Dim的形式初始化，不然该变量的起效范围会是整个脚本范围
'如：一个子程 A() 定义了变量i，这个子程调用了另一个子程 B() 里也有变量i，如果 B() 里i的值被改变了，则 A() 里的i也会被修改
//menpaiArr = Array("钦天监", "白骨岭", "花果山", "昆仑山")
//
//For iCount = 0 To 9
//	TracePrint menpaiArr(iCount mod 4)
//	Call CloseGame()
//   	Call CreateAccount("二区", "三服", "cxbz1" & iCount, menpaiArr(iCount mod 4))
//   	Delay 4000
//   	KeyPress "F1", 1
//	Delay 3000
//	Call InputOrder("$addExp char,exp,1000000")
//	Call InputOrder("$add_cash 10000000")
//	Delay 1000
//Next 



'指令：输入系统消息
/*
For i = 0 To 100
	Call InputOrder("$eval return ""module/chat/main""->SystemSay(""aaaaaaaa" & i &"""" & ", 0)")
Next
*/



'战斗测试
//Call InputOrderFormTxt("C:\Q6自动测试数据\数据导出文件夹\指令\所有战斗.txt", "$bf summon_activity,4")

/*
Dim sceneIds, sceneIdArr, scenei
sceneIds = GetTxtString("C:\Q6自动测试数据\数据导出文件夹\指令\场景编号.txt")
sceneIdArr = Split(sceneIds, "|")
//TracePrint sceneIdArr(scenei)
For scenei = 0 To (Ubound(sceneIdArr) - 1)
	Call InputOrder(sceneIdArr(scenei))
	Delay 3000
	Call InputOrder("$bf wabao,1")
Next
*/


'创建账号并申请加入对应的帮派
/*
Dim menpaiArr
menpaiArr = Array("钦天监", "白骨岭", "花果山", "昆仑山")
Dim iCount
For iCount = 2 To 10
	//TracePrint menpaiArr(iCount mod 4)
	Call CloseGame()
   	Call CreateAccount("推荐区", "三服", "bz00" & iCount, menpaiArr((iCount + 2) mod 4))
   	KeyPress "F1", 1
	Delay 500
	Call ClearMission()
	Call BasicSetting()
	Call ApplyJoinOrg("帮战001")
	Delay 1000
Next 
*/



'场景跳转
/*
Dim sceneArr
sceneArr = Array("1001,236,270",	"1002,491,284",	"1003,169,227",	"1004,299,241",	"1005,141,90",	"1006,379,242",	"1007,70,104",	"1008,273,210",	"1009,363,324",	"1010,221,371",	"1011,295,425",	"1012,311,358",	"1013,286,344",	"1014,387,356",	"1015,272,320",	"1018,192,225")
For each abc in sceneArr
	Call InputOrder("$goto " & abc)
	Delay 5000
Next 
*/



'奖励测试
/*
Dim rewardArr
rewardArr = Split(ReadFormTxt("C:\Q6自动测试数据\奖励测试\奖励.txt"), "|")
For Each reward In rewardArr
	Call InputOrder("$eval " & Chr(34) & "module/reward/main" & Chr(34) & "->Reward(selfobj, " & Chr(34) & reward & Chr(34) &",{})")
Next
*/


'丝绸之路物品获取
Dim itemArr
itemArr = Split(ReadFormTxt("C:\Q6自动测试数据\丝绸之路\丝绸之路.txt"), "|")
For Each item In itemArr
	Call InputOrder("$ni " & item & ", 3")
Next


'************************** 运行区域 **************************



'**************************函数声明区域*******************************
'子程
'关闭游戏
Sub CloseGame()
    Call GameClickByConfig("登陆", "关闭游戏", 0, 0)	
End Sub
 
'建号，参数分别为，区，服务器位置，账号，角色
Sub CreateAccount(serverArea, iServer, account, role)
        Call Lib.API.运行程序(EXT_PATH)
        Delay 8000        
        Call GameClickByConfig("登陆", "点击Play", 0, 0)
        Call GameClickByConfig("登陆", serverArea, 0, 0) '换区
        Call GameClickByConfig("登陆", iServer, 0, 0)	'换服
        Call GameClickByConfig("登陆", "选服确定", 0, 0) 
        Call GameClickByConfig("登陆", "账号输入框", 0, 0)
        
        Call CheckAllText()
        
        SayString account	'账号
        Call GameClickByConfig("登陆", "输入账号确定", 0, 0)           
        Call GameClickByConfig("登陆", GetCreateRoleLocation(role), 0, 0)
        'Call GameClickByConfig("登陆", "创号性别", 0, 0)
        Call GameClickByConfig("登陆", "创号起名", 0, 0)
        Call CheckAllText()
        SayString account	'角色名
        
        Call GameClickByConfig("登陆", "创号建角", 0, 0)'创建角色并进入游戏     
End Sub

'清除任务
Sub ClearMission()
	Call InputOrder("$cm")
End Sub

'一些基础的角色数值设置
Sub BasicSetting()
	Call InputOrder("$addExp char,exp,1000000")
	Call GameClickByConfig("签到", "签到按钮", 0, 0)
	Call GameClickByConfig("签到", "签到关闭", 0, 0)
	Call InputOrder("$add_cash 10000000")
	Call GameClickByConfig("指令", "指令界面关闭", 0, 0)
End Sub

'搜索帮派
Sub SearchOrg(orgName)
	Call GameClickByConfig("主界面", "社交按钮", 0, 0)
	Call GameClickByConfig("主界面", "帮派按钮", 0, 0)
	Call GameClickByConfig("帮派", "申请帮派", 0, 0)
	Call GameClickByConfig("帮派", "帮派搜索框", 0, 0)
	SayString orgName
	Delay 500
	Call GameClickByConfig("帮派", "帮派搜索确认", 0, 0)
End Sub

'搜索帮派后申请加入对应帮派
Sub ApplyJoinOrg(orgName)
	Call SearchOrg(orgName)
	Call GameClickByConfig("帮派", "第一个帮派", 0, 0)
	Call GameClickByConfig("帮派", "申请入帮", 0, 0)
End Sub

'获取希望创建的角色门派的位置
Function GetCreateRoleLocation(roleName)
    Select Case roleName
    Case "花果山"
        GetCreateRoleLocation = "创号选角一"
    Case "昆仑山"
        GetCreateRoleLocation = "创号选角二"
    Case "钦天监"
        GetCreateRoleLocation = "创号选角三"
    Case "白骨岭"
        GetCreateRoleLocation = "创号选角四"
    Case Else
        TracePrint "没有这个门派：【" & roleName & "】，请重新检查"
        EndScript
    End Select	
End Function

'全选有文本的内容
Sub CheckAllText()
    LeftClick 1
    Delay 300
    KeyDown 17, 1
    KeyPress 65, 1
    KeyUp 17, 1
    Delay 500
End Sub

'根据传进来的系统和作用点击坐标，systemName为系统名，forDoWhat为作用，moveDelay为移动后的颜色，clickDealy为点击后的延时，调用函数时2者默认填0，函数会根据表去确定延时，也可以随时更改
Sub GameClickByConfig(systemName, forDoWhat, moveDelay, clickDealy)
    Dim coords, coordArr 
    coords = GetCoordinates(systemName, forDoWhat)
    If coords = "" Then 
        TracePrint "没有对应的按钮配置信息: systemName = " & systemName & " ,  forDoWhat = " & forDoWhat
        EndScript
    End If
    
    coordArr = Split(coords, "|")
    
    '如果延时传0，则替换表内的默认延时
    If moveDelay = 0 Then 
        moveDelay = coordArr(2)
    End If
    If clickDealy = 0 Then 
        clickDealy = coordArr(3)
    End If
    Call GameMoveAndClick(coordArr(0), coordArr(1), moveDelay, clickDealy)
End Sub

'获取对应系统和作用按钮的x，y坐标，移动延时，点击延时（返回以"|"连接的字符串），无则返回空字符串，systemName为系统名，forDoWhat为作用
Function GetCoordinates(systemName, forDoWhat)
    Dim text, textArr
    text = GetTxtString(COORDINATES_FOLDER_PATH & "\" & systemName & ".txt")
    textArr = Split(text, "|")
    Dim i
    For i = 0 To UBound(textArr) - 1 Step 5
        If forDoWhat = textArr(i + 4) Then 
            GetCoordinates = textArr(i) & "|" & textArr(i + 1) & "|" & textArr(i + 2) & "|" & textArr(i + 3)
            Exit Function
        End If
    Next
    GetCoordinates = ""
End Function


'循环输入指令，会读取目标路径txt文件的数据依次输入进行测试,参数为指令文件路径，必须为txt文本, orderStarKwd为开始读取的文本内容
Sub InputOrderFormTxt(orderPath, orderStarKwd)
	Dim tempText, orderArr
    tempText = GetTxtString(orderPath)
    If tempText = "" Then 
    	MessageBox "Sub [InputOrderFormTxt(orderPath, orderStarKwd)] error: 读取的文本错误或文本内没有内容"
    	EndScript
    End If
    orderArr = Split(tempText, "|")
    Dim i, starIndex
    For i = 0 To ( Ubound( orderArr ))
        If orderArr(i) = orderStarKwd Then 
        	starIndex = i
        	Exit For
        End If
    Next

    If i >= UBound(orderArr) Then 
    	TracePrint "无效的起始指令，请重新输入！"
    	ExitScript 
    Else 
    	For i = starIndex To (Ubound(orderArr) - 1)
    		InputOrder(orderArr(i))
    	Next
    End If
End Sub


'输入指令并点击确定，参数为指令内容
Sub InputOrder( orderContent )
    KeyPress "F1", 1
	Delay 500
	Call GameClickByConfig("指令", "指令输入框", 0, 0)
    Call InputString(orderContent)
    Call GameClickByConfig("指令", "指令确认", 0, 0)
    If inStr(orderContent, "$bf") > 0 Then 
    	Delay 6000
    	Call BeginFight(1)
    End If
End Sub

'自动战斗，参数为类型，-1为负，0为正常战斗，1为获胜
Sub BeginFight(fightParam)
	Select Case fightParam
		Case -1 
			Delay 500
			Call InputOrder("$halt 1")
			Delay 6000
		Case 0
			Call AutoFight()
		Case 1
			Delay 500
			Call InputOrder("$halt")
			Delay 6000
	End Select
End Sub

Sub AutoFight()
	
End Sub

'相对于游戏窗口坐标进行点击，参数分别为游戏窗口x轴坐标，y轴坐标，点击后的延时
Sub GameMoveAndClick( x, y, moveDelay, clickDelay )
    MoveTo gL + x, gT + y
    Delay moveDelay
    LeftClick 1
    Delay clickDelay
End Sub

'输入文本，参数为文本内容
Sub InputString(str)
	Call CheckAllText()
    SayString str
    Delay 300
End Sub

'函数 
'获取txt文本内容返回函数调用处，参数为txt文本路径
Function GetTxtString( strPath )
    GetTxtString = Plugin.File.ReadFileEx( strPath )
End Function


Sub WriteInTxt(filePath, wStr)
    Call Plugin.File.WriteFileEx(filePath, wStr)
End Sub

Function ReadFormTxt(filePath)
    ReadFormTxt = Plugin.File.ReadFileEx(filePath)
End Function


'**************************函数声明区域*******************************