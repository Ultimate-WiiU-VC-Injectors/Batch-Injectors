@echo off
title NicoAICP's WiiU GBA VC Injector Script
echo Please put your GBA rom (.gba) into the Files Directory now.
pause
cls
echo What base rom do you want to use?
echo (1) The Legend of Zelda: The Minish Cap
echo (2) Mario and Luigi Superstar saga
set /p rom=Enter the number of the Base Rom
if %rom%==1 (
set IDpath=Tools\Storage\ZMEUTITLEKEY
set TID=000500001015e500
set TKHINT=932d
set Foldername="The Legend of Zelda The Minish Cap [PAKP01]"
set ROMNAME=The Legend of Zelda: The Minish Cap [EU]
goto tk
)
set IDpath=Tools\Storage\MLUSTITLEKEY
set TID=0005000010157400
set TKHINT=31dd
set Foldername="Mario & Luigi Superstar Saga [PAEE01]"
set ROMNAME=Mario and Luigi Superstar Saga [US]
goto tk

:tk
IF NOT EXIST "%IDpath%" set /p TK=Enter or copypaste the eShop Title Key for %ROMNAME% (Will not be required next time): >con
IF NOT EXIST "%IDpath%" echo %TK:~0,32%>%IDpath%
set /p TK=<%IDpath%
cls
if "%TK:~0,4%"=="%TKHINT%" goto:ckey else goto wtk

:wtk
del /q %IDpath%
cls
echo The Titlekey is incorrect, try again
pause
cls
goto tk

:ckey
IF NOT EXIST "Tools\Storage\CKEY" set /p CKEY=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\Storage\CKEY" echo %CKEY:~0,32%>Tools\Storage\CKEY
set /p CKEY=<Tools\Storage\CKEY
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\JNUStool\config
echo %CKEY:~0,32%>>Tools\JNUStool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\JNUStool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\JNUStool\config
goto download

:download
cd Tools\JNUStool
cls
echo Checking Internet Connection...
C:\windows\system32\PING.EXE google.com
if %errorlevel% GTR 0 goto netfail
cls
echo Downloading necessary base files with JNUSTool...>con
java -jar JNUSTool.jar %TID% %TK% -file /code/.*
cls
java -jar JNUSTool.jar %TID% %TK% -file /content/.*
cls
java -jar JNUSTool.jar %TID% %TK% -file /meta/.*
cls
cls
xcopy /e %Foldername% ..\NUSPACKER\input
cd ..
cd ..
cls
pause
echo Complete!
pause
goto romcheck

:romcheck
IF EXIST "..\..\Files\*.gba" GOTO inject
goto rommissing

:rommissing
cls
echo You did not provide a rom! Aborting!
pause
exit

:inject
cd ..
cd ..
cd Files
xcopy *.gba ..\Tools\GBA\Source
cd ..
cd Tools
cd GBA
cd Tools
cd NUSPACKER
cd input
cd content
move "alldata.bin" "../../../../Source/INJCT"
move "alldata.psb.m" "../../../../Source/INJCT"
cd ..
cd ..
cd ..
cd ..
cd Source
RENAME *.gba rom.gba
"C:\Python33\python" "INJCT\inject_gba\inject_gba.py" --inpsb "INJCT\alldata.psb.m" --inrom "rom.gba" --outpsb "INJCT\out\alldata.psb.m"
cd INJCT
cd out
move *.* "../../../Tools/NUSPACKER/input/content"
cd ..
DEL alldata.psb.m
DEL alldata.bin
cd ..
DEL "rom.gba"
cls
goto bootimagedrc

:bootimagedrc
if exist ..\..\..\Files\bootDrcTex.png (
mkdir temp
xcopy ..\..\Files\bootDrcTex.png temp
png2tgacmd.exe -i temp\bootDrcTex.png -o temp --width=854 --height=480 --tga-bpp=24 --tga-compression=none
del /q temp\bootDrcTex.png
goto bootimagetv
)
if exist ..\..\..\Files\bootDrcTex.tga (
mkdir temp
xcopy ..\..\..\Files\bootDrcTex.tga temp
goto bootimagetv
)
mkdir temp
xcopy ..\Tools\GAMEFILES\bootDrcTex.tga temp
goto bootimagetv

:bootimagetv
if exist ..\..\..\Files\bootTvTex.png (
xcopy ..\..\Files\bootTvTex.png temp
png2tgacmd.exe -i bootTvTex.png -o temp --width=1280 --height=720 --tga-bpp=24 --tga-compression=none
del /q temp\bootTvTex.png
goto bootimageicon
)
if exist ..\..\..\Files\bootTvTex.tga (
xcopy ..\..\..\Files\bootTvTex.tga temp
goto bootimageicon
)
xcopy ..\Tools\GAMEFILES\bootTvTex.tga temp
goto bootimageicon

:bootimageicon
if exist ..\..\..\Files\iconTex.png (
xcopy ..\..\..\Files\iconTex.png temp
png2tgacmd.exe -i temp\iconTex.png -o temp --width=128 --height=128 --tga-bpp=32 --tga-compression=none
del /q temp\iconTex.png
goto bootimagelogo
)
if exist ..\..\..\Files\iconTex.tga (
xcopy ..\..\..\Files\iconTex.tga temp
goto bootimagelogo
)
xcopy ..\Tools\GAMEFILES\iconTex.tga temp
goto bootimagelogo

:bootimagelogo
xcopy ..\Tools\GAMEFILES\bootLogoTex.tga temp
cd ../Tools/NUSPACKER/input/meta/
del /f /q *.tga
move meta.xml ../../../../Source
cd ..
cd code
move app.xml ../../../../Source
cd ..
cd ..
cd ..
cd ..
cd Source
cd temp
move *.tga ../../Tools/NUSPACKER/input/meta/
cd ..
rd temp
goto editxml

:editxml
cls
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (A-F, 0-9): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\Tools\Storage\ID"
if %errorlevel%==0 goto erroridcheck
del /f /q ..\Tools\Storage\ID
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): >con
echo.>con
set /p Name=Enter the Game name:  >con
echo.>con
fnr --cl --dir "%cd%" --fileMask "app.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<product_code.*WUP-N-)(.{4})" --replace "$1%PDC%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<title_id.*0005000010)(.{4})" --replace "$1%ID%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<longname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
fnr --cl --dir "%cd%" --fileMask "meta.xml" --useRegEx --find "(<shortname_.{2,3}.*\u0022>)([^<]*)" --replace "$1%Name%"
move meta.xml ../Tools/NUSPACKER/input/meta/
move app.xml ../Tools/NUSPACKER/input/code/
goto packing
:erroridcheck
cls
echo You entered a non Hex value!
del /f /q ..\Tools\Storage\ID
goto editxml
:packing
cd ..
cd Tools
cd NUSPACKER
java -jar NUSPacker.jar -in input -out output -encryptKeyWith %CKEY%
rd /s /q tmp
mkdir install
cd install
mkdir VC_Inject
cd ..
cd output
move *.* ../install/VC_Inject
cd ..
rd /s /q output
cls
cd install
move VC_Inject ../../../../../Injected_Games
cls
echo have fun with your injected game!
pause
exit