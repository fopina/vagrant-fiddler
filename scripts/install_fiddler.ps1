If (Test-Path 'C:\Program Files\Fiddler2\Fiddler.exe') {
  "Fiddler2 already installed"
} Else {
  # Download Fiddler2 (link from https://www.telerik.com/download/fiddler/fiddler2)

  $url = "https://d585tldpucybw.cloudfront.net/docs/default-source/fiddler/fiddler2setup.exe"
  $path = "C:\Windows\temp\fiddler2setup.exe"

  "Downloading [$url]"
  "Saving at [$path]"

  $client = new-object System.Net.WebClient
  $client.DownloadFile($url, $path)

  # Silently install it

  "Installing Fiddler2 with:"
  "[$path] /S"
  & $path /S
}
