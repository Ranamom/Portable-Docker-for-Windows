call "%~dp0\downloadconfig.bat"

echo curl�v���O�����̑��݊m�F...
where curl
if %ERRORLEVEL% NEQ 0 (
    echo curl��������Ȃ����߃Z�b�g�A�b�v�𑱍s�ł��܂���B
    exit -1
)

:�t�H���_�쐬
echo �t�H���_�쐬...
mkdir "%~dp0\..\%ALPINE_DIR%"
mkdir "%~dp0\..\%QEMU_DIR%"
mkdir "%~dp0\..\%UNIEXT_DIR%"
mkdir "%~dp0\..\%TERATERM_DIR%"
mkdir "%~dp0\..\%DOCKERCLI_DIR%"
:mkdir "%~dp0\..\%DOCKERCMP_DIR%"

:�_�E�����[�h
echo Alpine Linx �_�E�����[�h...
curl -L -o "%~dp0\..\%ALPINE_DIR%\%ALPINE_FILE%"  %ALPINE_URL%
echo Qemu �_�E�����[�h...
curl -L -o "%~dp0\..\%QEMU_DIR%\%QEMU_FILE%"  %QEMU_URL%
echo Universal Extractor 2 �_�E�����[�h...
curl -L -o "%~dp0\..\%UNIEXT_DIR%\%UNIEXT_FILE%"  %UNIEXT_URL%
echo Teraterm �_�E�����[�h...
curl -L -o "%~dp0\..\%TERATERM_DIR%\%TERATERM_FILE%"  %TERATERM_URL%
echo Docker CLI �_�E�����[�h...
curl -L -o "%~dp0\..\%DOCKERCLI_DIR%\%DOCKERCLI_FILE%"  %DOCKERCLI_URL%
echo Docker-Compose �_�E�����[�h...
curl -L -o "%~dp0\..\%DOCKERCMP_DIR%\%DOCKERCMP_FILE%"  %DOCKERCMP_URL%

:�_�E�����[�h�����t�@�C���̓W�J
:PATH��unzip�������unzip���g���A�Ȃ����Window10�W����tar���g��(Window10��tar��zip�𓀂�Window10�Ǝ��@�\�̖͗l)
echo �W�J�v���O�����̑��݊m�F...
set EXPAND_CMD=unzip
set EXPAND_OPT=
set EXPAND_DIR_OPT=-d

where %EXPAND_CMD%
if %ERRORLEVEL% NEQ 0 (
    set EXPAND_CMD=tar
    set EXPAND_OPT=-xf
    set EXPAND_DIR_OPT=-C
)

where %EXPAND_CMD%
if %ERRORLEVEL% NEQ 0 (
    echo �W�J�v���O������������Ȃ����߃Z�b�g�A�b�v�𑱍s�ł��܂���B
    exit -1
)

echo %EXPAND_CMD%���g���܂��B
echo Universal Extractor �W�J...
%EXPAND_CMD% %EXPAND_OPT% "%~dp0\..\%UNIEXT_DIR%\%UNIEXT_FILE%" %EXPAND_DIR_OPT% "%~dp0\..\%UNIEXT_DIR%"
echo Teraterm �W�J...
%EXPAND_CMD% %EXPAND_OPT% "%~dp0\..\%TERATERM_DIR%\%TERATERM_FILE%" %EXPAND_DIR_OPT% "%~dp0\..\%TERATERM_DIR%"
echo Qemu �W�J...
"%~dp0\..\%UNIEXT_PATH%\bin\x86\7z.exe" x -y -o"%~dp0\..\%QEMU_DIR%\" "%~dp0\..\%QEMU_DIR%\%QEMU_FILE%" 
