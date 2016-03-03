# Import handmade configuration to registry

regedit /s C:\vagrant\scripts\fiddler_config.reg

# Create startup shortcut

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("C:\Users\IEUser\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\Fiddler2.lnk")
$Shortcut.TargetPath = "C:\Program Files\Fiddler2\Fiddler.exe"
$Shortcut.Save()

# Copy over customized CustomRules.js to be able to easily use the certificate installation page
# Fiddler2 only shows that page when it is accessed with 127.0.0.1/localhost/<NETBIOS name>
# The solution was to create a custom proxy rule to redirect all
# requests to http://my.fiddler to http://localhost:8888
# It's even nicer than original design! :)

mkdir C:\Users\IEUser\Documents\Fiddler2\Scripts -ErrorAction SilentlyContinue
cp C:\vagrant\scripts\CustomRules.js C:\Users\IEUser\Documents\Fiddler2\Scripts
