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
echo INFO: Важно не запускать эту программу установки от имени администратора, так как это может вызвать проблемы, а также рекомендуется отключить антивирус или брандмауэр, так как при загрузке предварительно обученных моделей могут возникнуть ошибки.
echo.
pause

cls
echo INFO: Прежде чем продолжить, убедитесь, что установлены все необходимые зависимости. Подробности см. в руководстве по установке.
echo.
echo Build Tools: https://aka.ms/vs/17/release/vs_BuildTools.exe
echo Redistributable: https://aka.ms/vs/17/release/vc_redist.x64.exe
echo Git: https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/Git-2.42.0.2-64-bit.exe
echo Python 3.9.8: https://www.python.org/ftp/python/3.9.8/python-3.9.8-amd64.exe
echo.
echo INFO: Рекомендуется установить Python 3.9.X и убедиться, что он добавлен в системный путь.
echo.
pause
cls
for /f "delims=: tokens=*" %%A in ('findstr /b ":::" "%~f0"') do @echo(%%A
echo.


echo Установка зависимостей...
echo.
echo Рекомендовано для обладателей видеокарт от NVIDIA:  
echo [1] Скачать рантайм (предустановленные зависимости)
echo.
echo [2] Я уже установил(-а) зависимости
echo.
set /p choice=Выберите опцию, соответствующую вашей видеокарте:
set choice=%choice: =%

if "%choice%"=="1" (
cls
powershell -command "Invoke-WebRequest -Uri https://frippery.org/files/busybox/busybox.exe -OutFile busybox.exe"
busybox.exe wget %URL_EXTRA%/runtime.zip
echo.
echo Распаковка runtime.zip файла...
powershell -command "& { Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory('runtime.zip', '%principal%') }"
echo.
del runtime.zip busybox.exe
cls
echo.
goto dependenciesFinished
)

if "%choice%"=="2" (
echo Зависимости успешно установлены!
echo.
goto dependenciesFinished
)

:dependenciesFinished
cls 
echo Kanoyo-Fork успешно загружен, запустите файл go-kanoyo.bat для запуска веб-интерфейса!
echo.
pause
exit