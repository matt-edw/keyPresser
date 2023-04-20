@echo off
:start
set "VBSFILE=%temp%\toggle.vbs"
echo Set wshShell = CreateObject("WScript.Shell") > "%VBSFILE%"
echo wshShell.SendKeys "{NUMLOCK}" >> "%VBSFILE%"
echo wshShell.SendKeys "{SCROLLLOCK}" >> "%VBSFILE%"
cscript //nologo "%VBSFILE%"
del "%VBSFILE%"
set /a foreground=(%random% %% 6) + 1
color 0%foreground%
set timestamp=%time:~0,5%
cls
echo Running as of %timestamp%
ping -n 10 127.0.0.1 > nul
goto start
