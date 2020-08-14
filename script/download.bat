@echo off
call "%~dp0\downloadconfig.bat"

echo �_�E�����[�h�E�W�J���J�n���܂��B

echo curl�v���O�����̑��݊m�F...
where curl
if %ERRORLEVEL% NEQ 0 (
    echo curl��������Ȃ����߃Z�b�g�A�b�v�𑱍s�ł��܂���BPortableGit�Ƀp�X��ʂ��K�v������܂��B
    pause
    exit -1
)

: PortableGit�_�E�����[�h�E�C���X�g�[��
if not defined LIGHT_MODE_INSTALL (
    if not exist "%~dp0\..\%WINGIT_DIR%" (
        mkdir "%~dp0\..\%WINGIT_DIR%"
        echo PortableGit �_�E�����[�h...
        curl -L -o "%~dp0\..\%WINGIT_DIR%\%WINGIT_FILE%"  %WINGIT_URL%
        echo PortableGit �W�J...
        start /w "" "%~dp0\..\%WINGIT_DIR%\%WINGIT_FILE%" -o"%~dp0\..\%WINGIT_DIR%" -y
    )
) else (
    echo LIGHT���[�h�C���X�g�[���̂��߁APortableGit�̃_�E�����[�h�E�C���X�g�[�����X�L�b�v���܂��B
)

: �t�H���_�쐬
echo �t�H���_�쐬...
mkdir "%~dp0\..\%ALPINE_DIR%"
mkdir "%~dp0\..\%QEMU_DIR%"
mkdir "%~dp0\..\%UNIEXT_DIR%"
mkdir "%~dp0\..\%TERATERM_DIR%"
: LIGHT_MODE_INSTALL
if not defined LIGHT_MODE_INSTALL (
    mkdir "%~dp0\..\%DOCKER_DIR%"
)

: �_�E�����[�h
echo Alpine Linux �_�E�����[�h...
curl -L -o "%~dp0\..\%ALPINE_DIR%\%ALPINE_FILE%"  %ALPINE_URL%
echo Qemu �_�E�����[�h...
curl -L -o "%~dp0\..\%QEMU_DIR%\%QEMU_FILE%"  %QEMU_URL%
echo Universal Extractor 2 �_�E�����[�h...
curl -L -o "%~dp0\..\%UNIEXT_DIR%\%UNIEXT_FILE%"  %UNIEXT_URL%
echo Teraterm �_�E�����[�h...
curl -L -o "%~dp0\..\%TERATERM_DIR%\%TERATERM_FILE%"  %TERATERM_URL%

: LIGHT_MODE_INSTALL
if not defined LIGHT_MODE_INSTALL (
    echo Docker CLI �_�E�����[�h...
    curl -L -o "%~dp0\..\%DOCKER_DIR%\%DOCKERCLI_FILE%"  %DOCKERCLI_URL%
    echo Docker-Compose �_�E�����[�h...
    curl -L -o "%~dp0\..\%DOCKER_DIR%\%DOCKERCMP_FILE%"  %DOCKERCMP_URL%
) else (
    echo LIGHT���[�h�C���X�g�[���̂��߁ADocker CLI / Docker Compose�̃_�E�����[�h���X�L�b�v���܂��B
)

: unzip�Ń_�E�����[�h����zip��W�J�A�Ȃ����LIGHT���[�h���̂�Window10�W����tar���g��(Window10��tar��zip�𓀂�Window10�Ǝ��@�\�̖͗l)
echo �W�J�v���O�����̑��݊m�F...
where unzip
if %ERRORLEVEL% NEQ 0 (
    if not defined LIGHT_MODE_INSTALL (
        echo unzip��������Ȃ����߃Z�b�g�A�b�v�𑱍s�ł��܂���BPortableGit�Ƀp�X��ʂ��K�v������܂��B
        pause
        exit -1
    )
    if not exist %windir%\system32\tar.exe (
        echo �W�J�v���O������������Ȃ����߃Z�b�g�A�b�v�𑱍s�ł��܂���BPortableGit�Ƀp�X��ʂ��K�v������܂��B
        pause
        exit -1
    )
    echo tar�iWindows10�Łj���g���܂��B
    echo Universal Extractor �W�J...
    %windir%\system32\tar -xf "%~dp0\..\%UNIEXT_DIR%\%UNIEXT_FILE%" -C "%~dp0\..\%UNIEXT_DIR%"
    echo Teraterm �W�J...
    %windir%\system32\tar -xf "%~dp0\..\%TERATERM_DIR%\%TERATERM_FILE%" -C "%~dp0\..\%TERATERM_DIR%"
) else (
    echo unzip���g���܂��B
    echo Universal Extractor �W�J...
    unzip "%~dp0\..\%UNIEXT_DIR%\%UNIEXT_FILE%" -d "%~dp0\..\%UNIEXT_DIR%"
    echo Teraterm �W�J...
    unzip "%~dp0\..\%TERATERM_DIR%\%TERATERM_FILE%" -d "%~dp0\..\%TERATERM_DIR%"
)

echo Qemu �W�J...
"%~dp0\..\%UNIEXT_PATH%\bin\x86\7z.exe" x -y -o"%~dp0\..\%QEMU_DIR%\" "%~dp0\..\%QEMU_DIR%\%QEMU_FILE%" 

: LIGHT���[�h�C���X�g�[���ł͎g���Ȃ�bat���폜
if defined LIGHT_MODE_INSTALL (
    echo LIGHT���[�h�ł͎g���Ȃ��o�b�`�t�@�C�����폜���܂��B
    del /q "%~dp0\dockerconfig.bat"
    del /q "%~dp0\..\dockerconsole.bat"
    del /q "%~dp0\..\dockerbash.bat"
)

echo �_�E�����[�h�E�W�J���I�����܂����B