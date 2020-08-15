@echo off
call "%~dp0\downloadconfig.bat"

echo �_�E�����[�h�E�W�J���J�n���܂��B

: �e�f�B���N�g���̐�΃p�X���擾(msiexec����΃p�X�����󂯕t���Ȃ�����)
for /f "usebackq" %%A in (`powershell -Command "convert-path %~dp0\.."`) do set BASEDIR=%%A

echo %BASEDIR%

echo curl�v���O�����̑��݊m�F...
where curl
if %ERRORLEVEL% NEQ 0 (
    echo curl��������Ȃ����߃Z�b�g�A�b�v�𑱍s�ł��܂���BPortableGit�Ƀp�X��ʂ��K�v������܂��B
    pause
    exit /b -1
)

: PortableGit�_�E�����[�h�E�C���X�g�[��
if not defined LIGHT_MODE_INSTALL (
    if not exist "%BASEDIR%\%WINGIT_DIR%" (
        mkdir "%BASEDIR%\%WINGIT_DIR%"
        echo PortableGit �_�E�����[�h...
        curl -L -o "%BASEDIR%\%WINGIT_DIR%\%WINGIT_FILE%"  %WINGIT_URL%
        echo PortableGit �W�J...
        start /w "" "%BASEDIR%\%WINGIT_DIR%\%WINGIT_FILE%" -o"%BASEDIR%\%WINGIT_DIR%" -y
    )
) else (
    echo LIGHT���[�h�C���X�g�[���̂��߁APortableGit�̃_�E�����[�h�E�C���X�g�[�����X�L�b�v���܂��B
)

: �t�H���_�쐬
echo �t�H���_�쐬...
mkdir "%BASEDIR%\%ALPINE_DIR%"
mkdir "%BASEDIR%\%QEMU_DIR%"
mkdir "%BASEDIR%\%SEVENZ_DIR%"
mkdir "%BASEDIR%\%TERATERM_DIR%"
: LIGHT_MODE_INSTALL�ł�Docker CLI/Docker Compose�̓C���X�g�[�����Ȃ��̂Ńt�H���_���쐬���Ȃ��B
if not defined LIGHT_MODE_INSTALL (
    mkdir "%BASEDIR%\%DOCKER_DIR%"
)

: �_�E�����[�h
echo Alpine Linux �_�E�����[�h...
curl -L -o "%BASEDIR%\%ALPINE_DIR%\%ALPINE_FILE%"  %ALPINE_URL%
echo Qemu �_�E�����[�h...
curl -L -o "%BASEDIR%\%QEMU_DIR%\%QEMU_FILE%"  %QEMU_URL%
echo 7-Zip �_�E�����[�h...
curl -L -o "%BASEDIR%\%SEVENZ_DIR%\%SEVENZ_FILE%"  %SEVENZ_URL%
echo Teraterm �_�E�����[�h...
curl -L -o "%BASEDIR%\%TERATERM_DIR%\%TERATERM_FILE%"  %TERATERM_URL%

: Docker CLI/Docker Compose�̃_�E�����[�h�B
if not defined LIGHT_MODE_INSTALL (
    echo Docker CLI �_�E�����[�h...
    curl -L -o "%BASEDIR%\%DOCKER_DIR%\%DOCKERCLI_FILE%"  %DOCKERCLI_URL%
    echo Docker-Compose �_�E�����[�h...
    curl -L -o "%BASEDIR%\%DOCKER_DIR%\%DOCKERCMP_FILE%"  %DOCKERCMP_URL%
) else (
    echo LIGHT���[�h�C���X�g�[���̂��߁ADocker CLI / Docker Compose�̃_�E�����[�h���X�L�b�v���܂��B
)

echo 7-zip�W�J...
msiexec /passive /a "%BASEDIR%\%SEVENZ_DIR%\%SEVENZ_FILE%" targetdir="%BASEDIR%\%SEVENZ_DIR%\7z"

echo Teraterm �W�J...
"%BASEDIR%\%SEVENZ_PATH%\7z.exe" x -y -o"%BASEDIR%\%TERATERM_DIR%\" "%BASEDIR%\%TERATERM_DIR%\%TERATERM_FILE%" 

echo Qemu �W�J...
"%BASEDIR%\%SEVENZ_PATH%\7z.exe" x -y -o"%BASEDIR%\%QEMU_DIR%\" "%BASEDIR%\%QEMU_DIR%\%QEMU_FILE%" 

: LIGHT���[�h�C���X�g�[���ł͎g���Ȃ�bat���폜
if defined LIGHT_MODE_INSTALL (
    echo LIGHT���[�h�ł͎g���Ȃ��o�b�`�t�@�C�����폜���܂��B
    del /q "%BASEDIR%\script\dockerconfig.bat"
    del /q "%BASEDIR%\dockerconsole.bat"
    del /q "%BASEDIR%\dockerbash.bat"
)

echo �_�E�����[�h�E�W�J���I�����܂����B