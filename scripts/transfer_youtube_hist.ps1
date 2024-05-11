params(
    [string]$takeout = $HOME
)
$data = Get-Content -Path "$takeout/YouTube and YouTube Music/history/watch-history.json" | ConvertFrom-Json
$urls = $data.titleUrl | Select-Object -Unique                                                                           
$reversedUrls = $urls.Clone()                 
[Array]::Reverse($reversedUrls)
$commands = for ($i = 0; $i -lt $reversedUrls.Count; $i++) {"/yt-dlp.exe --quiet --cookies-from-browser chrome --simulate --mark-watched $($reversedUrls[$i])" + "rn" + "echo Progress: $i / $($reversedUrls.Count)" }
	$commands | Out-File -FilePath "./youtube-hist-transfer-commands.bat"
