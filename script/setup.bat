@echo off
set /P ANSWER="�Z�b�g�A�b�v���J�n���܂��B��낵���ł��� (Y/N)�H"

if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)

exit

:yes

echo �Z�b�g�A�b�v���J�n���܂�...

call %~dp0\download.bat

call %~dp0\config.bat

echo HDD�C���[�W�쐬...

%~dp0\..\apps\qemu\qemu-img create -f qcow2 %~dp0\..\%QEMU_HDD_PATH% %QEMU_HDD_DEF_SIZE%

echo Qemu�N��...

start /min %~dp0\..\%QEMU_PATH% %QEMU_DISPLAY_MODE% %QEMU_SERIAL_OPT% %QEMU_CLOCK_OPT% -smp 2 -boot d -m %QEMU_USE_MEMORY% -net nic,model=virtio -net %QEMU_NET_OPTION% -hda %~dp0\..\%QEMU_HDD_PATH% -cdrom %~dp0\..\%QEMU_ISO_PATH%

echo �C���X�g�[���}�N�� �N��...

start /w %~dp0\..\%TERATERM_PATH%\ttpmacro.exe %~dp0\install.ttl

echo Qemu�ċN��...

start /min %~dp0\..\%QEMU_PATH% %QEMU_DISPLAY_MODE% %QEMU_SERIAL_OPT% %QEMU_CLOCK_OPT% -smp 2 -m %QEMU_USE_MEMORY% -net nic,model=virtio -net %QEMU_NET_OPTION% -hda %~dp0\..\%QEMU_HDD_PATH%

echo �Z�b�g�A�b�v�}�N�� �N��...

start /w %~dp0\..\%TERATERM_PATH%\ttpmacro.exe %~dp0\setup.ttl

echo �Z�b�g�A�b�v���I�����܂���

pause
