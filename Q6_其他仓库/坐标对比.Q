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
MacroID=a3c0bf44-eaaa-4d32-8bb5-d240f0d4d0cd
Description=坐标对比
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
Const COMPARE_FOLDER = "C:\Q6自动测试数据\坐标对比\"
Const RANGE_X = 5
Const RANGE_Y = 5

'测试区域---------------------
//Call ComparePosInTxt("C:\Q6自动测试数据\坐标对比\测试1.txt", "C:\Q6自动测试数据\坐标对比\测试2.txt")
Call ComparePosInFolder(COMPARE_FOLDER)
'测试区域结束-----------------

//将整个文件夹内的所有txt文本进行坐标对比，参数为文件夹路径
Sub ComparePosInFolder(folderPath)
	Dim txtsInFolder, txtsInFolderArr, i, j
	txtsInFolder = GetAllTxtsPathInFolder(folderPath)
	txtsInFolderArr = Split(txtsInFolder, "|")
	
	//最后一轮对比只需要倒数第2个文件跟倒数第一个文件对比即可
	For i = 0 To UBound(txtsInFolderArr) - 2
		For j = i + 1 To UBound(txtsInFolderArr) - 1
			Call ComparePosInTxt(txtsInFolderArr(i), txtsInFolderArr(j))
		Next
	Next
End Sub

//将txt文本中一些不符合写法的内容剔除掉，具体包括 |, [, ], ,,和空格
Function HandleTxtFile(txtFilePath)
    Dim text
    text = ReadFormTxt(txtFilePath)
    text = Replace(text, "|", ",")
    text = Replace(text, "[", "")
    text = Replace(text, "]", "")
    text = Replace(text, ",,", ",")
    text = Replace(text, " ", "")
    HandleTxtFile= text
End Function

//txt文本里的坐标对比函数
Sub ComparePosInTxt(txtPath1, txtPath2)
    Dim text1, textArr1, text2, textArr2, i, j
    text1 = HandleTxtFile(txtPath1)
    textArr1 = Split(text1, ",")
    text2 = HandleTxtFile(txtPath2)
    textArr2 = Split(text2, ",")
    
    '因为最后一个元素为空，所以循环只需要到最后一个元素的前一个元素为止。故需要长度-1
    For i = 0 To UBound(textArr1) - 1 Step 3
    	For j = 0 To UBound(textArr2) - 1 Step 3
    		'场景一致对比才有意义
    		If textArr1(i) = textArr2(j) Then 
    			'x跟y的对比值如果在范围内，就输出log
    			If IsInRange(textArr1(i + 1), textArr2(j + 1), RANGE_X) Then 
    				TracePrint "文件：【" & txtPath1 & "】坐标：" & textArr1(i) & "," & textArr1(i + 1) & ", " & textArr1(i + 2)
    				TracePrint "文件：【" & txtPath2 & "】坐标：" & textArr2(j) & "," & textArr2(j + 1) & ", " & textArr2(j + 2)
    			ElseIf IsInRange(textArr1(i + 2), textArr2(j + 2), RANGE_Y) Then 
    				TracePrint "文件：【" & txtPath1 & "】坐标：" & textArr1(i) & "," & textArr1(i + 1) & ", " & textArr1(i + 2)
    				TracePrint "文件：【" & txtPath2 & "】坐标：" & textArr2(j) & "," & textArr2(j + 1) & ", " & textArr2(j + 2)		
    			End If
    		End If
    	Next
    Next   
End Sub


//坐标对比函数，如果2者间的差小于波动范围，则认为有重叠，在范围内返回true，反之返回false
Function IsInRange(pos1, pos2, rangeData)
	'传进来的是字符串，需要转成数值才能运算
	pos1 = Int(pos1)
	pos2 = Int(pos2)
	If (Abs(pos1 - pos2) <= rangeData) Then 
		IsInRange = True
	Else 
		IsInRange = False
	End If
End Function

'往txt文本写入数据，参数为：写入的txt文本路径，写入内容
Sub WriteInTxt(filePath, wStr)
    Call Plugin.File.WriteFileEx(filePath, wStr)
End Sub

'从txt文本读取文本，参数为：读取的txt文本路径
Function ReadFormTxt(filePath)
    ReadFormTxt = Plugin.File.ReadFileEx(filePath)
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

//脚本停止事件，需要关闭excel表 
Sub OnScriptExit()
    MessageBox "脚本已停止"
End Sub


//----------------------------- 文件夹操作函数所必须的所有函数 --------------------------------------
'获取目标文件夹内的所有txt文件
Function GetAllTxtsPathInFolder(folderPath)
    Dim allFiles, fileArr, i
    allFiles = GetAllFilesPathInFolder(folderPath)
    fileArr = Split(allFiles, "|")
    For i = 0 To (Ubound(fileArr) - 1)
        If Instr(fileArr(i), ".txt") > 0 Then 
            GetAllTxtsPathInFolder = GetAllTxtsPathInFolder & fileArr(i) & "|"
        Else 
            TracePrint fileArr(i) & " :不是txt文件，请检查"
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
//----------------------------- 文件夹操作函数所必须的所有函数 --------------------------------------
