$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$bashPath = 'C:\Program Files\Git\bin\bash.exe'
$workingDir = 'C:\Repos\idan\contribution-activity'
$bashCommand = 'cd /c/Repos/idan/contribution-activity && chmod +x contribution-activity.sh && ./contribution-activity.sh'
$stdoutLog = Join-Path $env:TEMP 'contribution-activity-task.out.log'
$stderrLog = Join-Path $env:TEMP 'contribution-activity-task.err.log'

if (-not (Test-Path $bashPath)) {
    throw "Git Bash not found at $bashPath"
}

Set-Location $workingDir

# Task Scheduler already launches this PowerShell process hidden.
& $bashPath -lc $bashCommand 1>> $stdoutLog 2>> $stderrLog
exit $LASTEXITCODE
