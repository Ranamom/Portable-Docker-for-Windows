@echo off
echo Linuxを起動しています。しばらくお待ちください...
CALL %~dp0\start.bat
CALL %~dp0\startwait.bat
CALL %~dp0\script\dockerconfig.bat

cmd