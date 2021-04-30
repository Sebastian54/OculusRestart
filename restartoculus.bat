@echo off

set txtpath=%HOMEPATH%/Desktop/OculusLog/oculuslog.txt

cd %HOMEPATH%/Desktop/OculusLog
del oculuslog.txt
cd %HOMEPATH%/Desktop
mkdir OculusLog
cd %HOMEPATH%/Desktop/OculusLog
title Oculus Restart Service - Checking Admin Status - Made by Sebastian#6789
echo Start Launch = %time% %date%>> %txtpath%
cls
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    cls
    title Oculus Restart Service - Admin Status: YES - Made by Sebastian#6789
) ELSE (
   echo Start Failed = %time% %date%>> %txtpath%
   cls
   title Oculus Restart Service - Admin Status: NO - Made by Sebastian#6789
   cls
   color 4
   echo.Unauthorised Access - Administration Required.
   echo.
   echo.Process will be elevated to Administrator in 2 seconds..
   echo.
   echo.Changed your mind? Do CTRL+C to abort.
   timeout /t 2 /nobreak > NUL
   cls
   set "params=%*"
   cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
   EXIT /B 1
)
color E
echo.
echo.Attention:
echo.
echo.This will not fix sound issues!
echo.In order to fix sound or mic issues you need to unplug the USB of your Rift and then plug it back in again.
echo.
echo.
pause
cls
:choice
cls
set /P c=Would you like to kill currently running games? [Y/N], Changed your mind? Instead type [C]
if /I "%c%" EQU "Y" goto :yes
if /I "%c%" EQU "N" goto :skip
if /I "%c%  EQU "C" goto :cancel
goto :choice

:cancel
cls
echo ACTION TERMINATED
pause
echo ACTION TERMINATED, Exiting..  = %time% %date%>> %txtpath%
exit

:yes
cls
echo Game Process Killing = %time% %date%>> %txtpath%
echo Killing currently recognised games.. You are able to add more to this list by editing this batch file.
echo.
taskkill /F /IM pavlov.exe>> %txtpath%
taskkill /F /IM DoctorWhoTheEdgeOfTime.exe>> %txtpath%
taskkill /F /IM UnityCrashHandler64.exe>> %txtpath%
taskkill /F /IM BeatSaber.exe>> %txtpath%
taskkill /F /IM AssetoCorsa.exe>> %txtpath%
taskkill /F /IM acs.exe>> %txtpath%
taskkill /F /IM acs_x86.exe>> %txtpath%
taskkill /F /IM acShowroom.exe>> %txtpath%
taskkill /F /IM BladeandSorcery.exe>> %txtpath%
taskkill /F /IM BONEWORKS.exe>> %txtpath%
taskkill /F /IM Earth.exe>> %txtpath%
taskkill /F /IM crashpad_handler.exe>> %txtpath%
taskkill /F /IM CrashReportClient.exe>> %txtpath%
taskkill /F /IM UnrealCEFSubProcess.exe>> %txtpath%
taskkill /F /IM Recroom_Release.exe>> %txtpath%
taskkill /F /IM VRChat.exe>> %txtpath%
taskkill /F /IM SteamVR.exe>> %txtpath%
taskkill /F /IM vrwebhelper.exe>> %txtpath%
taskkill /F /IM vrserver.exe>> %txtpath%
taskkill /F /IM vrmonitor.exe>> %txtpath%
taskkill /F /IM vrdashboard.exe>> %txtpath%
taskkill /F /IM vrcompositor.exe>> %txtpath%
taskkill /F /IM steamtours.exe>> %txtpath%
taskkill /F /IM TurnSignal.exe>> %txtpath%
taskkill /F /IM vivelink.exe>> %txtpath%
cls
echo Game Process Finish = %time% %date%>> %txtpath%
goto :skip

:skip
cls
echo Runtime Restart Active = %time% %date%>> %txtpath%
echo Beginning Restart Process..
echo.
echo Stopping Oculus Runtime..
echo.
net stop OVRService>> %txtpath%
echo Starting Oculus Runtime..
echo.
net start OVRService>> %txtpath%
echo Runtime Restart Complete
timeout /t 2 /nobreak > NUL
echo Exiting..  = %time% %date%>> %txtpath%
cls
echo Exiting..
timeout /t 2 /nobreak > NUL
start oculuslog.txt
exit
