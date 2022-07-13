stern routing --since=1s --color=never | ForEach-Object {
    $color = if ($PSItem -match "v1") {
        "Green"
    }
    elseif ($PSItem -match "v2") {
        "Red"
    }
    elseif ($PSItem -match "v3") {
        "Blue"
    }
    else {
        "White"
    }
    Write-Host `
        -Object $PSItem `
        -ForegroundColor $color
}