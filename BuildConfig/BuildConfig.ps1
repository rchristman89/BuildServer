﻿New-EventLog –LogName Application –Source 'BuildScript'

Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Configuring git'
git config --add --system http.sslverify false
git config --add --system credential.helper wincred
git config --add --system credential.scmpeoc3t.army.mil.authority negotiate
Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Configured git'

Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Installing Pester'
$null = Find-PackageProvider -Name 'Nuget' -ForceBootstrap -IncludeDependencies
Install-Module Pester -Force -SkipPublisherCheck -Confirm:$false
Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Installed Pester'

Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Updating Help'
Update-Help -Force -Confirm:$false
Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Updated Help'

Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Configuring WinRM'
$null = winrm quickconfig -quiet
Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Configured WinRM'

Write-EventLog -LogName Application -Source 'BuildScript' -EntryType Information -EventId 1 -Message 'Downloading Package list'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rchristman89/BuildServer/master/packages.config' -OutFile 'C:\packages.config'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/rchristman89/BuildServer/master/BuildConfig/BuildConfig2.ps1' -OutFile 'C:\DownloadRepo.ps1'