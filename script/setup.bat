@echo off
set /P ANSWER="�Z�b�g�A�b�v���J�n���܂��B��낵���ł��� (Y/N)�H"

if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)

exit

:yes

echo �Z�b�g�A�b�v���J�n���܂�...

call "%~dp0\config.bat"

call "%~dp0\download.bat"

call "%~dp0\install.bat"

pause
