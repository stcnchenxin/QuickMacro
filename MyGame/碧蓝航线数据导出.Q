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
MacroID=4ae142e6-0814-4401-a36b-7bce7e357cb5
Description=碧蓝航线数据导出
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
Const EXCEL_INI_PATH = "C:\QM_Data\碧蓝航线\配置.xlsx"

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

'---------------------------常量区域结束-------------------------------



'运行前的一些准备工作-------------------------------------------



'准备工作结束---------------------------------------------------


'----------------------------运行区域--------------------------------
Call OutPutGameConfig(EXCEL_INI_PATH)

'--------------------------运行区域结束------------------------------


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
