$url = "https://d585tldpucybw.cloudfront.net/docs/default-source/fiddler/fiddler2setup.exe"
$path = "C:\Windows\temp\fiddler2setup.exe"

"Downloading [$url]"
"Saving at [$path]"

$client = new-object System.Net.WebClient
$client.DownloadFile($url, $path)

"Installing Fiddler2 with:"
"[$path] /S"
& $path /S
