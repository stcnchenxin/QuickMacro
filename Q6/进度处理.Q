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
MacroID=e956e19f-1a18-49f4-9d8d-2caebd574c0e
Description=进度处理
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
//对于第一页没有的数据无法做到对比，用按键精灵搞相当麻烦，就不管了
Const NEED_HANDLE_EXCEL_PATH = "F:\desktop\Q6项目相关\Q6-QC相关\表单情况及Bug记录\中转文本.xlsx"


'对比的默认数据页和行定义
Const INITIAL_PAGE = 1
Const INITIAL_NUMBER_LIST = 1

'字符串大小的常数定义
Const STRING_MORE_THAN = 1
Const STRING_LESS_THAN = -1
Const STRING_EQUAL = 0

'需要处理的数据宽度
Const CELL_WIDTH = 7

Call Plugin.Office.OpenXls(NEED_HANDLE_EXCEL_PATH)
Call HandleSub()

Sub HandleSub()
    beHandlePage = 2
    writeInList = 8
    
    While ReadFormExcel(beHandlePage, 1, 1) <> ""
        pagLenght = PagingLenght(beHandlePage)	'需要先算出对应分页的单元格总长度
        handleLine = 1	'初始行默认为1
        Do
            pos = Array("", "", "")	'开头先将找到的数据的表页、行列初始化，防止其他数据影响，此步不加也可以，后面有判断分割时必须处于有数据状态，此处为保险加了
            strForCom1 = ReadFormExcel(INITIAL_PAGE, handleLine, INITIAL_NUMBER_LIST)
            strForCom2 = ReadFormExcel(beHandlePage, handleLine, INITIAL_NUMBER_LIST)
			
			//当第一个分页第1列某行无数据时，说明到了数据尽头，需要退出循环
            If strForCom1 = "" Then 
                Exit Do
            End If
			
            //首先确保同一行的被对比数据为空且该行的长度大于被对比页的长度时，对比需要从被对比页最下方的数据开始往上找
            If ((strForCom2 = "") And (handleLine >= pagLenght)) Then
                sameLocation = LookUpData(strForCom1, beHandlePage, pagLenght, INITIAL_NUMBER_LIST)
                If sameLocation <> "" Then 
                    pos = Split(sameLocation, "|")
                    Call CopyData(INITIAL_PAGE, handleLine, beHandlePage, Int(pos(1)), writeInList)
                    'Call WriteInExcel(beHandlePage, Int(pos(1)), CELL_WIDTH + 1, "1")
                    Call DeleteData(beHandlePage, Int(pos(1)))
                End If
            
            //当同一行被对比行有数据时即可进行对比 
            Else 
            	//同一行数据相同时，直接复制
                If StrComp(strForCom1, strForCom2, 1) = STRING_EQUAL Then 
                    Call CopyData(INITIAL_PAGE, handleLine, beHandlePage, handleLine, writeInList)
                    'Call WriteInExcel(beHandlePage, handleLine, CELL_WIDTH + 1, "1")
                    Call DeleteData(beHandlePage, handleLine)
        		
        		//数据比同一行数据小时，则需从该行往上找数据
                ElseIf StrComp(strForCom1, strForCom2, 1) = STRING_LESS_THAN Then
                    sameLocation = LookUpData(strForCom1, beHandlePage, handleLine, INITIAL_NUMBER_LIST)
                    If sameLocation <> "" Then 
                        pos = Split(sameLocation, "|")
                        Call CopyData(INITIAL_PAGE, handleLine, beHandlePage, Int(pos(1)), writeInList)
                        'Call WriteInExcel(beHandlePage, Int(pos(1)), CELL_WIDTH + 1, "1")
                        Call DeleteData(beHandlePage, Int(pos(1)))
                    End If
            	
            	//数据比同一行数据大时，则需从该行往下找数据
                Else 
                    sameLocation = LookDownData(strForCom1, beHandlePage, handleLine, INITIAL_NUMBER_LIST, pagLenght)
                    If sameLocation <> "" Then 
                        pos = Split(sameLocation, "|")
                        Call CopyData(INITIAL_PAGE, handleLine, beHandlePage, Int(pos(1)), writeInList)
                        'Call WriteInExcel(beHandlePage, Int(pos(1)), CELL_WIDTH + 1, "1")
                        Call DeleteData(beHandlePage, Int(pos(1)))
                    End If
                End If
            End If

            handleLine = handleLine + 1 
        Loop
        beHandlePage = beHandlePage + 1
        writeInList = writeInList + CELL_WIDTH
    Wend
End Sub

//返回对应表页第一个数据中止的位置
Function PagingLenght(page)
    PagingLenght = 1
    While ReadFormExcel(page, PagingLenght, 1) <> ""
        PagingLenght = PagingLenght + 1
    Wend
    '比实际数字要大，所以需要-1
    PagingLenght = PagingLenght - 1
End Function

//从同一行作为初始位置往下找是否有相同的数据，有则返回由分页，行，列组成的字符串，无则返回空
Function LookDownData(CompStr1, startPage, startLine, startList, cellLen)	
    Do While (startLine <= cellLen)
    	CompStr2 = ReadFormExcel(startPage, startLine, startList)
        If CompStr2 <> "" Then
            If StrComp(CompStr1, CompStr2, 1) = STRING_EQUAL Then
                LookDownData = startPage & "|" & startLine & "|" & startList
                Exit Function
            ElseIf StrComp(CompStr1, CompStr2, 1) = STRING_LESS_THAN Then
                LookDownData = ""
                Exit Function
            End If
        End If
        startLine = startLine + 1
    Loop
    LookDownData = ""
End Function

//从同一行作为初始位置往上找是否有相同的数据，有则返回由分页，行，列组成的字符串，无则返回空
Function LookUpData(CompStr1, startPage, startLine, startList)	
    Do While (startLine > 0)
        CompStr2 = ReadFormExcel(startPage, startLine, startList)
        If  CompStr2 <> "" Then
            If StrComp(CompStr1, CompStr2, 1) = STRING_EQUAL Then
                LookUpData = startPage & "|" & startLine & "|" & startList
                Exit Function
            ElseIf StrComp(CompStr1, CompStr2, 1) = STRING_MORE_THAN Then
                LookUpData = ""
                Exit Function
            End If
        End If
        startLine = startLine - 1
    Loop
    LookUpData = ""
End Function

//将对应数据复制到同一行的对应位置，参数为写入的页，行，读取的页，行，写入的初始列（可能有很多页数据都要挪到第一页来）
Sub CopyData(writePage, writeLine, readPage, readLine, startWriteList)
    For i = 1 To CELL_WIDTH
        text = ReadFormExcel(readPage, readLine, i)
        Call WriteInExcel(writePage, writeLine, startWriteList + i - 1, text)
    Next
End Sub

//将对应数据删除，容易看点，参数为删除的数据页，行
Sub DeleteData(delPage, delLine)
    For i = 1 To CELL_WIDTH
        Call WriteInExcel(delPage, delLine, i, "")
    Next
End Sub

Sub WriteInExcel(page, line, list, str)
    Call Plugin.Office.WriteXls(page, line, list, str)
End Sub

//读出excel表对应格子内容，参数为，表分页，行，列
Function ReadFormExcel(page, line, list)
    ReadFormExcel = Plugin.Office.ReadXls(page, line, list)
End Function

//脚本停止事件，需要关闭excel表 
Sub OnScriptExit()
    Call Plugin.Office.CloseXls()
End Sub

