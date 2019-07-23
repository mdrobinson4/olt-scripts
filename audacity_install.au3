install()

Run("ffmpeg-win-2.2.2.exe")

Func install()
	Local $win1 = WinWait("Select Setup Language", "OK")
	ControlClick("Select Setup Language", "OK", 657008)
	Local $win2 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Next >")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", 263854)
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", 263854)
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", 263854)
	; just in case "Folder Exists" dialog appears
	Local $win3 = WinWait("Folder Exists", "", 3)
	If Not $win3 == 0 Then
		ControlClick("Folder Exists", "&Yes", 6)
	EndIf
	Local $win4 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Install")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Install", 263854)
	Local $win5 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Finish")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Finish", 263854)
EndFunc




