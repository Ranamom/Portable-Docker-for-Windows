:QEMU�̎��s�t�@�C���̃p�X
SET QEMU_PATH=apps\qemu\qemu-system-x86_64.exe

:QEMU�̃f�B�X�v���C���[�h
:SET QEMU_DISPLAY_MODE=-display sdl
:SET QEMU_DISPLAY_MODE=-nographic
SET QEMU_DISPLAY_MODE=-display none

:QEMU�pTELNET�ڑ��|�[�g
SET QEMU_SERIAL_PORT=4321

:QEMU�pTELNET�ڑ��I�v�V����
SET QEMU_SERIAL_OPT=-serial telnet:localhost:%QEMU_SERIAL_PORT%,server,nowait

:QEMU�̃��A���^�C���N���b�N(���v)�I�v�V����
SET QEMU_CLOCK_OPT=-rtc clock=vm,base=utc

:QEMU�Ŏg�p���郁������(MB�P��)
SET QEMU_USE_MEMORY=2048

:HDD�t�@�C���̃p�X
SET QEMU_HDD_PATH=Linux.qcow2

:����������HDD�t�@�C���̍ő�T�C�Y
SET QEMU_HDD_DEF_SIZE=10G

:iso�t�@�C���̃p�X
SET QEMU_ISO_PATH=apps\alpine\Alpine.iso

:SSH�̃p�X
SET SSH_PATH=ssh.exe
:SET SSH_PATH=%APPDIR%\git\usr\bin\ssh.exe

:�l�b�g���[�N�֌W�̃I�v�V�����ݒ�
SET QEMU_NET_OPTION=user
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::22-:22
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::80-:80
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::443-:443
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::2222-:2222
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::2375-:2375
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::8000-:8000
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::8080-:8080
SET QEMU_NET_OPTION=%QEMU_NET_OPTION%,hostfwd=tcp::9000-:9000

:SSH���O�C�����̃��[�U�[��
SET SSH_USERNAME=root

:SSH�T�[�o�[�̃|�[�g
SET SSH_PORT=22

:SSH���F�؊֌W�I�v�V����
:SET SSH_KEYOPT=-i %HOME%\.ssh\id_rsa
SET SSH_KEYOPT=

:�V���b�g�_�E���R�}���h
SET HALTCOMMAND=poweroff

:�x�[�X�t�H���_
SET BASEDIR=%~dp0\..

:�X�N���v�g�t�H���_
SET SCRIPTDIR=%~dp0
