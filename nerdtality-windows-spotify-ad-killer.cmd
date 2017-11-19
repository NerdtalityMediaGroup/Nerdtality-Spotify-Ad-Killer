@echo off
cls
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
:NerdtalityWindowsSpotifyAdKiller
tasklist | find /i "spotify.exe" && taskkill /im spotify.exe /F > nul
IF NOT EXIST %SystemRoot%\system32\drivers\etc\hosts.backup copy %SystemRoot%\system32\drivers\etc\hosts %SystemRoot%\system32\drivers\etc\hosts.backup > nul
echo. >>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo. >>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo #Nerdtality Spotify Ad Killer>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 adclick.g.doublecklick.net>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 googleads.g.doubleclick.net>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 http://www.googleadservices.com>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 pubads.g.doubleclick.net>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 securepubads.g.doubleclick.net>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 pagead2.googlesyndication.com>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 spclient.wg.spotify.com>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo 0.0.0.0 audio2.spotify.com>>"%SystemRoot%\system32\drivers\etc\hosts" > nul
echo # >>"%SystemRoot%\system32\drivers\etc\hosts" > nul
IF EXIST %appdata%\Spotify\Apps\ad.spa del /f /q %appdata%\Spotify\Apps\ad.spa > nul
echo. >%appdata%\Spotify\Apps\ad.spa > nul
ipconfig /flushdns > nul
IF NOT EXIST %appdata%\Spotify\Spotify.exe echo Warning: The Spotify.exe file was not found in the default path, run Spotify manually.
IF EXIST %appdata%\Spotify\Spotify.exe start %appdata%\Spotify\Spotify.exe > nul
