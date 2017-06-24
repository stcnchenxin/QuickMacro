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
MacroID=97d8ae70-4217-4300-8c37-104625aaaae1
Description=Test
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
a = 9

Do
	If (a mod 2) = 1 Then 
		If (a mod 3) = 0 Then 
			If (a mod 4) = 1 Then 
				If (a mod 5) = 1 Then 
					If (a mod 6) = 3 Then 
						If (a mod 7) = 0 Then 
							If (a mod 8) = 1 Then 
								If (a mod 9) = 0 Then 
									TracePrint a
									//Exit Do
								End If
							End If
						End If		
					End If
				End If
			End If
		End If
	End If
	a = a + 1
	If a > 100000 Then 
		Exit Do
	End If
Loop