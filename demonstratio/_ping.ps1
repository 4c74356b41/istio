$colors = @{
  v1 = "Green"
  v2 = "Red"
  v3 = "Blue"
}

while ($true) {
  try {
    $result = Invoke-RestMethod -Uri http://10.1.0.6:81/hello -UseBasicParsing
    Write-Host `
      -Object ( "{0}: ver={1}; delay={2}" -f $result.hostname, $result.version, $result.delay ) `
      -ForegroundColor $colors[$result.version]
  }
  catch {
    $PSItem.Exception
  }
  Start-Sleep -Milliseconds 250
}
