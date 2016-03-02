regedit /s C:\vagrant\scripts\fiddler_config.reg

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\IEUser\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Fiddler2.lnk")
$Shortcut.TargetPath = "C:\Program Files\Fiddler2\Fiddler.exe"
$Shortcut.Save()
