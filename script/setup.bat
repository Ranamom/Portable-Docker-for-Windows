@echo off
call "%~dp0\config.bat"

if not exist "%~dp0\..\%QEMU_HDD_PATH%" goto :setupok

echo ���łɃC���X�g�[���ς݂̂悤�ł��B�Z�b�g�A�b�v�𒆒f���܂��B

pause

exit /b -1

:setupok

echo �Z�b�g�A�b�v���J�n���܂�...

call "%~dp0\download.bat"

if %ERRORLEVEL% EQU -1 goto :err

call "%~dp0\install.bat"

if %ERRORLEVEL% EQU -1 goto :err

goto :ok

:err
echo �Z�b�g�A�b�v�Ɏ��s���܂����B

pause

exit /b -1

:ok
echo �Z�b�g�A�b�v���I�����܂����B

pause