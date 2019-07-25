audacity()
ffmpeg()

; Prevent audacity opening
Func audacity()
	; start the installer
	Run("audacity-win-2.3.2.exe")
	; wait for the select language pop up to appear
	Local $win1 = WinWait("Select Setup Language", "OK")
	ControlClick("Select Setup Language", "OK", "[CLASS:TNewButton]")
	; wait for installer window to appear
	Local $win2 = WinWait("Setup - Audacity", "&Next >")
	; proceed through installation
	ControlClick($win2, "&Next >", "[CLASSNN:TNewButton1]")
	ControlClick($win2, "&Next >", "[CLASSNN:TNewButton2]")
	ControlClick($win2, "&Next >", "[CLASSNN:TNewButton3]")

	; just in case "Folder Exists" dialog appears
	; this folder will appear if the user has previously installed audacity
	Local $win3 = WinWait("Folder Exists", "&Yes", 3)
	; if the window appears, click yes to overwrite folder
	If Not $win3 = 0 Then
		ControlClick($win3, "&Yes", 6)
	EndIf

	; wait for the main installation window to appear again
	Local $win4 = WinWait("Setup - Audacity", "&Next >")
	; proceed by selecting the next button
	ControlClick("Setup - Audacity", "&Next >", "[CLASSNN:TNewButton3]")
	; finally, begin the program installation
	ControlClick("Setup - Audacity", "&Install", "[CLASSNN:TNewButton3]")
	; wait for the installation to finish (wait for Next button to appear)
	Local $win5 = WinWait("Setup - Audacity", "&Next >")
	; proceed to next window and finish
	ControlClick("Setup - Audacity", "&Next >", "[CLASSNN:TNewButton3]")
	ControlClick("Setup - Audacity", "&Finish", "[CLASSNN:TNewButton3]")

	; if audacity tries to open after installation, close it
	; this is necessary because ffmpeg cannot install if audacity is open
	Local $prog = WinWait("Audacity", "", 3)

	If Not $prog = 0 Then
		WinKill("Audacity", "")
	EndIf
EndFunc

; ffmpeg installer
Func ffmpeg()
	; start installer
	Run("ffmpeg-win-2.2.2.exe")
	; select language
	Local $win1 = WinWait("Select Setup Language", "OK")
	ControlClick("Select Setup Language", "OK", "[CLASS:TNewButton]")
	; proceed through setup
	Local $win2 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Next >")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", "[CLASS:TNewButton]")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", "[CLASSNN:TNewButton2]")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Next >", "[CLASSNN:TNewButton3]")

	; just in case "Folder Exists" dialog appears
	; this condition is necessary because the folder
	; may or may not exist
	Local $win3 = WinWait("Folder Exists", "&Yes", 3)

	If Not $win3 = 0 Then
		ControlClick("Folder Exists", "&Yes", 6)
	EndIf

	; proceed through insallation
	Local $win4 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Install")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Install", "[CLASSNN:TNewButton3]")

	Local $win5 = WinWait("Setup - FFmpeg (Windows) for Audacity", "&Finish")
	ControlClick("Setup - FFmpeg (Windows) for Audacity", "&Finish", "[CLASSNN:TNewButton3]")
EndFunc




