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
MacroID=cb6d8a11-6c56-4b30-b3ba-f49a19527df1
Description=自动标记数值负责人
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=1
QUI=Form1
[Relative]
SetupOCXFile=
[Comment]

[UIPackage]
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


[Script]
//特别注意，前端更新的时候有可能会把meta文件一块更新下来，所以要执行下其他脚本先把meta文件处理掉先
//对比文件的数据路径定义
//前端lua文件 
Const CLIENT_INFO_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\client_info.txt"
Const CLIENT_MISSION_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\client_mission.txt"
Const CLIENT_OTHER_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\client_other.txt"
Const CLIENT_SKILL_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\client_skill.txt"
//后端.c文件
Const SERVER_DATA_FIGHT_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_fight.txt"
Const SERVER_DATA_FUBEN_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_fuben.txt"
Const SERVER_DATA_MISSIONNPCSTYLE_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_missionNpcstyle.txt"
Const SERVER_DATA_MISSIONS_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_missions.txt"
Const SERVER_DATA_ORG_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_org.txt"
Const SERVER_DATA_OTHER_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_other.txt"
Const SERVER_DATA_REWARD_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_reward.txt"
Const SERVER_DATA_SKILL_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_data_skill.txt"
Const SERVER_ITEM_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_item.txt"
Const SERVER_FIGHTD_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_fightd.txt"
Const SERVER_MODULE_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_module.txt"
Const SERVER_OTHER_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_other.txt"
const SERVER_D_FIGHTD_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\server_d_fightd.txt"
//数值表文件 
Const EXCEL_AI_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\数值表_AI表.txt"
Const EXCEL_RJ_MISSION_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\数值表_简洁任务.txt"
Const EXCEL_OTHER_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\数值表_其他.txt"
Const EXCEL_MISSION_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\数值表_任务.txt"
Const EXCEL_REWARD_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\数值表_物品奖励.txt"
Const EXCEL_GAMEDATA_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\数值表_游戏数值.txt"
//rpc文件
Const RPC_DATA_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据\rpc_data.txt"


//输出的excel表路径定义
Const WRITE_IN_EXCEL_PATH = "F:\QCshare\Q6\数值表测试\临时数据处理.xlsx"
//记录脚本执行过程的log文件的路径
Const OUTPUT_LOG_TXT_PATH = "F:\QCshare\Q6\数值表测试\Log.txt"

//excel表的分页数值定义
Const CLIENT_NEED_HANDLE_EXCLE_PAGE = 1
Const SERVER_NEED_HANDLE_EXCLE_PAGE = 2
Const EXCEL_NEED_HANDLE_EXCEL_PAGE = 3
Const RPC_NEED_HANDLE_EXCEL_PAGE = 4
Const CLIENT_HANDLE_COMPLETE_EXCLE_PAGE = 5
Const SERVER_HANDLE_COMPLETE_EXCLE_PAGE = 6
Const EXCEL_HANDLE_COMPLETE_EXCLE_PAGE = 7
Const RPC_HANDLE_COMPLETE_EXCLE_PAGE = 8


//需要处理的数据列定义
Const SERVER_NEED_HANDLE_EXCLE_LIST = 1
Const CLIENT_NEED_HANDLE_EXCLE_LIST = 1
Const EXCEL_NEED_HANDLE_EXCLE_LIST = 1
Const RPC_NEED_HANDLE_EXCLE_LIST = 1

//写入excel表的列定义
Const CLIENT_WRITE_TO_EXCEL_NAME_LIST = 3
Const CLIENT_WRITE_TO_EXCEL_LOG_LIST = 4
Const SERVER_WRITE_TO_EXCEL_NAME_LIST = 3
Const SERVER_WRITE_TO_EXCEL_LOG_LIST = 4
Const EXCEL_WRITE_TO_EXCEL_NAME_LIST = 3
Const EXCEL_WRITE_TO_EXCEL_LOG_LIST = 4
Const RPC_WRITE_TO_EXCEL_NAME_LIST = 3
Const RPC_WRITE_TO_EXCEL_LOG_LIST = 4


Call Plugin.Office.OpenXls(WRITE_IN_EXCEL_PATH)
//有log文件在的话先删掉
If (Plugin.File.IsFileExist(OUTPUT_LOG_TXT_PATH)) Then
    Call Plugin.File.DeleteFile(OUTPUT_LOG_TXT_PATH)
    Delay 500
End If


TracePrint "开始处理"
Call ClientHandleSub()
Call ServerHandleSub()
Call ExcelHandleSub()
//Call RpcHandleSub()


Sub RpcHandleSub()
	Dim nowExcelLine, needHandleStr, strPathFlag, personName
    nowExcelLine = 1
    Do
        needHandleStr = ReadFormExcel(RPC_NEED_HANDLE_EXCEL_PAGE, nowExcelLine, RPC_NEED_HANDLE_EXCLE_LIST)
        If (needHandleStr = "") Then 
            Exit Do
        End If
		
		strPathFlag = RPC_DATA_PATH
		
        personName = SearchPersonInFile(needHandleStr, strPathFlag)
        If personName = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "还未确定负责人，请处理: " & "协议文件第 " & nowExcelLine & " 行: " & needHandleStr)
        	
        Else 
            Call WriteInExcel(RPC_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, RPC_WRITE_TO_EXCEL_NAME_LIST, personName)'写入名字
            Call WriteInExcel(RPC_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, RPC_WRITE_TO_EXCEL_LOG_LIST, needHandleStr)'写入log内容
            If IsAlikeStrFromStart(needHandleStr, "Deleted:") Then 
                Call WriteInExcel(RPC_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, 2, "Delete")
            End If
        End If
		
        //没有对应的数据文件供查找，打印异常
        If strPathFlag = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "此文件找不到对应的数据文件供查找: " & "协议文件第 " & nowExcelLine & " 行: " & needHandleStr)
        End If
		
        nowExcelLine = nowExcelLine + 1
    Loop
    TracePrint "协议文件处理完成！"
    Delay 1000
End Sub

Sub ClientHandleSub()
	Dim nowExcelLine, needHandleStr, strPathFlag, personName
    nowExcelLine = 1
    Do
        strPathFlag = ""
        needHandleStr = ReadFormExcel(CLIENT_NEED_HANDLE_EXCLE_PAGE, nowExcelLine, CLIENT_NEED_HANDLE_EXCLE_LIST)
        If (needHandleStr = "") Then 
            Exit Do
        End If
		
        If IsAlikeStrFromLast(needHandleStr, "info\") Then 
            strPathFlag = CLIENT_INFO_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "mission\") Then 
            strPathFlag = CLIENT_MISSION_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "skill\") Then 
            strPathFlag = CLIENT_SKILL_PATH
        Else
            strPathFlag = CLIENT_OTHER_PATH
        End If
		
        personName = SearchPersonInFile(needHandleStr, strPathFlag)
        If personName = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "还未确定负责人，请处理: " & "客户端表第 " & nowExcelLine & " 行: " & needHandleStr)
        	
        Else 
            Call WriteInExcel(CLIENT_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, CLIENT_WRITE_TO_EXCEL_NAME_LIST, personName)'写入名字
            Call WriteInExcel(CLIENT_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, CLIENT_WRITE_TO_EXCEL_LOG_LIST, needHandleStr)'写入log内容
            If IsAlikeStrFromStart(needHandleStr, "Deleted:") Then 
                Call WriteInExcel(CLIENT_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, 1, "Delete")
            End If
        End If
		
        //没有对应的数据文件供查找，打印异常
        If strPathFlag = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "此文件找不到对应的数据文件供查找: " & "客户端表第 " & nowExcelLine & " 行: " & needHandleStr)
        End If
		
        nowExcelLine = nowExcelLine + 1
    Loop
    TracePrint "客户端处理完成！"
    Delay 1000
End Sub

Sub ServerHandleSub()
    //ps:子变量名不要跟下面有调用到的函数或子程内的变量名有一致，不然可能会出问题
    Dim nowExcelLine, needHandleStr, strPathFlag, personName
    nowExcelLine = 1
    Do
        strPathFlag = ""
        needHandleStr = ReadFormExcel(SERVER_NEED_HANDLE_EXCLE_PAGE, nowExcelLine, SERVER_NEED_HANDLE_EXCLE_LIST)
        If (needHandleStr = "") Then 
            Exit Do
        End If
		
        //先筛选一遍从哪个文件拿数据去对比，减少消耗
        If IsAlikeStrFromLast(needHandleStr, "data\fight\") Then 
            strPathFlag = SERVER_DATA_FIGHT_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "data\fuben\") Then 
            strPathFlag = SERVER_DATA_FUBEN_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "data\mission_npcstyle\") Then 
            strPathFlag = SERVER_DATA_MISSIONNPCSTYLE_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "data\missions\") Then 
            strPathFlag = SERVER_DATA_MISSIONS_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "data\org\") Then 
            strPathFlag = SERVER_DATA_ORG_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "data\reward\") Then 
            strPathFlag = SERVER_DATA_REWARD_PATH   
        ElseIf IsAlikeStrFromLast(needHandleStr, "data\skill\") Then 
            strPathFlag = SERVER_DATA_SKILL_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "item\") Then 
            strPathFlag = SERVER_ITEM_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "d\fightd\") Then 
            strPathFlag = SERVER_D_FIGHTD_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "g\fightd\") Then 
            strPathFlag = SERVER_FIGHTD_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "module\") Then 
            strPathFlag = SERVER_MODULE_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "data\") Then 
            strPathFlag = SERVER_DATA_OTHER_PATH
        Else
            strPathFlag = SERVER_OTHER_PATH
        End If
		
        //确定文件后再详细对比对应人，没有负责人则打印异常
        personName = SearchPersonInFile(needHandleStr, strPathFlag)
        If personName = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "还未确定负责人，请处理: " & "服务端表第 " & nowExcelLine & " 行: " & needHandleStr)
        Else 
            Call WriteInExcel(SERVER_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, SERVER_WRITE_TO_EXCEL_NAME_LIST, personName)'写入名字
            Call WriteInExcel(SERVER_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, SERVER_WRITE_TO_EXCEL_LOG_LIST, needHandleStr)'写入log内容
            If IsAlikeStrFromStart(needHandleStr, "Deleted:") Then 
                Call WriteInExcel(SERVER_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, 1, "Deleted")
            End If
        End If
		
        //没有对应的数据文件供查找，打印异常
        If strPathFlag = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "此文件找不到对应的数据文件供查找: " & "服务端表第 " & nowExcelLine & " 行: " & needHandleStr)
        End If
		
        nowExcelLine = nowExcelLine + 1
    Loop
    TracePrint "服务端处理完成！"
    Delay 1000
End Sub

Sub ExcelHandleSub()
	Dim nowExcelLine, needHandleStr, strPathFlag, personName
    nowExcelLine = 1
    Do
        strPathFlag = ""
        needHandleStr = ReadFormExcel(EXCEL_NEED_HANDLE_EXCEL_PAGE, nowExcelLine, EXCEL_NEED_HANDLE_EXCLE_LIST)
        If (needHandleStr = "") Then 
            Exit Do
        End If
		
        If IsAlikeStrFromLast(needHandleStr, "AI表\") Then 
            strPathFlag = EXCEL_AI_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "RJ简洁任务\") Then 
            strPathFlag = EXCEL_RJ_MISSION_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "W物品奖励表\") Then 
            strPathFlag = EXCEL_REWARD_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "R任务\") Then 
            strPathFlag = EXCEL_MISSION_PATH
        ElseIf IsAlikeStrFromLast(needHandleStr, "游戏数值\") Then 
            strPathFlag = EXCEL_GAMEDATA_PATH
        Else
            strPathFlag = EXCEL_OTHER_PATH
        End If
		
        personName = SearchPersonInFile(needHandleStr, strPathFlag)
        If personName = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "还未确定负责人，请处理: " & "数值表第 " & nowExcelLine & " 行: " & needHandleStr)
        	
        Else 
            Call WriteInExcel(EXCEL_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, EXCEL_WRITE_TO_EXCEL_NAME_LIST, personName)'写入名字
            Call WriteInExcel(EXCEL_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, EXCEL_WRITE_TO_EXCEL_LOG_LIST, needHandleStr)'写入log内容
            If IsAlikeStrFromStart(needHandleStr, "Deleted:") Then 
                Call WriteInExcel(EXCEL_HANDLE_COMPLETE_EXCLE_PAGE, nowExcelLine, 1, "Delete")
            End If
        End If
		
        //没有对应的数据文件供查找，打印异常
        If strPathFlag = "" Then 
            Call WriteInTxt(OUTPUT_LOG_TXT_PATH, "此文件找不到对应的数据文件供查找: " & "数值表第 " & nowExcelLine & " 行: " & needHandleStr)
        End If
		
        nowExcelLine = nowExcelLine + 1
    Loop
    TracePrint "数值表处理完成！"
    Delay 1000
End Sub


//从对应文件中找出负责人的名字，参数意义：前者为log数据，后者查询的文件路径
Function SearchPersonInFile(needSearchStr, searchFilePath)
    If not (Plugin.File.IsFileExist(searchFilePath)) Then 
        TracePrint searchFilePath & "---文件不见了，请查看是否被删除"
        SearchPersonInFile = ""
        Exit Function
    End If
	
	Dim dataInfo, dataInfoArr
    dataInfo = ReadFormTxt(searchFilePath)
    dataInfoArr = split(dataInfo, "|")
    For arri = 0 To (Ubound(dataInfoArr) / 2 - 1)
        If IsAlikeStrFromLast(needSearchStr, dataInfoArr(2 * arri + 1)) Then 
            SearchPersonInFile = dataInfoArr(2 * arri)
            Exit Function
        End If
    Next
	
    SearchPersonInFile = ""
End Function

//写入excel表，参数分别为，表分页，行，列，内容
Sub WriteInExcel(page, line, list, str)
    Call Plugin.Office.WriteXls(page, line, list, str)
End Sub

//读出excel表对应格子内容，参数为，表分页，行，列
Function ReadFormExcel(page, line, list)
    ReadFormExcel = Plugin.Office.ReadXls(page, line, list)
End Function

Sub WriteInTxt(filePath, wStr)
    Call Plugin.File.WriteFileEx(filePath, wStr)
End Sub

Function ReadFormTxt(filePath)
    ReadFormTxt = Plugin.File.ReadFileEx(filePath)
End Function

//从开始找是否有一样的字符串，有则返回1，没有返回0，参数为被查找的字符串，需要找到的字符串
Function IsAlikeStrFromStart(accpetSearchStr, Str)
    If InStr(accpetSearchStr, Str) Then 
        IsAlikeStrFromStart = 1
    Else 
        IsAlikeStrFromStart = 0
    End If
End Function

//从末尾找是否有一样的字符串，有则返回1，没有返回0，参数为被查找的字符串，需要找到的字符串
Function IsAlikeStrFromLast(accpetSearchStr, Str)
    If InStrRev(accpetSearchStr, Str) Then 
        IsAlikeStrFromLast = 1
    Else 
        IsAlikeStrFromLast = 0
    End If
End Function

//脚本停止事件，需要关闭excel表 
Sub OnScriptExit()
    Call Plugin.Office.CloseXls()
    MessageBox "脚本已停止"
End Sub




Event Form1.ClientHandle.Click
    //Call ClientHandleSub()
End Event

Event Form1.ServerHandle.Click
    //Call ServerHandleSub()
    MessageBox "bbb"
End Event

Event Form1.ExcelHandle.Click
    //Call ExcelHandleSub()
End Event
