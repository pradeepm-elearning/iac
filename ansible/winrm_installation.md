# ANSIBLE | PLAYBOOK | WINRM | SETUP

#### 1. LOCAL USER WITH ADMINISTRATIVE PRIVILEGES
Can be create manually using traditional way

#### 2. DOT NET VERSION
`Get-Host | Select-Object Version`

#### 3. INSTALLATION STATUS OF WINRM
`winrm get winrm/config/Service`
`winrm get winrm/config/Winrs`
`winrm enumerate winrm/config/Listener`

#### 4. WINRM SETUP
REFER THE LINK: [ANSIBLE | WINDOWS | WINRM | SETUP](https://docs.ansible.com/projects/ansible-core/2.13/user_guide/windows_setup.html)
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Install-WMF3Hotfix.ps1"
$file = "$env:temp\Install-WMF3Hotfix.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose
```

#### 5. VERIFICATION OF WINRM
`winrm get winrm/config/Service`
`winrm get winrm/config/Winrs`
`winrm enumerate winrm/config/Listener`
