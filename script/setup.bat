@echo off
call "%~dp0\config.bat"

if not exist "%~dp0\..\%QEMU_HDD_PATH%" goto :setupok

echo ���łɃC���X�g�[���ς݂̂悤�ł��B�Z�b�g�A�b�v�𒆒f���܂��B

exit

:setupok

echo �Z�b�g�A�b�v���J�n���܂�...

call "%~dp0\download.bat"

call "%~dp0\install.bat"

echo �Z�b�g�A�b�v���I�����܂����B

pause