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
MacroID=501e963e-1dac-48df-9f9c-774b148987e8
Description=输出文件路径
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
Const NEED_OUTPUT_FOLDER_PATH = "E:\按键学习\TEST"

TracePrint GetAllFoldersInFolder(NEED_OUTPUT_FOLDER_PATH)


Function GetAllFoldersInFolder(folderPath)
    '特别特别注意！！！子程内的局部变量一定要用dim定义，特别对于有用到递归的子程更是如此
    Dim i, foldersList, folderArr
    If IsHasFolders(folderPath) Then 
        foldersList = GetFoldersPathList(folderPath)
        folderArr = Split(foldersList, "|")
        
        For i = 0 To (UBound(folderArr) - 1)
            TracePrint folderArr(i)
            '因为用递归调用函数，所以这里的变量要设置成全局变量，才不会每次递归调用时将值初始化为空
            globalAllFoldersInFolder = globalAllFoldersInFolder & folderArr(i) & "|"
            
            '递归调用
            GetAllFoldersInFolder (folderArr(i))
        Next
    End If
	GetAllFoldersInFolder = globalAllFoldersInFolder
End Function

//s = "E:\按键学习\TEST"
//TracePrint searchfile(s)
//Function searchfile(s)
//    Set f = CreateObject("Scripting.FileSystemObject")
//    Set folder = f.getfolder(s)
//    Set folders = folder.SubFolders//得到该目录下的文件夹名
//    Set files=folder.files//得到该目录下的所有文件名
//    For Each a In files
//        //TracePrint s&a.name//输出文件的名字
//    Next
//    For Each a In folders
//        searchfile s&a.name&"\"//继续遍历子文件文件夹里的所有文件
//    Next
//End Function
//

Sub OnScriptExit()

End Sub



Sub WriteToTxt(path, wStr)
    Call Plugin.File.WriteFileEx(path, wStr)
End Sub



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

   
   
  /* 
    If (IsHasFiles(path)) Or (IsHasFolders(path)) Then 
        If IsHasFiles(path) Then 
            //Call WriteToTxt("E:\按键学习\TEST\test.txt", GetFilesPathList(path))
        End If
    	
        If IsHasFolders(path) Then 
            pathTest = GetFoldersPathList(path)
            pathArr = split(pathTest, "<BR>")
			
            For i = 0 To (UBound(pathArr) - 1)
                Call OutputFilePath(pathArr(i))
                TracePrint pathArr(i)
            Next
        End If
    Else 
        aaaaa = 0
        Exit Sub
    End If

    */