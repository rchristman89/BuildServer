Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Clonning Core Repo'
Git clone "https://scmpeoc3t.army.mil/RPS/MissionNetwork/_git/Core" "C:\Repos\Core"
Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Cloned Core Repo'

Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Performing NuGet Restore'
$command = '. "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\ReadyRoll\OctoPack\build\NuGet.exe" install "C:\packages.config" -OutputDirectory "C:\Repos\Core\Source\Solutions"'
Invoke-Expression $command
Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Completed NuGet Restore'

Start-Process powershell -ArgumentList 'C:\Repos\Core\Build\start.ps1 -Task CI.DscModule'
Start-Process powershell -ArgumentList 'C:\Repos\Core\Build\start.ps1 -Task CI.PowerShell'