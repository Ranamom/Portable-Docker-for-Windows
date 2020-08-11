:各種ソフトウェアのURL
set ALPINE_URL="http://dl-cdn.alpinelinux.org/alpine/v3.12/releases/x86_64/alpine-virt-3.12.0-x86_64.iso"
set QEMU_URL="https://qemu.weilnetz.de/w64/2020/qemu-w64-setup-20200805.exe"
set UNIEXT_URL="https://github.com/Bioruebe/UniExtract2/releases/download/v2.0.0-rc.2/UniExtractRC2.zip"
set TERATERM_URL="https://ja.osdn.net/frs/redir.php?m=jaist&f=ttssh2%%2F72009%%2Fteraterm-4.105.zip"
set DOCKERCLI_URL="https://github.com/StefanScherer/docker-cli-builder/releases/download/19.03.12/docker.exe"
set DOCKERCMP_URL="https://github.com/docker/compose/releases/download/1.26.2/docker-compose-Windows-x86_64.exe"

:各種ソフトウェアのパス
set APP_DIR=app
set ALPINE_DIR=%APP_DIR%\alpine
set QEMU_DIR=%APP_DIR%\qemu
set UNIEXT_DIR=%APP_DIR%\uniext
set TERATERM_DIR=%APP_DIR%\teraterm
set DOCKERCLI_DIR=%APP_DIR%\docker
set DOCKERCMP_DIR=%APP_DIR%\docker

:各種ソフトウェアのファイル名
set ALPINE_FILE=alpine.iso
set QEMU_FILE=qemu.exe
set UNIEXT_FILE=uniext.zip
set TERATERM_FILE=teraterm.zip
set DOCKERCLI_FILE=docker.exe
set DOCKERCMP_FILE=docker-compose.exe

:解凍後のフォルダ名
set UNIEXT_PATH=%UNIEXT_DIR%\UniExtract
set TERATERM_PATH=%TERATERM_DIR%\teraterm-4.105
set QEMU_PATH=%QEMU_DIR%
