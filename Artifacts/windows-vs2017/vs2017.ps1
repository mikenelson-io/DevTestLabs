



$WebSource = "https://aka.ms/vs/15/release/vs_Enterprise.exe";
$dest = ( "${env:Temp}\vs_enterprise.exe");

try
{
    (New-Object System.Net.WebClient).DownloadFile($WebSource, $dest)
}
catch
{
    Write-Error "Failed to download vs2017 installer"
}

try
{
    & $dest  `
               --channelid  VisualStudio.15.Release `
               --productid Microsoft.VisualStudio.Product.Enterprise `
               --add Microsoft.VisualStudio.Workload.NetWeb  `
               --add Microsoft.VisualStudio.Workload.NetCoreTools `
               --add Microsoft.VisualStudio.Workload.ManagedDesktop `
               --add Microsoft.VisualStudio.Workload.Azure `
               --add Microsoft.VisualStudio.Workload.Data `
               --add Component.GitHub.VisualStudio `
               --add Microsoft.NetCore.ComponentGroup.DevelopmentTools `
               --add Microsoft.Net.Core.Component.SDK `
               --add Microsoft.VisualStudio.Component.PowerShell.Tools `
               --productKey NJVYC-BMHX2-G77MM-4XJMR-6Q8QF `
               --includeRecommended --passive | Out-Null
}
catch
{
    Write-Error 'Failed to install VS2017'
}

try
{

    & "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\IDE\StorePID.exe" NJVYC-BMHX2-G77MM-4XJMR-6Q8QF 8860 | Out-Null

}
catch
{
    Write-Error 'Failed to activate VS2017'
}



