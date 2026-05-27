$ErrorActionPreference = 'Stop'

$bashPath = 'C:\Program Files\Git\bin\bash.exe'
$workingDir = 'C:\Repos\idan\contribution-activity'
$bashCommand = 'cd /c/Repos/idan/contribution-activity && chmod +x contribution-activity.sh && ./contribution-activity.sh'
$stdoutLog = 'C:\Repos\idan\contribution-activity\task-runner.out.log'
$stderrLog = 'C:\Repos\idan\contribution-activity\task-runner.err.log'

if (-not (Test-Path $bashPath)) {
    throw "Git Bash not found at $bashPath"
}

$process = Start-Process -FilePath $bashPath `
    -ArgumentList "-lc \"$bashCommand\"" `
    -WorkingDirectory $workingDir `
    -WindowStyle Hidden `
    -RedirectStandardOutput $stdoutLog `
    -RedirectStandardError $stderrLog `
    -PassThru `
    -Wait

exit $process.ExitCode
