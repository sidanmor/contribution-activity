Option Explicit

Dim shell, cmd, rc
Set shell = CreateObject("WScript.Shell")

cmd = """C:\Program Files\Git\bin\bash.exe"" -lc ""cd /c/Repos/idan/contribution-activity && chmod +x contribution-activity.sh && ./contribution-activity.sh"""

rc = shell.Run(cmd, 0, True)
WScript.Quit rc
