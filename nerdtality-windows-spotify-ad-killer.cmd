:: Hides all unwanted text from execution window

:Begin
@echo off
cls

:: Asks for Administrative privileges

:GetAdminRights
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
echo Requesting Admin Rights
goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B > nul

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"

:: Continues once Administrative privileges have been obtained
:: Now main script can function properly without any user intervention necessary

:NerdtalityWindowsSpotifyAdKiller

:: Sets varibles

set updateid=32428528
set hostdir=%SystemRoot%\system32\drivers\etc\
set spotifydir=%appdata%\Spotify\

:: Kills Spotify task if running

tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F > nul

:: Looks and updates for hosts file

IF NOT EXIST %hostdir%hosts.%updateid% copy %hostdir%hosts %hostdir%hosts.%updateid% > nul

:: Writes to hosts file if not found or update is needed

echo. >>"%hostdir%hosts" > nul
echo. >>"%hostdir%hosts" > nul
echo #Nerdtality Spotify Ad Killer>>"%hostdir%hosts" > nul
echo 0.0.0.0 adclick.g.doublecklick.net>>"%hostdir%hosts" > nul
echo 0.0.0.0 googleads.g.doubleclick.net>>"%hostdir%hosts" > nul
echo 0.0.0.0 http://www.googleadservices.com>>"%hostdir%hosts" > nul
echo 0.0.0.0 pubads.g.doubleclick.net>>"%hostdir%hosts" > nul
echo 0.0.0.0 securepubads.g.doubleclick.net>>"%hostdir%hosts" > nul
echo 0.0.0.0 pagead2.googlesyndication.com>>"%hostdir%hosts" > nul
echo 0.0.0.0 spclient.wg.spotify.com>>"%hostdir%hosts" > nul
echo 0.0.0.0 audio2.spotify.com>>"%hostdir%hosts" > nul
echo # >>"%hostdir%hosts" > nul

:: Deletes Spotify ad file and creates an empty file

IF EXIST %spotifydir%Apps\ad.spa del /f /q %spotifydir%Apps\ad.spa > nul
echo. >%spotifydir%Apps\ad.spa > nul

:: Flushing your DNS after rewriting your hosts file

ipconfig /flushdns > nul

:: Launch Spotify if found

IF NOT EXIST %spotifydir%Spotify.exe echo Warning: The Spotify.exe file was not found in the default path, run Spotify manually.
IF EXIST %spotifydir%Spotify.exe start %spotifydir%Spotify.exe > nul

:: ==============================================================================================
:: End of script! For further questions or assistance, please visit https://nerdtality.com/forums
:: ==============================================================================================

:End
exit
