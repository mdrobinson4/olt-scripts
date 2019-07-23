install()

Func install()
    ; Run Notepad
    Run("C:\Users\mdrobinson4\Downloads\ADE_4.5_Installer.exe")

    ; Wait 10 seconds for the Notepad window to appear.
    Local $hWnd = WinWait("Adobe Digital Editions 4.5.10 Setup: License Agreement", "")

    ; Send a mouse click to the edit control of Notepad using the handle returned by WinWait.
    ControlClick("Adobe Digital Editions 4.5.10 Setup: License Agreement", "I &accept the terms of the License Agreement", 1034)
	ControlClick("Adobe Digital Editions 4.5.10 Setup: License Agreement", "&Next >", 1)
	ControlClick("Adobe Digital Editions 4.5.10 Setup", "&Install >", 1)
	WinWaitActive("Installing Adobe Digital Editions", "No, Thank You")
	ControlClick("Installing Adobe Digital Editions", "No, Thank You", 1146)
	WinWait("Adobe Digital Editions 4.5.10 Setup", "&Close", 10)
	ControlClick("Adobe Digital Editions 4.5.10 Setup", "&Close", 1)
    WinClose($hWnd)
EndFunc   ;==>Example