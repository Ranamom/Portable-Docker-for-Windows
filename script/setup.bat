@echo off
call "%~dp0\config.bat"

if not exist "%~dp0\..\%QEMU_HDD_PATH%" goto :setupok

set /P ANSWER="���łɃC���X�g�[���ς݂̂悤�ł��B���s����Ɖ��zHDD�̃f�[�^�͂��ׂď�������A�ēx�t�@�C���̃_�E�����[�h����n�߂܂�����낵���ł��� (Y/N)�H"

if /i {%ANSWER%}=={y} (goto :formatok)
if /i {%ANSWER%}=={yes} (goto :formatok)

pause

exit

:formatok

del /q "%~dp0\..\%QEMU_HDD_PATH%"

:setupok

echo �Z�b�g�A�b�v���J�n���܂�...

call "%~dp0\download.bat"

call "%~dp0\install.bat"

pause
