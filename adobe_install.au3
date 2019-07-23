install()

Func install()
    ; Run installation
    Run("ADE_4.5_Installer.exe")

    ; Wait 10 seconds for the Notepad window to appear.
    Local $hWnd = WinWait("Adobe Digital Editions 4.5.10 Setup: License Agreement", "")

    ; Send a mouse click to the edit control of Notepad using the handle returned by WinWait.
    ControlClick("Adobe Digital Editions 4.5.10 Setup: License Agreement", "I &accept the terms of the License Agreement", 1034)
	ControlClick("Adobe Digital Editions 4.5.10 Setup: License Agreement", "&Next >", 1)
	ControlClick("Adobe Digital Editions 4.5.10 Setup", "&Next >", 1)
	ControlClick("Adobe Digital Editions", "&Install", 1)
	; Decline offer to install norton
	Local $win = WinWait("Installing Adobe Digital Editions", "", 10)
	If Not $win == 0 Then
		ControlClick("Installing Adobe Digital Editions", "No, Thank You", 1076)
	EndIf
	Local $win2 = WinWaitActive("Adobe Digital Editions 4.5.10 Setup", "")
	Do
		Sleep(100)
	Until ControlCommand ( "Adobe Digital Editions 4.5.10 Setup", "&Close", 1, "IsEnabled", "")
	ControlClick("Adobe Digital Editions 4.5.10 Setup", "&Close", 1)
EndFunc
