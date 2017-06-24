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
MacroID=8959db14-5f1e-42cf-aa7c-f7a124cfc2b7
Description=战斗测试
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
//分辨率 = 720 * 480
//全局变量前要加g_，尽量少定义

Const g_GAME_WIN_COUNT = 3
Dim g_Hwnds() '定义全局数组g_Hwnds，数组元素个数未定
For i = 0 To (g_GAME_WIN_COUNT-1)
    Redim Preserve g_Hwnds(i)
    g_Hwnds(i) =i
Next

Call MoveGameWin()









//子程序起始位置------------------------------------ 
Sub MoveGameWin()
	x = 10
	y = 10
	
    For i = 0 To (g_GAME_WIN_COUNT-1)
        g_Hwnds(i) = Plugin.Window.Find("UnityWndClass", "Q6")
        Call Plugin.Window.SetText(g_Hwnds(i), "Q6_" & (i + 1)) '修改窗口标题，防止搜到重复的窗口
        Call Plugin.Window.Move(g_Hwnds(i), 0, 0)
        Delay 1000
    Next 
End Sub

Sub OnScriptExit()
	'前面修改了窗口的标题，在脚本结束的时候要改回来
    For i = 0 To (g_GAME_WIN_COUNT-1)
        Call Plugin.Window.SetText(g_Hwnds(i), "Q6")
        Delay 100
    Next
End Sub
