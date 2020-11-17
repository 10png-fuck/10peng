@echo off
if "%1"=="hide" goto CmdBegin
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit
:CmdBegin
tasklist /FI "IMAGENAME eq Ali_update.exe"
taskkill /F /IM Ali_update.exe
taskkill /F /IM AliHids.exe
taskkill /F /IM AliYunDun.exe
taskkill /F /IM AliYunDunUpdate.exe
taskkill /F /IM AliSecGuard.exe
taskkill /F /IM AliHips.exe
taskkill /F /IM AliNetFilter.exe
sc stop "Alibaba Security Aegis Detect Service"
sc stop "Alibaba Security Aegis Update Service"
sc delete "Alibaba Security Aegis Detect Service"
sc delete "Alibaba Security Aegis Update Service"

"C:\Program Files (x86)\Alibaba\Aegis\AliHips\AliHips.exe" --stopdriver
"C:\Program Files (x86)\Alibaba\Aegis\AliNet\AliNetFilter.exe" --stopdriver
"C:\Program Files (x86)\Alibaba\Aegis\AliSecGuard\AliSecGuard.exe" --stopdriver

rmdir /s /q "C:\Program Files (x86)\Alibaba\Aegis\aegis_client"
rmdir /s /q "C:\Program Files\Alibaba\Aegis\aegis_client"

ping update.aegis.aliyun.com -n 5>nul
rmdir /s /q "C:\Program Files (x86)\Alibaba\Aegis\aegis_client"
rmdir /s /q "C:\Program Files\Alibaba\Aegis\aegis_client"
rmdir /s /q "C:\Program Files (x86)\Alibaba\Aegis\aegis_update"
rmdir /s /q "C:\Program Files\Alibaba\Aegis\aegis_update"
rmdir /s /q "C:\Program Files (x86)\Alibaba\Aegis\alihids"
rmdir /s /q "C:\Program Files\Alibaba\Aegis\alihids"
rmdir /s /q "C:\Program Files (x86)\Alibaba\Aegis\globalcfg\domaincfg.ini"
rmdir /s /q "C:\Program Files\Alibaba\Aegis\globalcfg\domaincfg.ini"
del C:/Windows/temp/singleApp_aegisClient