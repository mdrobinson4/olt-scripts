audacity()
ffmgeg()

; Prevent audacity ofrom opening
Func audacity()
	Run("audacity-win-2.3.2.exe")
	Local $win1 = WinWait("Select Setup Language", "OK")
	ControlClick("Select Setup Language", "OK", "[CLASS:TNewButton]")
	Local $win2 = WinWait("Setup - Audacity", "&Next >")
	ControlClick("Setup - Audacity", "&Next >", "[CLASSNN:TNewButton1]")
	ControlClick("Setup - Audacity", "&Next >", "[CLASSNN:TNewButton2]")
	ControlClick("Setup - Audacity", "&Next >", "[CLASSNN:TNewButton3]")

	; just in case "Folder Exists" dialog appears
	Local $win3 = WinWait("Folder Exists", "&Yes", 3)

	If Not $win3 = 0 Then
		ControlClick("Folder Exists", "&Yes", 6)
	EndIf

	Local $win4 = WinWait("Setup - Audacity", "&Next >")
	ControlClick("Setup - Audacity", "&Next >", "[CLASSNN:TNewButton3]")
	ControlClick("Setup - Audacity", "&Install", "[CLASSNN:TNewButton3]")
	Local $x = WinWait("Setup - Audacity", "&Next >")
	ControlClick("Setup - Audacity", "&Next >", "[CLASSNN:TNewButton3]")
	ControlClick("Setup - Audacity", "&Finish", "[CLASSNN:TNewButton3]")

	Local $win5 = WinWait("Audacity", "", 3)

	If Not $win5 = 0 Then
		WinKill("Audacity", "")
	EndIf
EndFunc

Func ffmgeg()
	Run("ffmpeg-win-2.2.2.exe")
	Local $win1 = WinWait("Select Setup Language", "OK")
	ControlClick("Select Setup Language", "OK", "[CLASS:TNewButton]")
	Local $win2 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Next >")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", "[CLASS:TNewButton]")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", "[CLASSNN:TNewButton2]")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", "[CLASSNN:TNewButton3]")

	; just in case "Folder Exists" dialog appears
	Local $win3 = WinWait("Folder Exists", "&Yes", 3)

	If Not $win3 = 0 Then
		ControlClick("Folder Exists", "&Yes", 6)
	EndIf

	Local $win4 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Install")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Install", "[CLASSNN:TNewButton3]")

	; Add code

	Local $win5 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Finish")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Finish", "[CLASSNN:TNewButton3]")
EndFunc




