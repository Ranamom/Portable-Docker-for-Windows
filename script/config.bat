call "%~dp0\downloadconfig.bat"

:QEMU�̎��s�t�@�C���̃p�X
set QEMU_EXE_PATH=%QEMU_PATH%\qemu-system-x86_64.exe

:QEMU�̃f�B�X�v���C���[�h
:set QEMU_DISPLAY_MODE=-display sdl
:set QEMU_DISPLAY_MODE=-nographic
set QEMU_DISPLAY_MODE=-display none

:QEMU�pTELNET�ڑ��|�[�g
set QEMU_SERIAL_PORT=4321

:QEMU�pTELNET�ڑ��I�v�V����
set QEMU_SERIAL_OPT=-serial telnet:localhost:%QEMU_SERIAL_PORT%,server,nowait

:QEMU�̃��A���^�C���N���b�N(���v)�I�v�V����
set QEMU_CLOCK_OPT=-rtc clock=vm,base=utc

:QEMU�Ŏg�p���郁������(MB�P��)
set QEMU_USE_MEMORY=2048

:HDD�t�@�C���̃p�X
set QEMU_HDD_PATH=Linux.qcow2

:����������HDD�t�@�C���̍ő�T�C�Y
set QEMU_HDD_DEF_SIZE=10G

:ISO�t�@�C���̃p�X
set QEMU_ISO_PATH=%ALPINE_DIR%\Alpine.iso

:SSH�̃p�X
set SSH_PATH=ssh.exe
:set SSH_PATH="%~dp0\%APP_DIR%\git\usr\bin\ssh.exe"

:�l�b�g���[�N�֌W�̃I�v�V�����ݒ�
set QEMU_NET_OPTION=user
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::22-:22
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::80-:80
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::443-:443
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::2222-:2222
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::2375-:2375
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::8000-:8000
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::8080-:8080
set QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::9000-:9000

:SSH���O�C�����̃��[�U�[��
set SSH_USERNAME=root

:SSH�T�[�o�[�̃|�[�g
set SSH_PORT=22

:SSH���F�؊֌W�I�v�V����
:set SSH_KEYOPT=-i "%USERPROFILE%\.ssh\id_rsa"
set SSH_KEYOPT=

:�V���b�g�_�E���R�}���h
set HALTCOMMAND=poweroff

:�X�N���v�g�t�H���_(Teraterm�}�N���p)
set SCRIPTDIR=%~dp0
