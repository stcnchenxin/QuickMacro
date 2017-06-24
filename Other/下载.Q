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
MacroID=d316d9f0-b06b-4a13-b036-ec574df03749
Description=обть
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

[Attachment]
UEsDBBQAAgAIADx6rEpG2ZMR+AEAAPYGAAAOABEAc3BlZWRfMF9rYi5ibXBVVA0ABxrSFVka0hVZGdIVWXPy/cbGAAZmQKwBxAZAzAPEjAwSYPEDUHlkcOXN11GEB3WdeiVnm8vJzueqI7ZvVf2VN+9Tdj5Ltba9cu/AZWyyWAWJt27/m6/inmumekpfeXP39Juvzj1ntcXk164qAAoyg4GETXtzsMrJ+2f8pp93UlI/d3pm0o6nqVY2QPesf/QVUxarIBnuufjmbuqGRzLiZpv6gva/eQ0RvPzmroak+fEdhUCVy+59ldYp3Nxtf+XNO4jewoOvMGULDz7Go4V497SdviquFDGvyPLKy0fIgWYrrXjpwiKgyl0vv0o4L5wTqXLlzUOIXu/VDzBlvVefxaOFSPekW0lKWae1h6tfeXIF2ZHA8HGUkr5ydQ1azEL0Oi7DIuu47DgeLUS6h5WFOVab79LNrciCkPRjI6N28dw8iGfFnRfODlW68uYBRFnwhkeYssEbzuHRQqR7gvRF1fR9tk6NvPLmDbK/zr++qybrcGxbHiQxiOsUrq0zv/LmFURv/Yl3mLL1Jx7j0UKke6Z4SpfsPW+s7nF4Q+mVN5+Qw1nWa2a9r/LJeyd8p583klA5dbAZrnf706+YslgFychf59/cjVp6x03D+PSxyXDBS2/uzrjyXsO3npVLzFiOd+PUtCuvXyJrxyqLXwvx5c/J11+dO07Gm2juuroenn4GW/kMAFBLAQIXCxQAAgAIADx6rEpG2ZMR+AEAAPYGAAAOAAkAAAAAAAAAIACAgQAAAABzcGVlZF8wX2tiLmJtcFVUBQAHGtIVWVBLBQYAAAAAAQABAEUAAAA1AgAAAAA=


[Script]

Do 
FindPic 967,156,1303,417,"Attachment:\speed_0_kb.bmp",0.9,intX,intY
If intX > 0 And intY > 0 Then 
	Call ReStarDownload()
End If
Delay 2000
Loop 
Sub ReStarDownload()
	MoveTo 841, 206
	Delay 500
	LeftClick 1
	Delay 1000
	MoveTo 811, 206
	Delay 500
	LeftClick 1
	Delay 10000
End Sub
