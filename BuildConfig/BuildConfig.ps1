git config --global http.sslverify false
git config --global credential.helper wincred
git config --global credential.scmpeoc3t.army.mil.authority negotiate

Install-Module Pester -Force -SkipPublisherCheck

Update-Help

winrm quickconfig



New-Item 'C:\Repo' -ItemType Directory
git clone "https://github.com/rchristman89/BuildServer.git" "C:\Repo"

$command = '. "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\MSBuild\ReadyRoll\OctoPack\build\NuGet.exe" install "C:\repo\packages.config" -OutputDirectory "C:\repo\source\Solutions\packages"'
Invoke-Expression $command