git config --global http.sslverify false
git config --global credential.helper wincred
git config --global credential.scmpeoc3t.army.mil.authority negotiate

Find-PackageProvider -Name 'Nuget' -ForceBootstrap -IncludeDependencies
Install-Module Pester -Force -SkipPublisherCheck -Confirm:$false

Update-Help -Force -Confirm:$false

winrm quickconfig -quiet


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
New-Item 'C:\Repo' -ItemType Directory
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/rchristman89/BuildServer/master/packages.config" -OutFile "C:\packages.config"

$command = '. "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\ReadyRoll\OctoPack\build\NuGet.exe" install "C:\packages.config" -OutputDirectory "C:\NuGetpackages"'
Invoke-Expression $command