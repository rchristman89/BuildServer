Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Performing NuGet Restore'
$command = '. "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\ReadyRoll\OctoPack\build\NuGet.exe" install "C:\packages.config" -OutputDirectory "C:\Repos\Core\Source\Solutions"'
Invoke-Expression $command
Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Completed NuGet Restore'