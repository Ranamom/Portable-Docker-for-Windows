@echo off
call "%~dp0\config.bat"

: ����������HDD�t�@�C���̍ő�T�C�Y(�f�t�H���g�l)
if not defined QEMU_HDD_DEF_SIZE (
    set QEMU_HDD_DEF_SIZE=10G
)

if exist "%~dp0\..\%QEMU_HDD_PATH%" (
    set /P ANSWER="HDD�C���[�W�����݂��܂��BHDD�C���[�W���̃f�[�^�͂��ׂď�������܂�����낵���ł��� (Y/N)�H"

    if /i {%ANSWER%}=={y} (goto :formatok)
    if /i {%ANSWER%}=={yes} (goto :formatok)

    exit
)

:formatok

echo HDD�C���[�W�쐬...
echo �ő�%QEMU_HDD_DEF_SIZE%B�̐ݒ��HDD�C���[�W���쐬���܂��B

"%~dp0\..\%QEMU_PATH%\qemu-img.exe" create -f qcow2 "%~dp0\..\%QEMU_HDD_PATH%" %QEMU_HDD_DEF_SIZE%

echo Qemu�N��...

start /min "Qemu" "%~dp0\..\%QEMU_EXE_PATH%" %QEMU_DISPLAY_MODE% %QEMU_SERIAL_OPT% %QEMU_CLOCK_OPT% -smp 2 -boot d -m %QEMU_USE_MEMORY% -net nic,model=virtio -net %QEMU_NET_OPTION% -hda "%~dp0\..\%QEMU_HDD_PATH%" -cdrom "%~dp0\..\%QEMU_ISO_PATH%"

echo �C���X�g�[���}�N�� �N��...

"%~dp0\..\%TERATERM_PATH%\ttpmacro.exe" /I "%~dp0\install.ttl"

echo Qemu�ċN��...

start /min "Qemu" "%~dp0\..\%QEMU_EXE_PATH%" %QEMU_DISPLAY_MODE% %QEMU_SERIAL_OPT% %QEMU_CLOCK_OPT% -smp 2 -m %QEMU_USE_MEMORY% -net nic,model=virtio -net %QEMU_NET_OPTION% -hda "%~dp0\..\%QEMU_HDD_PATH%"

echo �Z�b�g�A�b�v�}�N�� �N��...

"%~dp0\..\%TERATERM_PATH%\ttpmacro.exe" /I "%~dp0\setup.ttl"

echo �Z�b�g�A�b�v���I�����܂���