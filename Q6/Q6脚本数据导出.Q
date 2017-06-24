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
MacroID=c406d4f1-de64-476d-9d53-2d37e0231e0f
Description=Q6脚本数据导出
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
'---------------------------常量区域-------------------------------
'配置表位置定义
Const EXCEL_INI_PATH = "C:\Q6自动测试数据\Q6游戏脚本配置表.xlsx"

'判断是否导出该分页的行列定义
Const IS_OUTPUT_LINE = 1
Const IS_OUTPUT_LIST = 2

'导出数据起始行列定义
Const DATA_STAR_LINE = 6
Const DATA_STAR_LIST = 1

'判断导出数据在哪一列中止的单元格行定义
Const READ_STOP_KEY_LIST = 5

'导出文件夹路径的行列定义
Const OUPUT_FOLDER_NAME_LINE = 2
Const OUPUT_FOLDER_NAME_LIST = 2


'战斗表数值导表常量
Const FIGHT_EXCELS_PATH = "C:\Q6自动测试数据\战斗测试配置表"

Const ALL_FIGHT_ORDER_PAHT = "C:\Q6自动测试数据\数据导出文件夹\指令\所有战斗.txt"

Const CONFIG_EXCEL_PATH = "C:\Q6自动测试数据\导表配置.xls"
Const CONFIG_EXCEL_PAGE = 2
Const CONFIG_EXCEL_INPUT_LIST = 2
Const CONFIG_EXCEL_OUTPUT_LIST = 5
Const CONFIG_EXCEL_STAR_LINE = 2

Const FIGHT_CONFIG_TXT_PATH = "C:\Q6自动测试数据\数据导出文件夹\导表\战斗表配置.txt"

Const FIGHT_FILE_INDENTIFICATION = "data/fight/"
Const FIGHT_FILE_INPUT_REPLACE_DATA = "Z战斗/AI表/"


'协议配置表导表常量
Const RPC_CONFIG_PATH = "C:\Q6自动测试数据\Q6协议配置表.xlsx"
Const RPC_EFFECT_PATH = "C:\Q6自动测试数据\数据导出文件夹\协议\Q6_rpc_effect.txt"
Const RPC_OUTPUT_CONFIG_PATH = "C:\Q6自动测试数据\数据导出文件夹\协议\Q6_rpc_config.txt"

'---------------------------常量区域结束-------------------------------



'运行前的一些准备工作-------------------------------------------



'准备工作结束---------------------------------------------------


'----------------------------运行区域--------------------------------
//Call OutPutRpcCongfig(RPC_CONFIG_PATH)

//Call OutPutGameConfig(EXCEL_INI_PATH)

//Call SearchConfigDataWriteInTxt(CONFIG_EXCEL_PATH, FIGHT_CONFIG_TXT_PATH, CONFIG_EXCEL_OUTPUT_LIST, FIGHT_FILE_INDENTIFICATION, CONFIG_EXCEL_INPUT_LIST, FIGHT_FILE_INPUT_REPLACE_DATA, CONFIG_EXCEL_OUTPUT_LIST, FIGHT_FILE_INDENTIFICATION)

//Call WriteFightOrderToTxt(FIGHT_EXCELS_PATH)


/*
Dim allExcelPath, allExcelPathArr
allExcelPath = GetAllExcelsPathInFolder("E:\Q6design\EXPORT")
allExcelPathArr = Split(allExcelPath, "|")
For Each logText In allExcelPathArr
    Call WriteInTxt("E:\Q6design\数值表log.txt", logText)
Next
*/
'--------------------------运行区域结束------------------------------





Sub OutPutRpcCongfig(rpcFilePath)
    Call Plugin.Office.OpenXls(rpcFilePath)
    Delay 500
    Dim iPage, iLine, ilist

    Call Plugin.File.DeleteFile(RPC_EFFECT_PATH)
    Call Plugin.File.DeleteFile(RPC_OUTPUT_CONFIG_PATH)

    
    '将协议配置文件中所有数据逐行写入配置文件
    iPage = 1
    iLine = 6
    ilist = 1
    Do While (ReadFormExcel(iPage, iLine, ilist) <> "")
        Dim rpcConfigStr
        rpcConfigStr = ""
        Do While (ReadFormExcel(iPage, iLine, ilist) <> "")
            Call WriteInTxt(RPC_OUTPUT_CONFIG_PATH, ReadFormExcel(iPage, iLine, ilist))
            ilist = ilist + 1
        Loop
        
        iLine = iLine + 1
        ilist = 1
    Loop
   	
    '将协议配置文件中的协议作用一列写入协议作用配置，用于其他脚本下拉界面
    iPage = 1
    iLine = 6
    ilist = 1    
    Do While (ReadFormExcel(iPage, iLine, ilist) <> "")
        Call WriteInTxt(RPC_EFFECT_PATH, ReadFormExcel(iPage, iLine, ilist))
        iLine = iLine + 1
    Loop
   	
    Call Plugin.Office.CloseXls()
End Sub


'将【目标路径】内的所有战斗表的战斗指令导出导指令文件夹（ps：特殊ai如灵兽ai不能放到目录内，否则也会一并导出，但不能用）
Sub WriteFightOrderToTxt(folderPath)
    If Plugin.File.IsFileExist(ALL_FIGHT_ORDER_PAHT) Then 
        Call Plugin.File.DeleteFile(ALL_FIGHT_ORDER_PAHT)
    End If
    
    Dim i, j, k, allExcesFiles, excelFileArr, fightConfigStr, fightConfigArr, fightNums, fightNumArr	
    allExcesFiles = GetAllExcelsPathInFolder(folderPath)
    excelFileArr = Split(allExcesFiles, "|")
	
    fightConfigStr = ReadFormTxt(FIGHT_CONFIG_TXT_PATH)
    fightConfigArr = Split(fightConfigStr, "|")
	
    TracePrint allExcesFiles
	
    For i = 0 To (Ubound(excelFileArr) - 1)
        For j = 0 To (Ubound(fightConfigArr) - 1) Step 2
            If InStr(excelFileArr(i), fightConfigArr(j)) > 0 Then 
                TracePrint "处理中的excel表：" & excelFileArr(i)
                fightNums = GetFightNumFormFightExcel(excelFileArr(i))
                fightNumArr = Split(fightNums, "|")
                For k = 0 To (Ubound(fightNumArr) - 1)
                    Call WriteInTxt(ALL_FIGHT_ORDER_PAHT, "$bf " & fightConfigArr(j + 1) & "," & fightNumArr(k))
                Next 	
            End If
        Next
    Next
End Sub

'获取目标文件夹内的所有excel文件
Function GetAllExcelsPathInFolder(folderPath)
    Dim allFiles, fileArr, i
    allFiles = GetAllFilesPathInFolder(folderPath)
    fileArr = Split(allFiles, "|")
    For i = 0 To (Ubound(fileArr) - 1)
        If Instr(fileArr(i), ".xls") > 0 Or Instr(fileArr(i), ".xlsx") > 0 Then 
            GetAllExcelsPathInFolder = GetAllExcelsPathInFolder & fileArr(i) & "|"
        Else 
            TracePrint fileArr(i) & " :不是excel文件，请检查"
        End If
    Next
	
End Function

'获取文件夹内所有文件的集合
Function GetAllFilesPathInFolder(folderPath)
    '获取目标文件夹内文件的路径
    GetAllFilesPathInFolder = GetFilesPathList(folderPath)
    '因为GetAllFoldersPathInFolder函数只能获取文件夹内所有文件的集合，但无法获取当前文件夹内的文件集合，所以前面要先获取一次目标文件夹内文件的路径，再逐个获取其他文件夹内文件的路径
    Dim folderList, folderArr, i
    foldersList = GetAllFoldersPathInFolder(folderPath)
    folderArr = Split(foldersList, "|")
    For i = 0 To (Ubound(folderArr) - 1)
        GetAllFilesPathInFolder = GetAllFilesPathInFolder & GetFilesPathList(folderArr(i))
    Next	
End Function


'获取文件夹内所有文件夹的路径集合，此函数负责将全局变量globalAllFoldersInFolder初始化为空字符串，调用时重新赋值，防止全局变量干扰
Function GetAllFoldersPathInFolder(folderPath)
    If folderPath = "" Then 
        TracePrint folderPath & "：为空的路径！"
        ExitScript
    End If
    globalAllFoldersInFolder = ""
    GetAllFoldersPathInFolder = GetFoldersPathInFolder(folderPath)
End Function

'递归调用，获取目标文件夹内所有文件夹路径，需要注意，此处返回的值为全局变量，在调用该函数时需将globalAllFoldersInFolder赋值为空字符串
Function GetFoldersPathInFolder(folderPath)
    '特别特别注意！！！子程内的局部变量一定要用dim定义，特别对于有用到递归的子程更是如此
    Dim i, foldersList, folderArr
    If IsHasFolders(folderPath) Then 
        foldersList = GetFoldersPathList(folderPath)
        folderArr = Split(foldersList, "|")
        
        For i = 0 To (UBound(folderArr) - 1)
            '因为用递归调用函数，所以这里的变量要设置成全局变量，才不会每次递归调用时将值初始化为空
            globalAllFoldersInFolder = globalAllFoldersInFolder & folderArr(i) & "|"
            
            '递归调用
            GetFoldersPathInFolder (folderArr(i))
        Next
    End If
    GetFoldersPathInFolder = globalAllFoldersInFolder
End Function

'通过战斗表生成该表对应的战斗编号
Function GetFightNumFormFightExcel(excelPath)
    Call Plugin.Office.OpenXls(excelPath)
    GetFightNumFormFightExcel = ""
	
    Dim iPage, iLine, iList
    iPage = 1
    iLine = 1
    iList = 1
    '基于按键插件的限制，没法获取excel最大的表格分页，采取低级限制方法。防止无限循环，加个循环限制，超过跳出循环
    For iPage = 1 To 30
        If ReadFormExcel(iPage, iLine, iList) = "战斗地图" Then 
            Exit For
        End If
    Next	
    If iPage >= 25 Then 
        TracePrint excelPath & " :可能不是战斗表，请检查。"
        Exit Function
    End If
	
    Dim spaceNumber
    spaceNumber = 1
    Do
        readData = ReadFormExcel(iPage, iLine, iList)
        If readData <> "" Then 
            spaceNumber = 1
            If readData = "NPC组成策略" Then 
                GetFightNumFormFightExcel = GetFightNumFormFightExcel & ReadFormExcel(iPage, iLine, iList + 1) & "|"
            End If
        Else 
            spaceNumber = spaceNumber + 1
        End If
		
        If spaceNumber > 10 Then 
            Exit Do
        End If
        iLine = iLine + 1
    Loop	
    Call Plugin.Office.CloseXls()
End Function

'将战斗表写入txt文本，参数为导表配置路径和写入txt文本的路径
Sub SearchConfigDataWriteInTxt(configExcelPath, writeInTxtPath, searchList, forSearchStr, inList, replaceInStr, outList, replaceOutStr)
    Call Plugin.Office.OpenXls(configExcelPath)
    Delay 500
    
    Dim inputData, outputData, starLine, forSearchData
    inputData = ""
    outputData = ""
    starLine = CONFIG_EXCEL_STAR_LINE
    
    If Plugin.File.IsFileExist(writeInTxtPath) Then 
        Call Plugin.File.DeleteFile(writeInTxtPath)
    End If

    Do
        inputData = ReadFormExcel(CONFIG_EXCEL_PAGE, starLine, inList)
        outputData = ReadFormExcel(CONFIG_EXCEL_PAGE, starLine, outList)
        forSearchData = ReadFormExcel(CONFIG_EXCEL_PAGE, starLine, searchList)

        If inputData = "" And outputData = "" Then 
            Exit Do
        End If
    	
        If InStr(forSearchData, forSearchStr) Then 
            '删除了文件夹前缀后写入txt
            Call WriteInTxt(writeInTxtPath, Replace(Replace(inputData, replaceInStr, ""), "/", "\") & "|" & Replace(Replace(outputData, replaceOutStr, ""), ".c", ""))
        End If
        starLine = starLine + 1
    Loop
	
    Call Plugin.Office.CloseXls()
End Sub

'将【游戏脚本配置表】导出到对应txt文本中
Sub OutPutGameConfig(excelPath)
    Call Plugin.Office.OpenXls(excelPath)
    Delay 500
    Dim iPage, stopList, folderPath, iLine, ilist
    iPage = 1
    Do While (ReadFormExcel(iPage, IS_OUTPUT_LINE, IS_OUTPUT_LIST) = "TRUE")
        '找出无需导出的数据的起始列
        stopList = 1
        Do
            If (ReadFormExcel(iPage, READ_STOP_KEY_LIST, stopList) = "fileName") Then 
                Exit Do
            Else 
                stopList = stopList + 1	
            End If
        Loop

        '确定输出的文件夹的路径
        folderPath = ReadFormExcel(iPage, OUPUT_FOLDER_NAME_LINE, OUPUT_FOLDER_NAME_LIST)
        '删除并重新创建文件夹
        Call Plugin.File.DeleteFolder(folderPath)
        Call Plugin.File.CreateFolder(folderPath)
        		
        '逐行写入数据
        iLine = DATA_STAR_LINE
        Do While(ReadFormExcel(iPage, iLine, DATA_STAR_LIST) <> "")
            '将同一行的数据都整理成一个文本，用"|"连接
            allText = ReadFormExcel(iPage, iLine, DATA_STAR_LIST)
            For ilist = DATA_STAR_LIST + 1 To stopList - 1
                text = ReadFormExcel(iPage, iLine, ilist)
                allText = allText & "|" & text
            Next
                    
            '确定文件名，写入对应的文件
            Call WriteInTxt(folderPath & "\" & ReadFormExcel(iPage, iLine, stopList), allText)
            iLine = iLine + 1
        Loop 
        iPage = iPage + 1
    Loop
    Call Plugin.Office.CloseXls()
End Sub

//返回文件夹内文件路径的集合
Function GetFilesPathList(path)
    Dim fso, f, f1, fs, s
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFolder(path)
    Set fs = f.Files
    For Each f1 In fs
        s = s & f1.Path
        s = s & "|"
    Next
    GetFilesPathList = s
End Function

//检查是否有路径内是否有文件，有返回1，无返回0
Function IsHasFiles(path)
    Dim i
    i = GetFilesPathList(path)
    If i = "" Then 
        IsHasFiles = 0
    Else 
        IsHasFiles = 1
    End If
End Function

//检查是否有路径内是否有文件夹，有返回1，无返回0
Function IsHasFolders(path)
    Dim i
    i = GetFoldersPathList(path)
    If i = "" Then 
        IsHasFolders = 0
    Else 
        IsHasFolders = 1
    End If
End Function

//返回文件夹内文件夹路径的集合
Function GetFoldersPathList(path)
    Dim fso, f, f1, fs, s
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set f = fso.GetFolder(path)
    Set fs = f.SubFolders
    For Each f1 In fs
        s = s & f1.Path
        s = s & "|"
    Next
    GetFoldersPathList = s
End Function

//返回文件的路径 
Function GetFilePaht(filePath)
    Dim fso, f
    Set fso = CreateObject("Scripting.FileSystemObject")
    set f = fso.GetFile(filePath)    
    GetFilePaht = f.Path
End Function

//返回文件夹的路径
Function GetFolderPaht(folderPath)
    Dim fso, f
    Set fso = CreateObject("Scripting.FileSystemObject")
    set f = fso.GetFolder (folderPath)    
    GetFolderPaht = f.Path
End Function


Sub WriteInExcel(page, line, list, str)
    Call Plugin.Office.WriteXls(page, line, list, str)
End Sub

Function ReadFormExcel(page, line, list)
    ReadFormExcel = Plugin.Office.ReadXls(page, line, list)
End Function

Sub WriteInTxt(filePath, wStr)
    Call Plugin.File.WriteFileEx(filePath, wStr)
End Sub

Function ReadFormTxt(filePath)
    ReadFormTxt = Plugin.File.ReadFileEx(filePath)
End Function

Sub OnScriptExit()
    Call Plugin.Office.CloseXls()
    MessageBox "脚本已停止"
End Sub
