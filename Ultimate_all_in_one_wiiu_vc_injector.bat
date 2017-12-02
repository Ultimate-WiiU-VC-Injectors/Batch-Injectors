echo off
cls
::Header
title NicoAICP's Ultimate WiiU VC Injector Script
cls
echo ::::::::::::::::::::::::::::::::::::::::
echo ::NicoAICP's Ultimate WiiU VC Injector::
echo ::::::::::::::::::::::::::::::::::::::::
pause
cls
echo What kind of VC game do you want to inject
echo GBA injector is now in development
echo NDS(1)
echo GBA(2)
echo NES/SNES(3)
echo N64(4)
echo WII/WII Homebrew/Gamecube(5) (Injector by KhaderWelaye)
SET /P M=Type the number behind the name of the vc platform you want to use then press enter:
IF %M%==1 GOTO NDS
IF %M%==2 GOTO GBA
IF %M%==3 GOTO NES/SNES
if %M%==4 GOTO N64
if %M%==5 goto WII
:NDS
cls
cd Tools
cd NDS
start NDSINJECTOR.bat
exit
exit
:GBA
cls
cd Tools
cd GBA
start GBAINJECTOR.bat
exit
:NES/SNES
cls
cd Tools
cd NESSNES
start SNESNESINJECTOR.bat
pause
:N64
cls
cd Tools
cd N64
start N64INJECTOR.bat
exit
:WII
cls
cd Tools
cd WII
start WiiVCInjector.exe
exit