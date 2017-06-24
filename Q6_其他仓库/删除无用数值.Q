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
MacroID=856b9053-6092-4b45-84a0-bac1f80c5e9a
Description=删除无用数值
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
//Call DeleteExcelGibber()
Call DeleteClientGibber()



Sub DeleteClientGibber()
    //常量定义 
    Const NEED_HANDLE_EXCEL_PATH = "F:\QCshare\Q6\数值表测试\前端无用数值处理.xlsx"
    Const DELETE_SPEECH_1 = ".meta"
    Const DELETE_SPEECH_2 = "ai\"
    Const REPLACE_WORD = ""
	
    Call Plugin.Office.OpenXls(NEED_HANDLE_EXCEL_PATH)
    i = 1
    comStr = ""
    Do
        comStr = Plugin.Office.ReadXls(1, i, 1)
        If (InStrRev(comStr, DELETE_SPEECH_1)) Or (InStrRev(comStr, DELETE_SPEECH_2))Then 
            Call Plugin.Office.WriteXls(1, i, 1, REPLACE_WORD)
        End If
	
        i = i + 1
    
        If (i mod 100) = 0 Then 
            TracePrint "第" & i & "行"
        End If
	
    Loop Until (comStr = "")
    
    Call Plugin.Office.CloseXls()
End Sub 

Sub DeleteExcelGibber()
    //常量定义 
    Const NEED_HANDLE_EXCEL_PATH = "F:\QCshare\Q6\数值表测试\数值表无用数据处理.xlsx"
    searchStr = Array("AIDir", "block", "data\", "R任务\参考资料", "tool\", "Q1参考：宝盒幻境")
    Const REPLACE_WORD = ""
	
    Call Plugin.Office.OpenXls(NEED_HANDLE_EXCEL_PATH)
    i = 1
    comStr = ""
    Do
        comStr = Plugin.Office.ReadXls(1, i, 1)
        For j = 0 To UBound(searchStr)
            If (InStrRev(comStr, searchStr(j))) Then 
                Call Plugin.Office.WriteXls(1, i, 1, REPLACE_WORD)
            End If
        Next
	
        i = i + 1
    
        If (i mod 100) = 0 Then 
            TracePrint "第" & i & "行"
        End If
	
    Loop Until (comStr = "")
    
    Call Plugin.Office.CloseXls()
End Sub 

Sub OnScriptExit()
    Call Plugin.Office.CloseXls()
    TracePrint "脚本停止运行"
End Sub
//
//Dim filesArr
//filesArr = GetFolderList("E:\按键学习\TEST")
//TracePrint filesArr
//
//

//Function ShowFilePathList(folderspec)
//
//    Dim fso, f, f1, fc, s
//    Set fso = CreateObject("Scripting.FileSystemObject")
//    Set f = fso.GetFolder(folderspec)
//    Set fc = f.Files
//    '此处f1只是临时变量，它只能跟in 后面的对象一致，在运行时，依次返回fc的每一个数据
// 
// 	'特别注意folder跟file一个是文件夹，一个文件
// 
//    For Each f1 in fc
//        s = s & f1.Path 
//        TracePrint f1.name & "1"
//        s = s &  "<BR>"
//    Next
//
//    ShowFileList = s
//
//End Function
//
//Function GetFolderList(folderspec)
//	Dim fso, f, f1, fc, s
//	Set fso = CreateObject("Scripting.FileSystemObject")
//	s = fso.GetFolder(folderspec)
//End Function


