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

# Launch Bash as a hidden child process to avoid console popup flashes.
$process = Start-Process -FilePath $bashPath `
    -ArgumentList @('-lc', $bashCommand) `
    -WorkingDirectory $workingDir `
    -WindowStyle Hidden `
    -RedirectStandardOutput $stdoutLog `
    -RedirectStandardError $stderrLog `
    -PassThru `
    -Wait

$exitCode = $process.ExitCode

exit $exitCode
