@echo off
call "%~dp0\script\boot.bat"
echo Linux���N�����Ă��܂��B���΂炭���҂���������...
call "%~dp0\script\startwait.bat"
if %ERRORLEVEL% EQU 0 exit /b 0
echo �ڑ��Ɏ��s���܂����BQemu���N�����Ă��Ȃ��悤�ł��B
pause
exit /b -1