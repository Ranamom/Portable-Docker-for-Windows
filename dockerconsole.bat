@echo off
echo Linux���N�����Ă��܂��B���΂炭���҂���������...
call %~dp0\start.bat
call %~dp0\startwait.bat

if errorlevel 0 goto start

echo �ڑ��Ɏ��s���܂����BQemu���N�����Ă��Ȃ��悤�ł��B

pause 

exit

:start

call %~dp0\script\dockerconfig.bat

cmd