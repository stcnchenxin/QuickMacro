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
MacroID=cbf0adc5-ece5-4ef1-8fdd-19d535f8969f
Description=±ÌÀ¶º½Ïß¹Ò»ú
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
Hwnd = Plugin.Window.MousePoint()
sRect = Plugin.Window.GetWindowRect(Hwnd)
Dim clientCoordinates
clientCoordinates = Split(sRect, "|")
L = Clng(clientCoordinates(0))
T = Clng(clientCoordinates(1))  
R = Clng(clientCoordinates(2))
B = Clng(clientCoordinates(3))
Delay 200
MessageBox L & ", " & T






Sub Select01_04()
	MoveTo L + 688, T + 252
End Sub
