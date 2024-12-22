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
                                                                       


set "repoUrl=https://github.com/Player124413/Kano-VC-Fork"
set "repoFolder=Kano-Runtime"
set "principal=%cd%\%repoFolder%"
set "runtime_scripts=%cd%\%repoFolder%\runtime\Scripts"
set "URL_BASE=https://huggingface.co/lj1995/VoiceConversionWebUI/resolve/main"
set "URL_EXTRA=https://huggingface.co/IAHispano/applio/resolve/main"

echo.
cls
echo INFO: ‚ ¦­® ­¥ § ¯ãáª âì íâã ¯à®£à ¬¬ã ãáâ ­®¢ª¨ ®â ¨¬¥­¨  ¤¬¨­¨áâà â®à , â ª ª ª íâ® ¬®¦¥â ¢ë§¢ âì ¯à®¡«¥¬ë,   â ª¦¥ à¥ª®¬¥­¤ã¥âáï ®âª«îç¨âì  ­â¨¢¨àãá ¨«¨ ¡à ­¤¬ ãíà, â ª ª ª ¯à¨ § £àã§ª¥ ¯à¥¤¢ à¨â¥«ì­® ®¡ãç¥­­ëå ¬®¤¥«¥© ¬®£ãâ ¢®§­¨ª­ãâì ®è¨¡ª¨.
echo.
pause

cls
echo INFO: à¥¦¤¥ ç¥¬ ¯à®¤®«¦¨âì, ã¡¥¤¨â¥áì, çâ® ãáâ ­®¢«¥­ë ¢á¥ ­¥®¡å®¤¨¬ë¥ § ¢¨á¨¬®áâ¨. ®¤à®¡­®áâ¨ á¬. ¢ àãª®¢®¤áâ¢¥ ¯® ãáâ ­®¢ª¥.
echo.
echo Build Tools: https://aka.ms/vs/17/release/vs_BuildTools.exe
echo Redistributable: https://aka.ms/vs/17/release/vc_redist.x64.exe
echo Git: https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/Git-2.42.0.2-64-bit.exe
echo Python 3.9.8: https://www.python.org/ftp/python/3.9.8/python-3.9.8-amd64.exe
echo.
echo INFO: ¥ª®¬¥­¤ã¥âáï ãáâ ­®¢¨âì Python 3.9.X ¨ ã¡¥¤¨âìáï, çâ® ®­ ¤®¡ ¢«¥­ ¢ á¨áâ¥¬­ë© ¯ãâì.
echo.
pause
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ":::" "%~f0"') do @echo(%%A
echo.


echo “áâ ­®¢ª  § ¢¨á¨¬®áâ¥©...
echo.
echo ¥ª®¬¥­¤®¢ ­® ¤«ï ®¡« ¤ â¥«¥© ¢¨¤¥®ª àâ ®â NVIDIA:  
echo [1] ‘ª ç âì à ­â ©¬ (¯à¥¤ãáâ ­®¢«¥­­ë¥ § ¢¨á¨¬®áâ¨)
echo.
echo [2] Ÿ ã¦¥ ãáâ ­®¢¨«(- ) § ¢¨á¨¬®áâ¨
echo.
set /p choice=‚ë¡¥à¨â¥ ®¯æ¨î, á®®â¢¥âáâ¢ãîéãî ¢ è¥© ¢¨¤¥®ª àâ¥:
set choice=%choice: =%

if "%choice%"=="1" (
cls
powershell -command "Invoke-WebRequest -Uri https://frippery.org/files/busybox/busybox.exe -OutFile busybox.exe"
busybox.exe wget %URL_EXTRA%/runtime.zip
echo.
echo  á¯ ª®¢ª  runtime.zip ä ©« ...
powershell -command "& { Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory('runtime.zip', '%principal%') }"
echo.
del runtime.zip busybox.exe
cls
echo.
goto dependenciesFinished
)

if "%choice%"=="2" (
echo ‡ ¢¨á¨¬®áâ¨ ãá¯¥è­® ãáâ ­®¢«¥­ë!
echo.
goto dependenciesFinished
)

:dependenciesFinished
cls 
echo Kanoyo-Fork ãá¯¥è­® § £àã¦¥­, § ¯ãáâ¨â¥ ä ©« go-kanoyo.bat ¤«ï § ¯ãáª  ¢¥¡-¨­â¥àä¥©á !
echo.
pause
exit
