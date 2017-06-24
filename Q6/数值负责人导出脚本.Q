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
MacroID=5a193afe-66fd-4541-88dc-d4401cf2e258
Description=数值负责人导出脚本
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
'文件位置及文件后缀定义
Const FOLDER_PATH = "F:\QCshare\Q6\数值表测试\数值表负责人数据"
Const ORIGINAL_DATA_PATH = "F:\QCshare\Q6\数值表测试\新版数值测试\数值文件详细记录.xls"
Const TXT_EXTENSION_STR = ".txt"

'起始行的行定义
Const STAR_ROW_LINE = 2

'读取的数据的行列定义
Const READ_NAME_LIST = 1
Const READ_KEY_LIST = 3
Const READ_FILE_NAME_LIST = 4
'---------------------------常量区域结束-------------------------------



'----------------------------运行区域--------------------------------
'运行前的一些准备工作-------------------------------------------
Call Plugin.Office.OpenXls(ORIGINAL_DATA_PATH)

'先将存放导出文本的目录先删掉，然后在建新的目录，清空原目录中的数据
Call Plugin.File.DeleteFolder(FOLDER_PATH)
Call Plugin.File.CreateFolder(FOLDER_PATH)
'准备工作结束---------------------------------------------------


Call OutputDataToTxt()
//Call InputDataToExcel()






'----------------------------运行区域结束--------------------------------


'将配置负责人的表导出到txt文件中的子程
Sub OutputDataToTxt()
    Dim iPage, starRow, fileName, writeInData
    iPage = 1
    Do
        '如果文件名单元格不为空，执行输出
        If ReadFormExcel(iPage, STAR_ROW_LINE, READ_NAME_LIST) <> "" Then 
			
            '初始化数据起始行
            starRow = STAR_ROW_LINE
            
            '有数据时一直往文本中添加数据
            While ((ReadFormExcel(iPage, starRow, READ_NAME_LIST)) <> "")
            	fileName = ReadFormExcel(iPage, starRow, READ_FILE_NAME_LIST)
                writeInData = ReadFormExcel(iPage, starRow, READ_NAME_LIST) & "|" & ReadFormExcel(iPage, starRow, READ_KEY_LIST)
                
                Call WriteInTxt(FOLDER_PATH & "\" & fileName & TXT_EXTENSION_STR, writeInData)
                starRow = starRow + 1
            Wend 		
        Else
            Exit Do
        End If
	
        iPage = iPage + 1
    Loop
End Sub

Sub InputDataToExcel()
	Dim pathList, paths, page, fileName, dataList, dataArr

    '获取文件夹内所有文件的路径
    pathList = GetFilesPahtInFolderList(FOLDER_PATH)
    paths = Split(pathList, "|")
    page = 1
    For i = 0 To UBound(paths) - 1
        '文件名先初始化，防止之前的名字干扰后面的名字
        fileName = ""
        
        '如果路径中有.txt字样，即为要处理的文件夹
        If IsAlikeStrFromLast(paths(i), ".txt") Then 
            fileName = ReplaceStr(GetFileName(paths(i)), ".txt", "")	'将.txt替换掉，只保留文件名
            
            '获取txt文件中所有的文本
            dataList = ReadFormTxt(paths(i))
            dataArr = Split(dataList, "|")
            
            Call WriteInExcel(page, 2, 1, "ouput_file_name")
            Call WriteInExcel(page, 2, 2, fileName)
            Call WriteInExcel(page, 3, 1, "star_row")
            
            '将获取的文本依次写入excel表的第1、2行中
            For j = 0 To UBound(dataArr) - 1 Step 2
                Call WriteInExcel(page, (j / 2) + 4, 1, dataArr(j))
                Call WriteInExcel(page, (j / 2) + 4, 2, dataArr(j + 1))
            Next
            
            page = page + 1
        End If
        
    Next
End Sub

'将文本中某个字符串替换成想要的字符串，参数分别为要处理的字符串，被替换的字符串，替换上去的字符串
Function ReplaceStr(str, beRestr, restr)
    ReplaceStr = Replace(str, beRestr, restr)
End Function

'获取文件的名字，参数为文件路径
Function GetFileName(filePath)
    Dim fso
    Set fso = CreateObject("Scripting.FileSystemObject")
    GetFileName = fso.GetFileName(filePath)  
End Function

'获取文件夹内所有文件的文件路径，参数为文件夹路径
Function GetFilesPahtInFolderList(filespec) 
    Dim fso, folderT, fileT, fpath
    Set fso = CreateObject("Scripting.FileSystemObject")
    Set folderT = fso.GetFolder(filespec)
    Set fileT = folderT.Files
    fpath = ""
    For Each f1 In fileT
        fpath = f1.Path & "|" & fpath
    Next
    GetFilesPahtInFolderList = fpath
End Function

//从开始找是否有一样的字符串，有则返回1，没有返回0，参数为被查找的字符串，需要找到的字符串
Function IsAlikeStrFromStart(accpetSearchStr, Str)
    If InStr(accpetSearchStr, Str) Then 
        IsAlikeStrFromStart = True
    Else 
        IsAlikeStrFromStart = False
    End If
End Function

//从末尾找是否有一样的字符串，有则返回1，没有返回0，参数为被查找的字符串，需要找到的字符串
Function IsAlikeStrFromLast(accpetSearchStr, Str)
    If InStrRev(accpetSearchStr, Str) Then 
        IsAlikeStrFromLast = True
    Else 
        IsAlikeStrFromLast = False
    End If
End Function

Sub WriteInExcel(page, line, list, writeInStr)
    Call Plugin.Office.WriteXls(page, line, list, writeInStr)
End Sub

Function ReadFormExcel(page, line, list)
    ReadFormExcel = Plugin.Office.ReadXls(page, line, list)
End Function

Sub WriteInTxt(filePath, writeInStr)
    Call Plugin.File.WriteFileEx(filePath, writeInStr)
End Sub

Function ReadFormTxt(filePath)
    ReadFormTxt = Plugin.File.ReadFileEx(filePath)
End Function

Sub OnScriptExit()
    Call Plugin.Office.CloseXls()
    MessageBox "脚本已停止"
End Sub
