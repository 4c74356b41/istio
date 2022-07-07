$colors = @{
  v1 = "Green"
  v2 = "Red"
  v3 = "Blue"
}

while ($true) {
  try {
    $result = Invoke-RestMethod -Uri http://10.1.0.6:81/hello -UseBasicParsing
    Write-Host `
      -Object ( "version: {0}, hostname: {1}, delay: {2}" -f $result.version, $result.hostname, $result.delay ) `
      -ForegroundColor $colors[$result.version]
  }
  catch {
    $PSItem.Exception
  }
  Start-Sleep -Milliseconds 250
}
