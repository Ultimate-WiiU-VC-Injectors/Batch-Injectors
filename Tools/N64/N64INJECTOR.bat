@echo off
title NicoAICP's N64 VC Injector
echo Please add your z64/n64 or v64 rom to the File directory
pause
cls
pause
cls
cd ..
cd ..
cd Files
move *.* ../Tools/N64/Source
cd ..
cd Tools
cd N64
cd Source
cls
echo What Baserom are you wanting to use?
echo (1) Paper Mario [EUR] 
echo (2) F-Zero X
set /p BR=Enter the number behind the base rom: 
if exist *.v64 java -jar N64Converter.jar -i *.v64 -o game.z64
if exist *.n64 java -jar N64Converter.jar -i *.n64 -o game.z64
if exist *.z64 rename *.z64 game.z64
if %BR%==1 (
set TKHINT=a694
set TID=0005000010199800
set TIKPATH=Tools\Storage\PMEUTITLEKEY
set BRTITLE=Paper Mario [EUR]
set DWNLDFOLDER=Paper Mario [NACP01]
set ROMINI=UNMQP0.810
goto tk
)
if %BR%==2 (
set TKHINT=bfdb
set TID=00050000101ebc00
set TIKPATH=Tools\Storage\FZTITLEKEY
set BRTITLE=F-Zero X [US]
set DWNLDFOLDER=F-Zero X [NAWE01]
set ROMINI=Ucfze0.242
goto tk
)

:wtk
del /q %TIKPATH%
echo Title Key is incorrect, try again
pause
cls
goto tk

:tk
set ID=%TID%
IF NOT EXIST "%TIKPATH%" set /p TK=Enter or copypaste the eShop Title Key for %BRTITLE% (Will not be required next time for this base rom): 
IF NOT EXIST "%TIKPATH%" echo %TK:~0,32%>%TIKPATH%
set /p TK=<%TIKPATH%
cls
if not "%TK:~0,4%"=="%TKHINT%" goto:wtk else goto ckey
:ckey
IF NOT EXIST "Tools\Storage\COMMONKEY" set /p COMMONKEY=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\Storage\COMMONKEY" echo %COMMONKEY:~0,32%>Tools\Storage\COMMONKEY
set /p COMMONKEY=<Tools\Storage\COMMONKEY
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\JNUSTool\config
echo %COMMONKEY:~0,32%>>Tools\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\JNUSTool\config
goto DWNLDBASEROM

:DWNLDBASEROM
cd Tools
cd JNUSTool
cls
echo Checking Internet Connection...
C:\windows\system32\PING.EXE google.com
if %errorlevel% GTR 0 goto netfail
cls
echo Downloading necessary base files with JNUSTool...>con
java -jar JNUSTool.jar %TID% %TK% -file .*
cls
if not exist "%DWNLDFOLDER%" goto Downloaderror
cd "%DWNLDFOLDER%"
xcopy /s *.* ..\..\..\Source
cd ..
cls
echo Complete!
pause
goto injectrom
:injectrom
cd ..
cd ..
cd Source
rename game.z64 %ROMINI%
cd content
cd rom
del /f /q %ROMINI%
cd ..
cd ..
move %ROMINI% content/rom
rename *.ini user.ini
echo Choose an ini file for your injected Game. If your game isnt listed get the ini from here https://goo.gl/V6t3rr
echo and choose the option custom. If the game has labled Blank for the ini file there choose the option BLANK
echo (1) Banjo Kazooie [EUR]
echo (2) Banjo Kazooie [USA]
echo (3) BLANK
echo (4) custom
set /p INIF=Enter the number infront of the option and press enter: 
if %INIF%==1 (
cd ..
cd Tools
cd Storage
cd GAME_FILES
cd BK
cd EU
copy %ROMINI%.ini ..\..\..\..\..\Source\content\config
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
goto id
)
if %INIF%==2 (
cd ..
cd Tools
cd Storage
cd GAME_FILES
cd BK
cd US
copy %ROMINI%.ini ..\..\..\..\..\Source\content\config
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
goto id
)
if %INIF%==3 (
cd content
cd config
del /f /q %ROMINI%.ini
cd ..
cd .. 
cd ..
cd Tools
cd Storage
cd GAME_FILES 
copy %ROMINI%.ini ..\..\..\Source\content\config
cd ..
cd ..
cd ..
cd Source
goto id
)
if %INIF%==4 (
echo Please insert your ini file now into the Files directory
pause
rename user.ini %ROMINI%.ini
cd content
cd config
del /f /q UNMQP0.810.ini
cd ..
cd ..
move UNMQP0.810.ini content/rom
goto id
)
:id
cls
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (A-F, 0-9): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\Tools\Storage\ID"
if %errorlevel%==0 goto erroridcheck
if %errorlevel%==1 goto create_xml
:erroridcheck
cls
echo You entered a non Hex value!
del /f /q ..\Tools\Storage\ID
goto id
:create_xml
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): >con
echo.>con
set /p Name=Enter the Game name:  >con
echo.>con
cd code 
fnr --cl --dir "%cd%\code" --fileMask "app.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
cd ..
cd meta
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<product_code.*WUP-N-)(.{4})" --replace "$1%PDC%"
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<longname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
fnr --cl --dir "%cd%\meta" --fileMask "meta.xml" --useRegEx --find "(<shortname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
goto bia
:bia
cls
cd ..
echo Do you want to use premade or selfmade boot image files (drc banner, tv banner, icon?)
echo (1) premade
echo (2) selfmade
set /p BOOTIMG=Enter the number behind the option and hit enter: >con
echo.>con
if %BOOTIMG%==1 (
cls
echo if your game is not listed, use the "Injected Game" option, otherwise use the back option to get back to the menu and choose selfmade
echo (1) Banjo-Kazooie by aarti
echo (2) Injected Game
echo (3) Back
set /p premade=Enter the number behind the option and hit enter: >con
echo.>con
if %premade%==1 goto BK
if %premade%==2 goto usetemplatedrc
if %premade%==3 goto bia
)
if %BOOTIMG%==2 goto bootimagedrcpng
:bootimagedrcpng
if exist bootDrcTex.png goto convertdrc_pmeu
if not exist bootDrcTex.png goto bootimageDRCtga
:bootimageDRCtga
if exist bootDrcTex.tga goto movedrc
if not exist bootDrcTex.tga (
set Missing=bootDrcTex
goto ERROR1
) 
:bootdrctga
cd meta 
del /f /q bootDrcTex.tga
cd ..
xcopy.exe  ..\Tools\Storage\GAME_FILES\bootDrcTex.tga meta
cls
goto bootimageTVpng
:convertdrc
cd meta
del /f /q bootDrcTex.tga
cd ..
png2tgacmd.exe -i bootDrcTex.png -o meta --width=854 --height=480 --tga-bpp=24 --tga-compression=none
cls
goto bootimageTVpng
:movedrc
del bootDrcTex.tga
move bootDrcTex.tga meta
cls
goto bootimageTVpng
:bootimageTVpng
if exist bootTvTex.png goto converttv
if not exist bootTvTex.png goto bootimageTVtga
:bootimageTVtga
if exist bootTvTex.tga goto movetv
if not exist bootTvTex.tga (
set Missing=bootTvTex
goto ERROR1
) 
:usetemplatetv
cd meta
del /f /q bootTvTex.tga
cd ..
xcopy.exe ..\Tools\Storage\GAME_FILES\bootTvTex.tga meta
cls
goto usetemplateicon
:converttv
cd meta
del /f /q bootTvTex.tga
cd ..
png2tgacmd.exe -i bootTvTex.png -o meta --width=1280 --height=720 --tga-bpp=24 --tga-compression=none
cls
goto bootimageIconpng
:movetv_pmeu
cd meta
del /f /q bootTvTex.tga
cd ..
move bootTvTex.tga meta
cls
goto bootimageIconpng
:bootimageIconpng
if exist iconTex.png goto moveicon
if not exist iconText.png goto bootimageIcontga
:bootimageIcontga
if exist iconTex.tga goto moveicon
if not exist iconTex.tga (
set Missing=iconTex
goto ERROR1
) 
:usetemplateicon
cd meta
del /f /q iconTex.tga
cd ..
xcopy.exe ..\Tools\Storage\GAME_FILES\iconTex.tga meta
cls
goto usetemplatelogo
:usetemplatedrc
cd meta
del /f /q bootDrcTex.tga
cd ..
xcopy.exe ..\Tools\Storage\GAME_FILES\bootDrcTex.tga meta
cls
goto usetemplatetv
:converticon
cd meta
del /f /q iconTex.tga
cd ..
png2tgacmd.exe -i iconTex.png -o meta --width=128 --height=128 --tga-bpp=32 --tga-compression=none
cls
goto usetemplatelogo
:moveicon
cd meta
del /f /q iconTex.tga
cd ..
move iconTex.tga meta
cls
goto usetemplatelogo
:usetemplatelogo
cd meta
del /f /q bootLogoTex.tga
cd ..
xcopy.exe ..\Tools\Storage\GAME_FILES\bootLogoTex.tga meta
cls
goto packing
:BK
cd meta
del /f /q bootLogoTex.tga
del /f /q iconTex.tga 
del /f /q bootTvTex.tga
del /f /q bootDrcTex.tga
cd ..
xcopy.exe ..\Tools\Storage\GAME_FILES\BK\bootLogoTex.tga meta
xcopy.exe ..\Tools\Storage\GAME_FILES\BK\iconTex.tga meta
xcopy.exe ..\Tools\Storage\GAME_FILES\BK\bootTvTex.tga meta
xcopy.exe ..\Tools\Storage\GAME_FILES\BK\bootDrcTex.tga meta
cls
goto packing
:packing
del /f /q *.png
move code ../Tools/NUSPACKER/input
move content ../Tools/NUSPACKER/input
move meta ../Tools/NUSPACKER/input
cd ..
cd Tools
cd NUSPACKER
java -jar NUSPacker.jar -in input -out output -encryptKeyWith %COMMONKEY%
rd /s /q tmp
mkdir install
cd install
mkdir injected_vc_game
cd ..
cd output
move *.* ..\install\injected_vc_game
cd ..
rd /s /q output
cls
cd install
move injected_vc_game ../../../../../Injected_Games
cd ..
cd input
rd /f /q code
rd /f /q content
rd /f /q meta
cls
echo have fun with your injected n64 game!
pause
exit
:ERROR1
echo %Missing%.tga/.png is missing!
echo Aborting
pause
exit
