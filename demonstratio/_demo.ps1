$env:KUBECONFIG = "C:\Users\core\OneDrive\_git\zounds\_k8s_secops"
$steps = (
    @{
        hint   = "set up"
        filter = "_setup*"
    },
    @{
        hint   = "v1 only"
        filter = "01-*"
    },
    @{
        hint   = "v2 only (2s delay)"
        filter = "02-*"
    },
    @{
        hint   = "v1 and v3 canary"
        filter = "03-*"
    },
    @{
        hint   = "v1 with v3 traffic mirroring"
        filter = "04-*"
    },
    @{
        hint   = "v1 with fault injection"
        filter = "05-*"
    },
    @{
        hint   = "all versions with strict timeout"
        filter = "06-*"
    },
    @{
        hint   = "all versions with outlierDetection"
        filter = "07-*"
    },
    @{
        hint   = "clean up"
        filter = "_setup*"
    }
)

foreach ($step in $steps) {
    Write-Host -ForegroundColor Green $step.hint
    $currentYaml = Get-ChildItem -File -Filter $step.filter
    $currentYaml.foreach{
        if ( $step.hint -ne "clean up" ) {
            Get-Content $PSItem.FullName -Raw | Write-Host
            Read-Host " "
            Write-Host ""
            Write-Host ""
            Write-Host ""
            kubectl apply -f $PSItem.FullName | Out-Null
        }
        else {
            kubectl delete -f $PSItem.FullName | Out-Null
        }
    }
}
