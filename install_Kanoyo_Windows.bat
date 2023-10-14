@echo off
Title Kanoyo - Installer
setlocal
cd %~dp0

                                                                                                                                               
:::
:::
:::    _   _ _____ _   _ _____ _     _ _____ 
:::   ( ) ( )  _  ) ) ( )  _  ) )   ( )  _  )
:::   | |/ /| (_) |  \| | ( ) |\ \_/ /| ( ) |
:::   |   ( (  _  )     | | | |  \ /  | | | |
:::   | |\ \| | | | | \ | (_) |  | |  | (_) |
:::   (_) (_)_) (_)_) (_)_____)  (_)  (_____)                                       
:::
:::
:::
                                                                       


set "repoUrl=https://github.com/STaYsONzxc/Kano-VC-Fork.git"
set "repoFolder=Kano-Runtime"
set "principal=%cd%\%repoFolder%"
set "runtime_scripts=%cd%\%repoFolder%\runtime\Scripts"
set "URL_BASE=https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main"
set "URL_EXTRA=https://huggingface.co/IAHispano/applio/resolve/main"

echo.
cls
echo INFO: ����� �� ����᪠�� ��� �ணࠬ�� ��⠭���� �� ����� �����������, ⠪ ��� �� ����� �맢��� �஡����, � ⠪�� ४��������� �⪫���� ��⨢���� ��� �࠭������, ⠪ ��� �� ����㧪� �।���⥫쭮 ���祭��� ������� ����� ���������� �訡��.
echo.
pause

cls
echo INFO: �०�� 祬 �த������, 㡥�����, �� ��⠭������ �� ����室��� ����ᨬ���. ���஡���� �. � �㪮����⢥ �� ��⠭����.
echo.
echo Build Tools: https://aka.ms/vs/17/release/vs_BuildTools.exe
echo Redistributable: https://aka.ms/vs/17/release/vc_redist.x64.exe
echo Git: https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/Git-2.42.0.2-64-bit.exe
echo Python 3.9.8: https://www.python.org/ftp/python/3.9.8/python-3.9.8-amd64.exe
echo.
echo INFO: ������������ ��⠭����� Python 3.9.X � 㡥������, �� �� �������� � ��⥬�� ����.
echo.
pause
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ":::" "%~f0"') do @echo(%%A
echo.


echo ��⠭���� ����ᨬ��⥩...
echo.
echo ������������� ��� ������⥫�� ��������� �� NVIDIA:  
echo [1] ������ ࠭⠩� (�।��⠭������� ����ᨬ���)
echo.
echo [2] � 㦥 ��⠭����(-�) ����ᨬ���
echo.
set /p choice=�롥�� ����, ᮮ⢥�������� ��襩 ���������:
set choice=%choice: =%

if "%choice%"=="1" (
cls
powershell -command "Invoke-WebRequest -Uri https://frippery.org/files/busybox/busybox.exe -OutFile busybox.exe"
busybox.exe wget %URL_EXTRA%/runtime.zip
echo.
echo ��ᯠ����� runtime.zip 䠩��...
powershell -command "& { Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory('runtime.zip', '%principal%') }"
echo.
del runtime.zip busybox.exe
cls
echo.
goto dependenciesFinished
)

if "%choice%"=="2" (
echo ����ᨬ��� �ᯥ譮 ��⠭������!
echo.
goto dependenciesFinished
)

:dependenciesFinished
cls 
echo Kanoyo-Fork �ᯥ譮 ����㦥�, ������� 䠩� go-kanoyo.bat ��� ����᪠ ���-����䥩�!
echo.
pause
exit