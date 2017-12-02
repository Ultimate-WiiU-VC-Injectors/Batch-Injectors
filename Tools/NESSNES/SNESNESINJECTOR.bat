@echo off
title NicoAICP's SNES/NES VC INJECTOR
echo Do you want to inject a NES (1) or SNES (2) game?
set /p ROM=Enter the number behind the original Platfrom name: 
if %ROM%==1 goto nes
if %ROM%==2 (
set /p error=snes
goto snesmenu
)
cls

:::::CHOOSE MENU:::::
:snesmenu
echo What Base rom you want to use?
echo (1) Super Metroid
echo (2) Donkey Kong Country
echo (3) Earthbound
echo (4) Kirby's Dream Land 3 
echo (5) Super Mario Kart 
set /p SNESCHOOSE=Enter the number behind the name of the baserom
if %SNESCHOOSE%==1 (
set /p num=1
goto snes
)
if %SNESCHOOSE%==2 (
set /p num=2
goto DKC
)
if %SNESCHOOSE%==3 (
set /p num=3
goto eb
)
if %SNESCHOOSE%==4 (
set /p num=4
goto Kirby
)
if %SNESCHOOSE%==5 (
set /p num=5
goto smk
)
:::::BASIC STUFF:::::
:nes
echo please put your rom (.nes) into the Files folder!
pause
cls
cd Source
goto movebasefilesnes

:movebasefilesnes
cd ..
cd ..
cd ..
cd Files
move *.* ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
goto tknes

:snes
echo please put your rom (.sfc) into the Files folder!
pause
cls
cd Source
goto movebasefilessnes

:movebasefilessnes
cd ..
cd ..
cd ..
cd Files
move *.* ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
goto tksnes

:DKC
echo please put your rom (.sfc) into the Files folder!
pause
cls
cd Source 
goto tgadkc

:tgadkc
cls

goto movebasefilesdkc

:movebasefilesdkc
cd ..
cd ..
cd ..
cd Files
move *.* ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
goto tkdkc

:eb
echo please put your rom (.sfc) into the Files folder!
pause
cls
cd Source 
goto tgaeb

:tgaeb
cls

goto movebasefileseb

:movebasefileseb
cd ..
cd ..
cd ..
cd Files
move *.* ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
goto tkeb

:kirby
echo please put your rom (.sfc) into the Files folder!
pause
cls
cd Source
goto tgakb 

:tgakb
cls

goto movebasefileskb

:movebasefileskb
cd ..
cd ..
cd ..
cd Files
move *.* ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
goto tkkb

:smk
echo please put your rom (.sfc) into the Files folder!
pause
cls
cd Source
goto tgamk 

:tgamk
cls

goto movebasefilesmk

:movebasefilesmk
cd ..
cd ..
cd ..
cd Files
move *.* ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
goto tkmk
:::::KEYS:::::
:wrongtknes
del /q Tools\NES\Storage\NESKEY
echo Title Key is incorrect, try again
pause
cls
goto tknes

:tknes
set NESID=0005000010108c00
IF NOT EXIST "Tools\NES\Storage\NESKEY" set /p NESKEY=Enter or copypaste the eShop Title Key for Punch-Out!! [EUR] (Will not be required next time): >con
IF NOT EXIST "Tools\NES\Storage\NESKEY" echo %NESKEY:~0,32%>Tools\NES\Storage\NESKEY
set /p NESKEY=<Tools\NES\Storage\NESKEY
cls
if not "%NESKEY:~0,4%"=="ef15" goto:wrongtknes else goto commonnes

:commonnes
IF NOT EXIST "Tools\NES\Storage\COMMONNES" set /p COMMONNES=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\NES\Storage\COMMONNES" echo %COMMONNES:~0,32%>Tools\NES\Storage\COMMONNES
set /p COMMONNES=<Tools\NES\Storage\COMMONNES
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\NES\JNUSTool\config
echo %COMMONNES:~0,32%>>Tools\NES\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\NES\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\NES\JNUSTool\config
goto download_nes

:wrongtksnes
del /q Tools\SNES\Storage\SNESKEY
echo Title Key is incorrect, try again
pause
cls
goto tksnes

:tksnes
set SNESID=000500001010a700
IF NOT EXIST "Tools\SNES\Storage\SNESKEY" set /p SNESKEY=Enter or copypaste the eShop Title Key for SUPER METROID [EUR] (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\SNESKEY" echo %SNESKEY:~0,32%>Tools\SNES\Storage\SNESKEY
set /p SNESKEY=<Tools\SNES\Storage\SNESKEY
cls
if not "%SNESKEY:~0,4%"=="428a" goto:wrongtksnes else goto commonsnes

:commonsnes
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" set /p COMMONSNES=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" echo %COMMONSNES:~0,32%>Tools\SNES\Storage\COMMONSNES
set /p COMMONSNES=<Tools\SNES\Storage\COMMONSNES
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\SNES\JNUSTool\config
echo %COMMONSNES:~0,32%>>Tools\SNES\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\SNES\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\SNES\JNUSTool\config
goto download_snes

:wrongtkdkc
del /q Tools\SNES\Storage\DKCKEY
echo Title Key is incorrect, try again
pause
cls
goto tkdkc

:tkdkc
set DKID=0005000010109600
IF NOT EXIST "Tools\SNES\Storage\DKCKEY" set /p DKCKEY=Enter or copypaste the eShop Title Key for DONKEY KONG COUNTRY [EUR] (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\DKCKEY" echo %DKCKEY:~0,32%>Tools\SNES\Storage\DKCKEY
set /p DKCKEY=<Tools\SNES\Storage\DKCKEY
cls
if not "%DKCKEY:~0,4%"=="74c2" goto:wrongtkdkc else goto commondkc

:commondkc
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" set /p COMMONSNES=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" echo %COMMONSNES:~0,32%>Tools\SNES\Storage\COMMONSNES
set /p COMMONSNES=<Tools\SNES\Storage\COMMONSNES
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\SNES\JNUSTool\config
echo %COMMONSNES:~0,32%>>Tools\SNES\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\SNES\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\SNES\JNUSTool\config
goto download_dkc

:wrongtkeb
del /q Tools\SNES\Storage\EBKEY
echo Title Key is incorrect, try again
pause
cls
goto tkeb

:tkeb
set EBID=0005000010133500
IF NOT EXIST "Tools\SNES\Storage\EBKEY" set /p EBKEY=Enter or copypaste the eShop Title Key for EARTHBOUND [EUR] (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\EBKEY" echo %EBKEY:~0,32%>Tools\SNES\Storage\EBKEY
set /p EBKEY=<Tools\SNES\Storage\EBKEY
cls
if not "%EBKEY:~0,4%"=="9782" goto:wrongtkeb else goto commoneb

:commoneb
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" set /p COMMONSNES=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" echo %COMMONSNES:~0,32%>Tools\SNES\Storage\COMMONSNES
set /p COMMONSNES=<Tools\SNES\Storage\COMMONSNES
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\SNES\JNUSTool\config
echo %COMMONSNES:~0,32%>>Tools\SNES\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\SNES\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\SNES\JNUSTool\config
goto download_eb
:wrongtkkb
del /q Tools\SNES\Storage\KBKEY
echo Title Key is incorrect, try again
pause
cls
goto tkkb

:tkkb
set KBID=0005000010115400
IF NOT EXIST "Tools\SNES\Storage\KBKEY" set /p KBKEY=Enter or copypaste the eShop Title Key for KIRBYS DREAM LAND 3 [EUR] (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\EBKEY" echo %KBKEY:~0,32%>Tools\SNES\Storage\KBKEY
set /p KBKEY=<Tools\SNES\Storage\KBKEY
cls
if not "%KBKEY:~0,4%"=="13a1" goto:wrongtkkb else goto commonkb

:commonkb
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" set /p COMMONSNES=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" echo %COMMONSNES:~0,32%>Tools\SNES\Storage\COMMONSNES
set /p COMMONSNES=<Tools\SNES\Storage\COMMONSNES
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\SNES\JNUSTool\config
echo %COMMONSNES:~0,32%>>Tools\SNES\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\SNES\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\SNES\JNUSTool\config
goto download_kb

:wrongtkmk
del /q Tools\SNES\Storage\MKKEY
echo Title Key is incorrect, try again
pause
cls
goto tkmk

:tkmk
set MKID=000500001010aa00
IF NOT EXIST "Tools\SNES\Storage\MKKEY" set /p MKKEY=Enter or copypaste the eShop Title Key for SUPER MARIO KART [EUR] (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\MKKEY" echo %MKKEY:~0,32%>Tools\SNES\Storage\MKKEY
set /p MKKEY=<Tools\SNES\Storage\MKKEY
cls
if not "%MKKEY:~0,4%"=="efbd" goto:wrongtkmk else goto commonmk

:commonmk
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" set /p COMMONSNES=Enter or copypaste the WiiU Commonkey (Will not be required next time): >con
IF NOT EXIST "Tools\SNES\Storage\COMMONSNES" echo %COMMONSNES:~0,32%>Tools\SNES\Storage\COMMONSNES
set /p COMMONSNES=<Tools\SNES\Storage\COMMONSNES
echo http://ccs.cdn.wup.shop.nintendo.net/ccs/download>Tools\SNES\JNUSTool\config
echo %COMMONSNES:~0,32%>>Tools\SNES\JNUSTool\config
echo https://tagaya.wup.shop.nintendo.net/tagaya/versionlist/EUR/EU/latest_version>>Tools\SNES\JNUSTool\config
echo https://tagaya-wup.cdn.nintendo.net/tagaya/versionlist/EUR/EU/list/%d.versionlist>>Tools\SNES\JNUSTool\config
goto download_mk
:::::DOWNLOAD:::::
:download_snes
cd Tools
cd SNES
cd JNUSTool
cls
java -jar JNUSTool.jar %SNESID% %SNESKEY% -file /code/.*
java -jar JNUSTool.jar %SNESID% %SNESKEY% -file /content/.*
java -jar JNUSTool.jar %SNESID% %SNESKEY% -file /meta/manual.bfma
java -jar JNUSTool.jar %SNESID% %SNESKEY% -file /meta/meta.xml
java -jar JNUSTool.jar %SNESID% %SNESKEY% -file /meta/bootMovie.h264
java -jar JNUSTool.jar %SNESID% %SNESKEY% -file /meta/bootSound.btsnd
cls
goto move_filessnes
:download_nes
cd Tools
cd NES
cd JNUSTool
cls
java -jar JNUSTool.jar %NESID% %NESKEY% -file /code/.*
java -jar JNUSTool.jar %NESID% %NESKEY% -file /content/.*
java -jar JNUSTool.jar %NESID% %NESKEY% -file /meta/manual.bfma
java -jar JNUSTool.jar %NESID% %NESKEY% -file /meta/meta.xml
java -jar JNUSTool.jar %NESID% %NESKEY% -file /meta/bootMovie.h264
java -jar JNUSTool.jar %NESID% %NESKEY% -file /meta/bootSound.btsnd
cls
goto move_filesnes

:download_dkc
cd Tools
cd SNES
cd JNUSTool
cls
java -jar JNUSTool.jar %DKID% %DKCKEY% -file /code/.*
java -jar JNUSTool.jar %DKID% %DKCKEY% -file /content/.*
java -jar JNUSTool.jar %DKID% %DKCKEY% -file /meta/manual.bfma
java -jar JNUSTool.jar %DKID% %DKCKEY% -file /meta/meta.xml
java -jar JNUSTool.jar %DKID% %DKCKEY% -file /meta/bootMovie.h264
java -jar JNUSTool.jar %DKID% %DKCKEY% -file /meta/bootSound.btsnd
cls
goto move_filesdkc

:download_eb
cd Tools
cd SNES
cd JNUSTool
cls
java -jar JNUSTool.jar %EBID% %EBKEY% -file /code/.*
java -jar JNUSTool.jar %EBID% %EBKEY% -file /content/.*
java -jar JNUSTool.jar %EBID% %EBKEY% -file /meta/manual.bfma
java -jar JNUSTool.jar %EBID% %EBKEY% -file /meta/meta.xml
java -jar JNUSTool.jar %EBID% %EBKEY% -file /meta/bootMovie.h264
java -jar JNUSTool.jar %EBID% %EBKEY% -file /meta/bootSound.btsnd
cls
goto move_fileseb
:download_kb
cd Tools
cd SNES
cd JNUSTool
cls
java -jar JNUSTool.jar %KBID% %KBKEY% -file /code/.*
java -jar JNUSTool.jar %KBID% %KBKEY% -file /content/.*
java -jar JNUSTool.jar %KBID% %KBKEY% -file /meta/manual.bfma
java -jar JNUSTool.jar %KBID% %KBKEY% -file /meta/meta.xml
java -jar JNUSTool.jar %KBID% %KBKEY% -file /meta/bootMovie.h264
java -jar JNUSTool.jar %KBID% %KBKEY% -file /meta/bootSound.btsnd
cls
goto move_fileskb
:download_mk
cd Tools
cd SNES
cd JNUSTool
cls
java -jar JNUSTool.jar %MKID% %MKKEY% -file /code/.*
java -jar JNUSTool.jar %MKID% %MKKEY% -file /content/.*
java -jar JNUSTool.jar %MKID% %MKKEY% -file /meta/manual.bfma
java -jar JNUSTool.jar %MKID% %MKKEY% -file /meta/meta.xml
java -jar JNUSTool.jar %MKID% %MKKEY% -file /meta/bootMovie.h264
java -jar JNUSTool.jar %MKID% %MKKEY% -file /meta/bootSound.btsnd
cls
goto move_filesmk
:::::Move Files:::::
:move_filesnes
mkdir BASEROM
cd "Punch-Out!! [FAKP01]"
move code ../BASEROM
move content ../BASEROM
move meta ../BASEROM
cls 
goto injectnesrom
:move_filessnes
mkdir BASEROM
cd "Super Metroid [JAJP01]"
move code ../BASEROM
move content ../BASEROM
move meta ../BASEROM
cls 
goto injectsnesrom
:move_filesdkc
mkdir BASEROM
cd "Donkey Kong Country [JACP01]"
move code ../BASEROM
move content ../BASEROM
move meta ../BASEROM
cls 
goto injectdkc
:move_fileseb
mkdir BASEROM
cd "EarthBound [JBBP01]"
move code ../BASEROM
move content ../BASEROM
move meta ../BASEROM
cls 
goto injecteb
:move_fileskb
mkdir BASEROM
cd "Kirby's Dream Land 3 [JANP01]"
move code ../BASEROM
move content ../BASEROM
move meta ../BASEROM
cls 
goto injectkb
:move_filesmk
mkdir BASEROM
cd "Super Mario Kart [JAKP01]"
move code ../BASEROM
move content ../BASEROM
move meta ../BASEROM
cls 
goto injectmk
:::::ROM INJECTING:::::
:injectnesrom
cd ..
cd BASEROM
cd code
move app.xml ../../../../../Source
move WUP-FAKP.rpx ../../../../../Source
cd ..
cd meta
move meta.xml ../../../../../Source
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
wiiurpxtool -d WUP-FAKP.rpx
rename *.nes game.nes
start RetroInject.exe WUP-FAKP.rpx game.nes WUP-FAKP.rpx
wiiurpxtool -c WUP-FAKP.rpx
del /f /q game.nes
goto editappxmlnes

:injectsnesrom
cd ..
cd BASEROM
cd code
move app.xml ../../../../../Source
move WUP-JAJP.rpx ../../../../../Source
cd ..
cd meta 
move meta.xml ../../../../../Source
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
wiiurpxtool -d WUP-JAJP.rpx 
rename *.sfc game.sfc
cls
start romutil.exe
echo SNESromutil will start now
echo Please load your rom (game.sfc) in it
echo Please look if the checkbox header is checked
echo if yes, please remove the header and save, then close the window and then hit enter
echo if no, please close the window and press enter
pause
cls
start RetroInject.exe WUP-JAJP.rpx game.sfc WUP-JAJP.rpx
del /f /q game.sfc
wiiurpxtool -c WUP-JAJP.rpx
goto editappxmlsnes

:injectdkc
cd ..
cd BASEROM
cd code
move app.xml ../../../../../Source
move WUP-JACP.rpx ../../../../../Source
cd ..
cd meta 
move meta.xml ../../../../../Source
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
wiiurpxtool -d WUP-JACP.rpx
rename *.sfc game.sfc
cls
start romutil.exe
echo SNESromutil will start now
echo Please load your rom (game.sfc) in it
echo Please look if the checkbox header is checked
echo if yes, please remove the header and save, then close the window and then hit enter
echo if no, please close the window and press enter
pause
cls
start RetroInject.exe WUP-JACP.rpx game.sfc WUP-JACP.rpx
echo if retroinject is done, press enter
pause
del /f /q game.sfc
wiiurpxtool -c WUP-JACP.rpx
goto editappxmldkc

:injecteb
cd ..
cd BASEROM
cd code
move app.xml ../../../../../Source
move WUP-JBBP.rpx ../../../../../Source
cd ..
cd meta 
move meta.xml ../../../../../Source
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
wiiurpxtool -d WUP-JBBP.rpx 
rename *.sfc game.sfc
cls
start romutil.exe
echo SNESromutil will start now
echo Please load your rom (game.sfc) in it
echo Please look if the checkbox header is checked
echo if yes, please remove the header and save, then close the window and then hit enter
echo if no, please close the window and press enter
pause
cls
start RetroInject.exe WUP-JBBP.rpx game.sfc WUP-JBBP.rpx
del /f /q game.sfc
wiiurpxtool -c WUP-JBBP.rpx
goto editappxmleb
:injectkb
cd ..
cd BASEROM
cd code
move app.xml ../../../../../Source
move WUP-JANP.rpx ../../../../../Source
cd ..
cd meta 
move meta.xml ../../../../../Source
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
wiiurpxtool -d WUP-JANP.rpx
rename *.sfc game.sfc
cls
start romutil.exe
echo SNESromutil will start now
echo Please load your rom (game.sfc) in it
echo Please look if the checkbox header is checked
echo if yes, please remove the header and save, then close the window and then hit enter
echo if no, please close the window and press enter
pause
cls
start RetroInject.exe WUP-JANP.rpx game.sfc WUP-JANP.rpx
del /f /q game.sfc
wiiurpxtool -c WUP-JANP.rpx
pause
goto editappxmleb
:injectmk
cd ..
cd BASEROM
cd code
move app.xml ../../../../../Source
move WUP-JAKP.rpx ../../../../../Source
cd ..
cd meta 
move meta.xml ../../../../../Source
cd ..
cd ..
cd ..
cd ..
cd ..
cd Source
wiiurpxtool -d WUP-JAKP.rpx
rename *.sfc game.sfc
cls
start romutil.exe
echo SNESromutil will start now
echo Please load your rom (game.sfc) in it
echo Please look if the checkbox header is checked
echo if yes, please remove the header and save, then close the window and then hit enter
echo if no, please close the window and press enter
pause
cls
start RetroInject.exe WUP-JAKP.rpx game.sfc WUP-JAKP.rpx
del /f /q game.sfc
wiiurpxtool -c WUP-JAKP.rpx
goto editappxmlmk
:::::XML:::::
:editappxmlnes
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (A-F, 0-9): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\TOOLS\Storage\ID"
if %errorlevel%==0 goto erroridcheck
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>app.xml
echo ^<app type="complex" access="777"^>>>app.xml
echo   ^<version type="unsignedInt" length="4"^>16^</version^>>>app.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>app.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>app.xml
echo   ^<title_version type="hexBinary" length="2"^>0000^</title_version^>>>app.xml
echo   ^<sdk_version type="unsignedInt" length="4"^>20911^</sdk_version^>>>app.xml
echo   ^<app_type type="hexBinary" length="4"^>80000000^</app_type^>>>app.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>app.xml
echo   ^<os_mask type="hexBinary" length="32"^>0000000000000000000000000000000000000000000000000000000000000000^</os_mask^>>>app.xml
echo   ^<common_id type="hexBinary" length="8"^>0000000000000000^</common_id^>>>app.xml
echo ^</app^>>>app.xml
goto editmetaxmlnes
:editappxmlsnes
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (0-F): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\TOOLS\Storage\ID"
if %errorlevel%==0 goto erroridcheck
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>app.xml
echo ^<app type="complex" access="777"^>>>app.xml
echo   ^<version type="unsignedInt" length="4"^>16^</version^>>>app.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>app.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>app.xml
echo   ^<title_version type="hexBinary" length="2"^>0000^</title_version^>>>app.xml
echo   ^<sdk_version type="unsignedInt" length="4"^>20911^</sdk_version^>>>app.xml
echo   ^<app_type type="hexBinary" length="4"^>80000000^</app_type^>>>app.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>app.xml
echo   ^<os_mask type="hexBinary" length="32"^>0000000000000000000000000000000000000000000000000000000000000000^</os_mask^>>>app.xml
echo   ^<common_id type="hexBinary" length="8"^>0000000000000000^</common_id^>>>app.xml
echo ^</app^>>>app.xml
goto editmetaxmlsnes
:editappxmldkc
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (0-F): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\TOOLS\Storage\ID"
if %errorlevel%==0 goto erroridcheck
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>app.xml
echo ^<app type="complex" access="777"^>>>app.xml
echo   ^<version type="unsignedInt" length="4"^>16^</version^>>>app.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>app.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>app.xml
echo   ^<title_version type="hexBinary" length="2"^>0000^</title_version^>>>app.xml
echo   ^<sdk_version type="unsignedInt" length="4"^>20911^</sdk_version^>>>app.xml
echo   ^<app_type type="hexBinary" length="4"^>80000000^</app_type^>>>app.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>app.xml
echo   ^<os_mask type="hexBinary" length="32"^>0000000000000000000000000000000000000000000000000000000000000000^</os_mask^>>>app.xml
echo   ^<common_id type="hexBinary" length="8"^>0000000000000000^</common_id^>>>app.xml
echo ^</app^>>>app.xml
goto editmetaxmldkc
:editappxmleb
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (0-F): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\TOOLS\Storage\ID"
if %errorlevel%==0 goto erroridcheck
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>app.xml
echo ^<app type="complex" access="777"^>>>app.xml
echo   ^<version type="unsignedInt" length="4"^>16^</version^>>>app.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>app.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>app.xml
echo   ^<title_version type="hexBinary" length="2"^>0000^</title_version^>>>app.xml
echo   ^<sdk_version type="unsignedInt" length="4"^>20911^</sdk_version^>>>app.xml
echo   ^<app_type type="hexBinary" length="4"^>80000000^</app_type^>>>app.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>app.xml
echo   ^<os_mask type="hexBinary" length="32"^>0000000000000000000000000000000000000000000000000000000000000000^</os_mask^>>>app.xml
echo   ^<common_id type="hexBinary" length="8"^>0000000000000000^</common_id^>>>app.xml
echo ^</app^>>>app.xml
goto editmetaxmleb
:editappxmlkb
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (0-F): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\TOOLS\Storage\ID"
if %errorlevel%==0 goto erroridcheck
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>app.xml
echo ^<app type="complex" access="777"^>>>app.xml
echo   ^<version type="unsignedInt" length="4"^>16^</version^>>>app.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>app.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>app.xml
echo   ^<title_version type="hexBinary" length="2"^>0000^</title_version^>>>app.xml
echo   ^<sdk_version type="unsignedInt" length="4"^>20911^</sdk_version^>>>app.xml
echo   ^<app_type type="hexBinary" length="4"^>80000000^</app_type^>>>app.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>app.xml
echo   ^<os_mask type="hexBinary" length="32"^>0000000000000000000000000000000000000000000000000000000000000000^</os_mask^>>>app.xml
echo   ^<common_id type="hexBinary" length="8"^>0000000000000000^</common_id^>>>app.xml
echo ^</app^>>>app.xml
goto editmetaxmlkb
:editappxmlmk
set /p ID=Enter a 4-digit meta title ID you wish you use. Must only be HEX values. (0-F): >con
echo %ID%>..\TOOLS\Storage\ID
findstr /r "[^0-9a-fA-F]" "..\TOOLS\Storage\ID"
if %errorlevel%==0 goto erroridcheck
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>app.xml
echo ^<app type="complex" access="777"^>>>app.xml
echo   ^<version type="unsignedInt" length="4"^>16^</version^>>>app.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>app.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>app.xml
echo   ^<title_version type="hexBinary" length="2"^>0000^</title_version^>>>app.xml
echo   ^<sdk_version type="unsignedInt" length="4"^>20911^</sdk_version^>>>app.xml
echo   ^<app_type type="hexBinary" length="4"^>80000000^</app_type^>>>app.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>app.xml
echo   ^<os_mask type="hexBinary" length="32"^>0000000000000000000000000000000000000000000000000000000000000000^</os_mask^>>>app.xml
echo   ^<common_id type="hexBinary" length="8"^>0000000000000000^</common_id^>>>app.xml
echo ^</app^>>>app.xml
goto editmetaxmlmk
:editmetaxmlnes
cls
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): 
set /p Name=Enter the Game name:  
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>meta.xml
echo ^<menu type="complex" access="777"^>>>meta.xml
echo   ^<version type="unsignedInt" length="4"^>33^</version^>>>meta.xml
echo   ^<product_code type="string" length="32"^>WUP-N-%PDC%^</product_code^>>>meta.xml
echo   ^<content_platform type="string" length="32"^>WUP^</content_platform^>>>meta.xml
echo   ^<company_code type="string" length="8"^>0001^</company_code^>>>meta.xml
echo   ^<mastering_date type="string" length="32"^>^</mastering_date^>>>meta.xml
echo   ^<logo_type type="unsignedInt" length="4"^>0^</logo_type^>>>meta.xml
echo   ^<app_launch_type type="hexBinary" length="4"^>00000000^</app_launch_type^>>>meta.xml
echo   ^<invisible_flag type="hexBinary" length="4"^>00000000^</invisible_flag^>>>meta.xml
echo   ^<no_managed_flag type="hexBinary" length="4"^>00000000^</no_managed_flag^>>>meta.xml
echo   ^<no_event_log type="hexBinary" length="4"^>00000002^</no_event_log^>>>meta.xml
echo   ^<no_icon_database type="hexBinary" length="4"^>00000000^</no_icon_database^>>>meta.xml
echo   ^<launching_flag type="hexBinary" length="4"^>00000004^</launching_flag^>>>meta.xml
echo   ^<install_flag type="hexBinary" length="4"^>00000000^</install_flag^>>>meta.xml
echo   ^<closing_msg type="unsignedInt" length="4"^>0^</closing_msg^>>>meta.xml
echo   ^<title_version type="unsignedInt" length="4"^>0^</title_version^>>>meta.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>meta.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>meta.xml
echo   ^<boss_id type="hexBinary" length="8"^>0000000000000000^</boss_id^>>>meta.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>meta.xml
echo   ^<app_size type="hexBinary" length="8"^>0000000000000000^</app_size^>>>meta.xml
echo   ^<common_save_size type="hexBinary" length="8"^>0000000000000000^</common_save_size^>>>meta.xml
echo   ^<account_save_size type="hexBinary" length="8"^>0000000000000000^</account_save_size^>>>meta.xml
echo   ^<common_boss_size type="hexBinary" length="8"^>0000000000000000^</common_boss_size^>>>meta.xml
echo   ^<account_boss_size type="hexBinary" length="8"^>0000000000000000^</account_boss_size^>>>meta.xml
echo   ^<save_no_rollback type="unsignedInt" length="4"^>0^</save_no_rollback^>>>meta.xml
echo   ^<join_game_id type="hexBinary" length="4"^>00000000^</join_game_id^>>>meta.xml
echo   ^<join_game_mode_mask type="hexBinary" length="8"^>0000000000000000^</join_game_mode_mask^>>>meta.xml
echo   ^<bg_daemon_enable type="unsignedInt" length="4"^>0^</bg_daemon_enable^>>>meta.xml
echo   ^<olv_accesskey type="unsignedInt" length="4"^>3921400692^</olv_accesskey^>>>meta.xml
echo   ^<wood_tin type="unsignedInt" length="4"^>0^</wood_tin^>>>meta.xml
echo   ^<e_manual type="unsignedInt" length="4"^>0^</e_manual^>>>meta.xml
echo   ^<e_manual_version type="unsignedInt" length="4"^>0^</e_manual_version^>>>meta.xml
echo   ^<region type="hexBinary" length="4"^>00000002^</region^>>>meta.xml
echo   ^<pc_cero type="unsignedInt" length="4"^>128^</pc_cero^>>>meta.xml
echo   ^<pc_esrb type="unsignedInt" length="4"^>13^</pc_esrb^>>>meta.xml
echo   ^<pc_bbfc type="unsignedInt" length="4"^>192^</pc_bbfc^>>>meta.xml
echo   ^<pc_usk type="unsignedInt" length="4"^>128^</pc_usk^>>>meta.xml
echo   ^<pc_pegi_gen type="unsignedInt" length="4"^>128^</pc_pegi_gen^>>>meta.xml
echo   ^<pc_pegi_fin type="unsignedInt" length="4"^>192^</pc_pegi_fin^>>>meta.xml
echo   ^<pc_pegi_prt type="unsignedInt" length="4"^>128^</pc_pegi_prt^>>>meta.xml
echo   ^<pc_pegi_bbfc type="unsignedInt" length="4"^>128^</pc_pegi_bbfc^>>>meta.xml
echo   ^<pc_cob type="unsignedInt" length="4"^>128^</pc_cob^>>>meta.xml
echo   ^<pc_grb type="unsignedInt" length="4"^>128^</pc_grb^>>>meta.xml
echo   ^<pc_cgsrr type="unsignedInt" length="4"^>128^</pc_cgsrr^>>>meta.xml
echo   ^<pc_oflc type="unsignedInt" length="4"^>128^</pc_oflc^>>>meta.xml
echo   ^<pc_reserved0 type="unsignedInt" length="4"^>192^</pc_reserved0^>>>meta.xml
echo   ^<pc_reserved1 type="unsignedInt" length="4"^>192^</pc_reserved1^>>>meta.xml
echo   ^<pc_reserved2 type="unsignedInt" length="4"^>192^</pc_reserved2^>>>meta.xml
echo   ^<pc_reserved3 type="unsignedInt" length="4"^>192^</pc_reserved3^>>>meta.xml
echo   ^<ext_dev_nunchaku type="unsignedInt" length="4"^>0^</ext_dev_nunchaku^>>>meta.xml
echo   ^<ext_dev_classic type="unsignedInt" length="4"^>0^</ext_dev_classic^>>>meta.xml
echo   ^<ext_dev_urcc type="unsignedInt" length="4"^>0^</ext_dev_urcc^>>>meta.xml
echo   ^<ext_dev_board type="unsignedInt" length="4"^>0^</ext_dev_board^>>>meta.xml
echo   ^<ext_dev_usb_keyboard type="unsignedInt" length="4"^>0^</ext_dev_usb_keyboard^>>>meta.xml
echo   ^<ext_dev_etc type="unsignedInt" length="4"^>0^</ext_dev_etc^>>>meta.xml
echo   ^<ext_dev_etc_name type="string" length="512"^>^</ext_dev_etc_name^>>>meta.xml
echo   ^<eula_version type="unsignedInt" length="4"^>0^</eula_version^>>>meta.xml
echo   ^<drc_use type="unsignedInt" length="4"^>1^</drc_use^>>>meta.xml
echo   ^<network_use type="unsignedInt" length="4"^>0^</network_use^>>>meta.xml
echo   ^<online_account_use type="unsignedInt" length="4"^>0^</online_account_use^>>>meta.xml
echo   ^<direct_boot type="unsignedInt" length="4"^>0^</direct_boot^>>>meta.xml
echo   ^<reserved_flag0 type="hexBinary" length="4"^>00010001^</reserved_flag0^>>>meta.xml
echo   ^<reserved_flag1 type="hexBinary" length="4"^>00080023^</reserved_flag1^>>>meta.xml
echo   ^<reserved_flag2 type="hexBinary" length="4"^>53583445^</reserved_flag2^>>>meta.xml
echo   ^<reserved_flag3 type="hexBinary" length="4"^>00000000^</reserved_flag3^>>>meta.xml
echo   ^<reserved_flag4 type="hexBinary" length="4"^>00000000^</reserved_flag4^>>>meta.xml
echo   ^<reserved_flag5 type="hexBinary" length="4"^>00000000^</reserved_flag5^>>>meta.xml
echo   ^<reserved_flag6 type="hexBinary" length="4"^>00000003^</reserved_flag6^>>>meta.xml
echo   ^<reserved_flag7 type="hexBinary" length="4"^>00000005^</reserved_flag7^>>>meta.xml
echo   ^<longname_ja type="string" length="512"^>%Name%^</longname_ja^>>>meta.xml
echo   ^<longname_en type="string" length="512"^>%Name%^</longname_en^>>>meta.xml
echo   ^<longname_fr type="string" length="512"^>%Name%^</longname_fr^>>>meta.xml
echo   ^<longname_de type="string" length="512"^>%Name%^</longname_de^>>>meta.xml
echo   ^<longname_it type="string" length="512"^>%Name%^</longname_it^>>>meta.xml
echo   ^<longname_es type="string" length="512"^>%Name%^</longname_es^>>>meta.xml
echo   ^<longname_zhs type="string" length="512"^>%Name%^</longname_zhs^>>>meta.xml
echo   ^<longname_ko type="string" length="512"^>%Name%^</longname_ko^>>>meta.xml
echo   ^<longname_nl type="string" length="512"^>%Name%^</longname_nl^>>>meta.xml
echo   ^<longname_pt type="string" length="512"^>%Name%^</longname_pt^>>>meta.xml
echo   ^<longname_ru type="string" length="512"^>%Name%^</longname_ru^>>>meta.xml
echo   ^<longname_zht type="string" length="512"^>%Name%^</longname_zht^>>>meta.xml
echo   ^<shortname_ja type="string" length="256"^>%Name%^</shortname_ja^>>>meta.xml
echo   ^<shortname_en type="string" length="256"^>%Name%^</shortname_en^>>>meta.xml
echo   ^<shortname_fr type="string" length="256"^>%Name%^</shortname_fr^>>>meta.xml
echo   ^<shortname_de type="string" length="256"^>%Name%^</shortname_de^>>>meta.xml
echo   ^<shortname_it type="string" length="256"^>%Name%^</shortname_it^>>>meta.xml
echo   ^<shortname_es type="string" length="256"^>%Name%^</shortname_es^>>>meta.xml
echo   ^<shortname_zhs type="string" length="256"^>%Name%^</shortname_zhs^>>>meta.xml
echo   ^<shortname_ko type="string" length="256"^>%Name%^</shortname_ko^>>>meta.xml
echo   ^<shortname_nl type="string" length="256"^>%Name%^</shortname_nl^>>>meta.xml
echo   ^<shortname_pt type="string" length="256"^>%Name%^</shortname_pt^>>>meta.xml
echo   ^<shortname_ru type="string" length="256"^>%Name%^</shortname_ru^>>>meta.xml
echo   ^<shortname_zht type="string" length="256"^>%Name%^</shortname_zht^>>>meta.xml
echo   ^<publisher_ja type="string" length="256"^>NINTENDO^</publisher_ja^>>>meta.xml
echo   ^<publisher_en type="string" length="256"^>NINTENDO^</publisher_en^>>>meta.xml
echo   ^<publisher_fr type="string" length="256"^>NINTENDO^</publisher_fr^>>>meta.xml
echo   ^<publisher_de type="string" length="256"^>NINTENDO^</publisher_de^>>>meta.xml
echo   ^<publisher_it type="string" length="256"^>NINTENDO^</publisher_it^>>>meta.xml
echo   ^<publisher_es type="string" length="256"^>NINTENDO^</publisher_es^>>>meta.xml
echo   ^<publisher_zhs type="string" length="256"^>NINTENDO^</publisher_zhs^>>>meta.xml
echo   ^<publisher_ko type="string" length="256"^>NINTENDO^</publisher_ko^>>>meta.xml
echo   ^<publisher_nl type="string" length="256"^>NINTENDO^</publisher_nl^>>>meta.xml
echo   ^<publisher_pt type="string" length="256"^>NINTENDO^</publisher_pt^>>>meta.xml
echo   ^<publisher_ru type="string" length="256"^>NINTENDO^</publisher_ru^>>>meta.xml
echo   ^<publisher_zht type="string" length="256"^>NINTENDO^</publisher_zht^>>>meta.xml
echo   ^<add_on_unique_id0 type="hexBinary" length="4"^>00000000^</add_on_unique_id0^>>>meta.xml
echo   ^<add_on_unique_id1 type="hexBinary" length="4"^>00000000^</add_on_unique_id1^>>>meta.xml
echo   ^<add_on_unique_id2 type="hexBinary" length="4"^>00000000^</add_on_unique_id2^>>>meta.xml
echo   ^<add_on_unique_id3 type="hexBinary" length="4"^>00000000^</add_on_unique_id3^>>>meta.xml
echo   ^<add_on_unique_id4 type="hexBinary" length="4"^>00000000^</add_on_unique_id4^>>>meta.xml
echo   ^<add_on_unique_id5 type="hexBinary" length="4"^>00000000^</add_on_unique_id5^>>>meta.xml
echo   ^<add_on_unique_id6 type="hexBinary" length="4"^>00000000^</add_on_unique_id6^>>>meta.xml
echo   ^<add_on_unique_id7 type="hexBinary" length="4"^>00000000^</add_on_unique_id7^>>>meta.xml
echo   ^<add_on_unique_id8 type="hexBinary" length="4"^>00000000^</add_on_unique_id8^>>>meta.xml
echo   ^<add_on_unique_id9 type="hexBinary" length="4"^>00000000^</add_on_unique_id9^>>>meta.xml
echo   ^<add_on_unique_id10 type="hexBinary" length="4"^>00000000^</add_on_unique_id10^>>>meta.xml
echo   ^<add_on_unique_id11 type="hexBinary" length="4"^>00000000^</add_on_unique_id11^>>>meta.xml
echo   ^<add_on_unique_id12 type="hexBinary" length="4"^>00000000^</add_on_unique_id12^>>>meta.xml
echo   ^<add_on_unique_id13 type="hexBinary" length="4"^>00000000^</add_on_unique_id13^>>>meta.xml
echo   ^<add_on_unique_id14 type="hexBinary" length="4"^>00000000^</add_on_unique_id14^>>>meta.xml
echo   ^<add_on_unique_id15 type="hexBinary" length="4"^>00000000^</add_on_unique_id15^>>>meta.xml
echo   ^<add_on_unique_id16 type="hexBinary" length="4"^>00000000^</add_on_unique_id16^>>>meta.xml
echo   ^<add_on_unique_id17 type="hexBinary" length="4"^>00000000^</add_on_unique_id17^>>>meta.xml
echo   ^<add_on_unique_id18 type="hexBinary" length="4"^>00000000^</add_on_unique_id18^>>>meta.xml
echo   ^<add_on_unique_id19 type="hexBinary" length="4"^>00000000^</add_on_unique_id19^>>>meta.xml
echo   ^<add_on_unique_id20 type="hexBinary" length="4"^>00000000^</add_on_unique_id20^>>>meta.xml
echo   ^<add_on_unique_id21 type="hexBinary" length="4"^>00000000^</add_on_unique_id21^>>>meta.xml
echo   ^<add_on_unique_id22 type="hexBinary" length="4"^>00000000^</add_on_unique_id22^>>>meta.xml
echo   ^<add_on_unique_id23 type="hexBinary" length="4"^>00000000^</add_on_unique_id23^>>>meta.xml
echo   ^<add_on_unique_id24 type="hexBinary" length="4"^>00000000^</add_on_unique_id24^>>>meta.xml
echo   ^<add_on_unique_id25 type="hexBinary" length="4"^>00000000^</add_on_unique_id25^>>>meta.xml
echo   ^<add_on_unique_id26 type="hexBinary" length="4"^>00000000^</add_on_unique_id26^>>>meta.xml
echo   ^<add_on_unique_id27 type="hexBinary" length="4"^>00000000^</add_on_unique_id27^>>>meta.xml
echo   ^<add_on_unique_id28 type="hexBinary" length="4"^>00000000^</add_on_unique_id28^>>>meta.xml
echo   ^<add_on_unique_id29 type="hexBinary" length="4"^>00000000^</add_on_unique_id29^>>>meta.xml
echo   ^<add_on_unique_id30 type="hexBinary" length="4"^>00000000^</add_on_unique_id30^>>>meta.xml
echo   ^<add_on_unique_id31 type="hexBinary" length="4"^>00000000^</add_on_unique_id31^>>>meta.xml
echo ^</menu^>>>meta.xml
cls
goto movebackromfilesnes
:editmetaxmlsnes
cls
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): 
set /p Name=Enter the Game name:  
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>meta.xml
echo ^<menu type="complex" access="777"^>>>meta.xml
echo   ^<version type="unsignedInt" length="4"^>33^</version^>>>meta.xml
echo   ^<product_code type="string" length="32"^>WUP-N-%PDC%^</product_code^>>>meta.xml
echo   ^<content_platform type="string" length="32"^>WUP^</content_platform^>>>meta.xml
echo   ^<company_code type="string" length="8"^>0001^</company_code^>>>meta.xml
echo   ^<mastering_date type="string" length="32"^>^</mastering_date^>>>meta.xml
echo   ^<logo_type type="unsignedInt" length="4"^>0^</logo_type^>>>meta.xml
echo   ^<app_launch_type type="hexBinary" length="4"^>00000000^</app_launch_type^>>>meta.xml
echo   ^<invisible_flag type="hexBinary" length="4"^>00000000^</invisible_flag^>>>meta.xml
echo   ^<no_managed_flag type="hexBinary" length="4"^>00000000^</no_managed_flag^>>>meta.xml
echo   ^<no_event_log type="hexBinary" length="4"^>00000002^</no_event_log^>>>meta.xml
echo   ^<no_icon_database type="hexBinary" length="4"^>00000000^</no_icon_database^>>>meta.xml
echo   ^<launching_flag type="hexBinary" length="4"^>00000004^</launching_flag^>>>meta.xml
echo   ^<install_flag type="hexBinary" length="4"^>00000000^</install_flag^>>>meta.xml
echo   ^<closing_msg type="unsignedInt" length="4"^>0^</closing_msg^>>>meta.xml
echo   ^<title_version type="unsignedInt" length="4"^>0^</title_version^>>>meta.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>meta.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>meta.xml
echo   ^<boss_id type="hexBinary" length="8"^>0000000000000000^</boss_id^>>>meta.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>meta.xml
echo   ^<app_size type="hexBinary" length="8"^>0000000000000000^</app_size^>>>meta.xml
echo   ^<common_save_size type="hexBinary" length="8"^>0000000000000000^</common_save_size^>>>meta.xml
echo   ^<account_save_size type="hexBinary" length="8"^>0000000000000000^</account_save_size^>>>meta.xml
echo   ^<common_boss_size type="hexBinary" length="8"^>0000000000000000^</common_boss_size^>>>meta.xml
echo   ^<account_boss_size type="hexBinary" length="8"^>0000000000000000^</account_boss_size^>>>meta.xml
echo   ^<save_no_rollback type="unsignedInt" length="4"^>0^</save_no_rollback^>>>meta.xml
echo   ^<join_game_id type="hexBinary" length="4"^>00000000^</join_game_id^>>>meta.xml
echo   ^<join_game_mode_mask type="hexBinary" length="8"^>0000000000000000^</join_game_mode_mask^>>>meta.xml
echo   ^<bg_daemon_enable type="unsignedInt" length="4"^>0^</bg_daemon_enable^>>>meta.xml
echo   ^<olv_accesskey type="unsignedInt" length="4"^>3921400692^</olv_accesskey^>>>meta.xml
echo   ^<wood_tin type="unsignedInt" length="4"^>0^</wood_tin^>>>meta.xml
echo   ^<e_manual type="unsignedInt" length="4"^>0^</e_manual^>>>meta.xml
echo   ^<e_manual_version type="unsignedInt" length="4"^>0^</e_manual_version^>>>meta.xml
echo   ^<region type="hexBinary" length="4"^>00000002^</region^>>>meta.xml
echo   ^<pc_cero type="unsignedInt" length="4"^>128^</pc_cero^>>>meta.xml
echo   ^<pc_esrb type="unsignedInt" length="4"^>13^</pc_esrb^>>>meta.xml
echo   ^<pc_bbfc type="unsignedInt" length="4"^>192^</pc_bbfc^>>>meta.xml
echo   ^<pc_usk type="unsignedInt" length="4"^>128^</pc_usk^>>>meta.xml
echo   ^<pc_pegi_gen type="unsignedInt" length="4"^>128^</pc_pegi_gen^>>>meta.xml
echo   ^<pc_pegi_fin type="unsignedInt" length="4"^>192^</pc_pegi_fin^>>>meta.xml
echo   ^<pc_pegi_prt type="unsignedInt" length="4"^>128^</pc_pegi_prt^>>>meta.xml
echo   ^<pc_pegi_bbfc type="unsignedInt" length="4"^>128^</pc_pegi_bbfc^>>>meta.xml
echo   ^<pc_cob type="unsignedInt" length="4"^>128^</pc_cob^>>>meta.xml
echo   ^<pc_grb type="unsignedInt" length="4"^>128^</pc_grb^>>>meta.xml
echo   ^<pc_cgsrr type="unsignedInt" length="4"^>128^</pc_cgsrr^>>>meta.xml
echo   ^<pc_oflc type="unsignedInt" length="4"^>128^</pc_oflc^>>>meta.xml
echo   ^<pc_reserved0 type="unsignedInt" length="4"^>192^</pc_reserved0^>>>meta.xml
echo   ^<pc_reserved1 type="unsignedInt" length="4"^>192^</pc_reserved1^>>>meta.xml
echo   ^<pc_reserved2 type="unsignedInt" length="4"^>192^</pc_reserved2^>>>meta.xml
echo   ^<pc_reserved3 type="unsignedInt" length="4"^>192^</pc_reserved3^>>>meta.xml
echo   ^<ext_dev_nunchaku type="unsignedInt" length="4"^>0^</ext_dev_nunchaku^>>>meta.xml
echo   ^<ext_dev_classic type="unsignedInt" length="4"^>0^</ext_dev_classic^>>>meta.xml
echo   ^<ext_dev_urcc type="unsignedInt" length="4"^>0^</ext_dev_urcc^>>>meta.xml
echo   ^<ext_dev_board type="unsignedInt" length="4"^>0^</ext_dev_board^>>>meta.xml
echo   ^<ext_dev_usb_keyboard type="unsignedInt" length="4"^>0^</ext_dev_usb_keyboard^>>>meta.xml
echo   ^<ext_dev_etc type="unsignedInt" length="4"^>0^</ext_dev_etc^>>>meta.xml
echo   ^<ext_dev_etc_name type="string" length="512"^>^</ext_dev_etc_name^>>>meta.xml
echo   ^<eula_version type="unsignedInt" length="4"^>0^</eula_version^>>>meta.xml
echo   ^<drc_use type="unsignedInt" length="4"^>1^</drc_use^>>>meta.xml
echo   ^<network_use type="unsignedInt" length="4"^>0^</network_use^>>>meta.xml
echo   ^<online_account_use type="unsignedInt" length="4"^>0^</online_account_use^>>>meta.xml
echo   ^<direct_boot type="unsignedInt" length="4"^>0^</direct_boot^>>>meta.xml
echo   ^<reserved_flag0 type="hexBinary" length="4"^>00010001^</reserved_flag0^>>>meta.xml
echo   ^<reserved_flag1 type="hexBinary" length="4"^>00080023^</reserved_flag1^>>>meta.xml
echo   ^<reserved_flag2 type="hexBinary" length="4"^>53583445^</reserved_flag2^>>>meta.xml
echo   ^<reserved_flag3 type="hexBinary" length="4"^>00000000^</reserved_flag3^>>>meta.xml
echo   ^<reserved_flag4 type="hexBinary" length="4"^>00000000^</reserved_flag4^>>>meta.xml
echo   ^<reserved_flag5 type="hexBinary" length="4"^>00000000^</reserved_flag5^>>>meta.xml
echo   ^<reserved_flag6 type="hexBinary" length="4"^>00000003^</reserved_flag6^>>>meta.xml
echo   ^<reserved_flag7 type="hexBinary" length="4"^>00000005^</reserved_flag7^>>>meta.xml
echo   ^<longname_ja type="string" length="512"^>%Name%^</longname_ja^>>>meta.xml
echo   ^<longname_en type="string" length="512"^>%Name%^</longname_en^>>>meta.xml
echo   ^<longname_fr type="string" length="512"^>%Name%^</longname_fr^>>>meta.xml
echo   ^<longname_de type="string" length="512"^>%Name%^</longname_de^>>>meta.xml
echo   ^<longname_it type="string" length="512"^>%Name%^</longname_it^>>>meta.xml
echo   ^<longname_es type="string" length="512"^>%Name%^</longname_es^>>>meta.xml
echo   ^<longname_zhs type="string" length="512"^>%Name%^</longname_zhs^>>>meta.xml
echo   ^<longname_ko type="string" length="512"^>%Name%^</longname_ko^>>>meta.xml
echo   ^<longname_nl type="string" length="512"^>%Name%^</longname_nl^>>>meta.xml
echo   ^<longname_pt type="string" length="512"^>%Name%^</longname_pt^>>>meta.xml
echo   ^<longname_ru type="string" length="512"^>%Name%^</longname_ru^>>>meta.xml
echo   ^<longname_zht type="string" length="512"^>%Name%^</longname_zht^>>>meta.xml
echo   ^<shortname_ja type="string" length="256"^>%Name%^</shortname_ja^>>>meta.xml
echo   ^<shortname_en type="string" length="256"^>%Name%^</shortname_en^>>>meta.xml
echo   ^<shortname_fr type="string" length="256"^>%Name%^</shortname_fr^>>>meta.xml
echo   ^<shortname_de type="string" length="256"^>%Name%^</shortname_de^>>>meta.xml
echo   ^<shortname_it type="string" length="256"^>%Name%^</shortname_it^>>>meta.xml
echo   ^<shortname_es type="string" length="256"^>%Name%^</shortname_es^>>>meta.xml
echo   ^<shortname_zhs type="string" length="256"^>%Name%^</shortname_zhs^>>>meta.xml
echo   ^<shortname_ko type="string" length="256"^>%Name%^</shortname_ko^>>>meta.xml
echo   ^<shortname_nl type="string" length="256"^>%Name%^</shortname_nl^>>>meta.xml
echo   ^<shortname_pt type="string" length="256"^>%Name%^</shortname_pt^>>>meta.xml
echo   ^<shortname_ru type="string" length="256"^>%Name%^</shortname_ru^>>>meta.xml
echo   ^<shortname_zht type="string" length="256"^>%Name%^</shortname_zht^>>>meta.xml
echo   ^<publisher_ja type="string" length="256"^>NINTENDO^</publisher_ja^>>>meta.xml
echo   ^<publisher_en type="string" length="256"^>NINTENDO^</publisher_en^>>>meta.xml
echo   ^<publisher_fr type="string" length="256"^>NINTENDO^</publisher_fr^>>>meta.xml
echo   ^<publisher_de type="string" length="256"^>NINTENDO^</publisher_de^>>>meta.xml
echo   ^<publisher_it type="string" length="256"^>NINTENDO^</publisher_it^>>>meta.xml
echo   ^<publisher_es type="string" length="256"^>NINTENDO^</publisher_es^>>>meta.xml
echo   ^<publisher_zhs type="string" length="256"^>NINTENDO^</publisher_zhs^>>>meta.xml
echo   ^<publisher_ko type="string" length="256"^>NINTENDO^</publisher_ko^>>>meta.xml
echo   ^<publisher_nl type="string" length="256"^>NINTENDO^</publisher_nl^>>>meta.xml
echo   ^<publisher_pt type="string" length="256"^>NINTENDO^</publisher_pt^>>>meta.xml
echo   ^<publisher_ru type="string" length="256"^>NINTENDO^</publisher_ru^>>>meta.xml
echo   ^<publisher_zht type="string" length="256"^>NINTENDO^</publisher_zht^>>>meta.xml
echo   ^<add_on_unique_id0 type="hexBinary" length="4"^>00000000^</add_on_unique_id0^>>>meta.xml
echo   ^<add_on_unique_id1 type="hexBinary" length="4"^>00000000^</add_on_unique_id1^>>>meta.xml
echo   ^<add_on_unique_id2 type="hexBinary" length="4"^>00000000^</add_on_unique_id2^>>>meta.xml
echo   ^<add_on_unique_id3 type="hexBinary" length="4"^>00000000^</add_on_unique_id3^>>>meta.xml
echo   ^<add_on_unique_id4 type="hexBinary" length="4"^>00000000^</add_on_unique_id4^>>>meta.xml
echo   ^<add_on_unique_id5 type="hexBinary" length="4"^>00000000^</add_on_unique_id5^>>>meta.xml
echo   ^<add_on_unique_id6 type="hexBinary" length="4"^>00000000^</add_on_unique_id6^>>>meta.xml
echo   ^<add_on_unique_id7 type="hexBinary" length="4"^>00000000^</add_on_unique_id7^>>>meta.xml
echo   ^<add_on_unique_id8 type="hexBinary" length="4"^>00000000^</add_on_unique_id8^>>>meta.xml
echo   ^<add_on_unique_id9 type="hexBinary" length="4"^>00000000^</add_on_unique_id9^>>>meta.xml
echo   ^<add_on_unique_id10 type="hexBinary" length="4"^>00000000^</add_on_unique_id10^>>>meta.xml
echo   ^<add_on_unique_id11 type="hexBinary" length="4"^>00000000^</add_on_unique_id11^>>>meta.xml
echo   ^<add_on_unique_id12 type="hexBinary" length="4"^>00000000^</add_on_unique_id12^>>>meta.xml
echo   ^<add_on_unique_id13 type="hexBinary" length="4"^>00000000^</add_on_unique_id13^>>>meta.xml
echo   ^<add_on_unique_id14 type="hexBinary" length="4"^>00000000^</add_on_unique_id14^>>>meta.xml
echo   ^<add_on_unique_id15 type="hexBinary" length="4"^>00000000^</add_on_unique_id15^>>>meta.xml
echo   ^<add_on_unique_id16 type="hexBinary" length="4"^>00000000^</add_on_unique_id16^>>>meta.xml
echo   ^<add_on_unique_id17 type="hexBinary" length="4"^>00000000^</add_on_unique_id17^>>>meta.xml
echo   ^<add_on_unique_id18 type="hexBinary" length="4"^>00000000^</add_on_unique_id18^>>>meta.xml
echo   ^<add_on_unique_id19 type="hexBinary" length="4"^>00000000^</add_on_unique_id19^>>>meta.xml
echo   ^<add_on_unique_id20 type="hexBinary" length="4"^>00000000^</add_on_unique_id20^>>>meta.xml
echo   ^<add_on_unique_id21 type="hexBinary" length="4"^>00000000^</add_on_unique_id21^>>>meta.xml
echo   ^<add_on_unique_id22 type="hexBinary" length="4"^>00000000^</add_on_unique_id22^>>>meta.xml
echo   ^<add_on_unique_id23 type="hexBinary" length="4"^>00000000^</add_on_unique_id23^>>>meta.xml
echo   ^<add_on_unique_id24 type="hexBinary" length="4"^>00000000^</add_on_unique_id24^>>>meta.xml
echo   ^<add_on_unique_id25 type="hexBinary" length="4"^>00000000^</add_on_unique_id25^>>>meta.xml
echo   ^<add_on_unique_id26 type="hexBinary" length="4"^>00000000^</add_on_unique_id26^>>>meta.xml
echo   ^<add_on_unique_id27 type="hexBinary" length="4"^>00000000^</add_on_unique_id27^>>>meta.xml
echo   ^<add_on_unique_id28 type="hexBinary" length="4"^>00000000^</add_on_unique_id28^>>>meta.xml
echo   ^<add_on_unique_id29 type="hexBinary" length="4"^>00000000^</add_on_unique_id29^>>>meta.xml
echo   ^<add_on_unique_id30 type="hexBinary" length="4"^>00000000^</add_on_unique_id30^>>>meta.xml
echo   ^<add_on_unique_id31 type="hexBinary" length="4"^>00000000^</add_on_unique_id31^>>>meta.xml
echo ^</menu^>>>meta.xml
cls
goto movebackromfilessnes

:editmetaxmldkc
cls
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): 
set /p Name=Enter the Game name:  
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>meta.xml
echo ^<menu type="complex" access="777"^>>>meta.xml
echo   ^<version type="unsignedInt" length="4"^>33^</version^>>>meta.xml
echo   ^<product_code type="string" length="32"^>WUP-N-%PDC%^</product_code^>>>meta.xml
echo   ^<content_platform type="string" length="32"^>WUP^</content_platform^>>>meta.xml
echo   ^<company_code type="string" length="8"^>0001^</company_code^>>>meta.xml
echo   ^<mastering_date type="string" length="32"^>^</mastering_date^>>>meta.xml
echo   ^<logo_type type="unsignedInt" length="4"^>0^</logo_type^>>>meta.xml
echo   ^<app_launch_type type="hexBinary" length="4"^>00000000^</app_launch_type^>>>meta.xml
echo   ^<invisible_flag type="hexBinary" length="4"^>00000000^</invisible_flag^>>>meta.xml
echo   ^<no_managed_flag type="hexBinary" length="4"^>00000000^</no_managed_flag^>>>meta.xml
echo   ^<no_event_log type="hexBinary" length="4"^>00000002^</no_event_log^>>>meta.xml
echo   ^<no_icon_database type="hexBinary" length="4"^>00000000^</no_icon_database^>>>meta.xml
echo   ^<launching_flag type="hexBinary" length="4"^>00000004^</launching_flag^>>>meta.xml
echo   ^<install_flag type="hexBinary" length="4"^>00000000^</install_flag^>>>meta.xml
echo   ^<closing_msg type="unsignedInt" length="4"^>0^</closing_msg^>>>meta.xml
echo   ^<title_version type="unsignedInt" length="4"^>0^</title_version^>>>meta.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>meta.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>meta.xml
echo   ^<boss_id type="hexBinary" length="8"^>0000000000000000^</boss_id^>>>meta.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>meta.xml
echo   ^<app_size type="hexBinary" length="8"^>0000000000000000^</app_size^>>>meta.xml
echo   ^<common_save_size type="hexBinary" length="8"^>0000000000000000^</common_save_size^>>>meta.xml
echo   ^<account_save_size type="hexBinary" length="8"^>0000000000000000^</account_save_size^>>>meta.xml
echo   ^<common_boss_size type="hexBinary" length="8"^>0000000000000000^</common_boss_size^>>>meta.xml
echo   ^<account_boss_size type="hexBinary" length="8"^>0000000000000000^</account_boss_size^>>>meta.xml
echo   ^<save_no_rollback type="unsignedInt" length="4"^>0^</save_no_rollback^>>>meta.xml
echo   ^<join_game_id type="hexBinary" length="4"^>00000000^</join_game_id^>>>meta.xml
echo   ^<join_game_mode_mask type="hexBinary" length="8"^>0000000000000000^</join_game_mode_mask^>>>meta.xml
echo   ^<bg_daemon_enable type="unsignedInt" length="4"^>0^</bg_daemon_enable^>>>meta.xml
echo   ^<olv_accesskey type="unsignedInt" length="4"^>3921400692^</olv_accesskey^>>>meta.xml
echo   ^<wood_tin type="unsignedInt" length="4"^>0^</wood_tin^>>>meta.xml
echo   ^<e_manual type="unsignedInt" length="4"^>0^</e_manual^>>>meta.xml
echo   ^<e_manual_version type="unsignedInt" length="4"^>0^</e_manual_version^>>>meta.xml
echo   ^<region type="hexBinary" length="4"^>00000002^</region^>>>meta.xml
echo   ^<pc_cero type="unsignedInt" length="4"^>128^</pc_cero^>>>meta.xml
echo   ^<pc_esrb type="unsignedInt" length="4"^>13^</pc_esrb^>>>meta.xml
echo   ^<pc_bbfc type="unsignedInt" length="4"^>192^</pc_bbfc^>>>meta.xml
echo   ^<pc_usk type="unsignedInt" length="4"^>128^</pc_usk^>>>meta.xml
echo   ^<pc_pegi_gen type="unsignedInt" length="4"^>128^</pc_pegi_gen^>>>meta.xml
echo   ^<pc_pegi_fin type="unsignedInt" length="4"^>192^</pc_pegi_fin^>>>meta.xml
echo   ^<pc_pegi_prt type="unsignedInt" length="4"^>128^</pc_pegi_prt^>>>meta.xml
echo   ^<pc_pegi_bbfc type="unsignedInt" length="4"^>128^</pc_pegi_bbfc^>>>meta.xml
echo   ^<pc_cob type="unsignedInt" length="4"^>128^</pc_cob^>>>meta.xml
echo   ^<pc_grb type="unsignedInt" length="4"^>128^</pc_grb^>>>meta.xml
echo   ^<pc_cgsrr type="unsignedInt" length="4"^>128^</pc_cgsrr^>>>meta.xml
echo   ^<pc_oflc type="unsignedInt" length="4"^>128^</pc_oflc^>>>meta.xml
echo   ^<pc_reserved0 type="unsignedInt" length="4"^>192^</pc_reserved0^>>>meta.xml
echo   ^<pc_reserved1 type="unsignedInt" length="4"^>192^</pc_reserved1^>>>meta.xml
echo   ^<pc_reserved2 type="unsignedInt" length="4"^>192^</pc_reserved2^>>>meta.xml
echo   ^<pc_reserved3 type="unsignedInt" length="4"^>192^</pc_reserved3^>>>meta.xml
echo   ^<ext_dev_nunchaku type="unsignedInt" length="4"^>0^</ext_dev_nunchaku^>>>meta.xml
echo   ^<ext_dev_classic type="unsignedInt" length="4"^>0^</ext_dev_classic^>>>meta.xml
echo   ^<ext_dev_urcc type="unsignedInt" length="4"^>0^</ext_dev_urcc^>>>meta.xml
echo   ^<ext_dev_board type="unsignedInt" length="4"^>0^</ext_dev_board^>>>meta.xml
echo   ^<ext_dev_usb_keyboard type="unsignedInt" length="4"^>0^</ext_dev_usb_keyboard^>>>meta.xml
echo   ^<ext_dev_etc type="unsignedInt" length="4"^>0^</ext_dev_etc^>>>meta.xml
echo   ^<ext_dev_etc_name type="string" length="512"^>^</ext_dev_etc_name^>>>meta.xml
echo   ^<eula_version type="unsignedInt" length="4"^>0^</eula_version^>>>meta.xml
echo   ^<drc_use type="unsignedInt" length="4"^>1^</drc_use^>>>meta.xml
echo   ^<network_use type="unsignedInt" length="4"^>0^</network_use^>>>meta.xml
echo   ^<online_account_use type="unsignedInt" length="4"^>0^</online_account_use^>>>meta.xml
echo   ^<direct_boot type="unsignedInt" length="4"^>0^</direct_boot^>>>meta.xml
echo   ^<reserved_flag0 type="hexBinary" length="4"^>00010001^</reserved_flag0^>>>meta.xml
echo   ^<reserved_flag1 type="hexBinary" length="4"^>00080023^</reserved_flag1^>>>meta.xml
echo   ^<reserved_flag2 type="hexBinary" length="4"^>53583445^</reserved_flag2^>>>meta.xml
echo   ^<reserved_flag3 type="hexBinary" length="4"^>00000000^</reserved_flag3^>>>meta.xml
echo   ^<reserved_flag4 type="hexBinary" length="4"^>00000000^</reserved_flag4^>>>meta.xml
echo   ^<reserved_flag5 type="hexBinary" length="4"^>00000000^</reserved_flag5^>>>meta.xml
echo   ^<reserved_flag6 type="hexBinary" length="4"^>00000003^</reserved_flag6^>>>meta.xml
echo   ^<reserved_flag7 type="hexBinary" length="4"^>00000005^</reserved_flag7^>>>meta.xml
echo   ^<longname_ja type="string" length="512"^>%Name%^</longname_ja^>>>meta.xml
echo   ^<longname_en type="string" length="512"^>%Name%^</longname_en^>>>meta.xml
echo   ^<longname_fr type="string" length="512"^>%Name%^</longname_fr^>>>meta.xml
echo   ^<longname_de type="string" length="512"^>%Name%^</longname_de^>>>meta.xml
echo   ^<longname_it type="string" length="512"^>%Name%^</longname_it^>>>meta.xml
echo   ^<longname_es type="string" length="512"^>%Name%^</longname_es^>>>meta.xml
echo   ^<longname_zhs type="string" length="512"^>%Name%^</longname_zhs^>>>meta.xml
echo   ^<longname_ko type="string" length="512"^>%Name%^</longname_ko^>>>meta.xml
echo   ^<longname_nl type="string" length="512"^>%Name%^</longname_nl^>>>meta.xml
echo   ^<longname_pt type="string" length="512"^>%Name%^</longname_pt^>>>meta.xml
echo   ^<longname_ru type="string" length="512"^>%Name%^</longname_ru^>>>meta.xml
echo   ^<longname_zht type="string" length="512"^>%Name%^</longname_zht^>>>meta.xml
echo   ^<shortname_ja type="string" length="256"^>%Name%^</shortname_ja^>>>meta.xml
echo   ^<shortname_en type="string" length="256"^>%Name%^</shortname_en^>>>meta.xml
echo   ^<shortname_fr type="string" length="256"^>%Name%^</shortname_fr^>>>meta.xml
echo   ^<shortname_de type="string" length="256"^>%Name%^</shortname_de^>>>meta.xml
echo   ^<shortname_it type="string" length="256"^>%Name%^</shortname_it^>>>meta.xml
echo   ^<shortname_es type="string" length="256"^>%Name%^</shortname_es^>>>meta.xml
echo   ^<shortname_zhs type="string" length="256"^>%Name%^</shortname_zhs^>>>meta.xml
echo   ^<shortname_ko type="string" length="256"^>%Name%^</shortname_ko^>>>meta.xml
echo   ^<shortname_nl type="string" length="256"^>%Name%^</shortname_nl^>>>meta.xml
echo   ^<shortname_pt type="string" length="256"^>%Name%^</shortname_pt^>>>meta.xml
echo   ^<shortname_ru type="string" length="256"^>%Name%^</shortname_ru^>>>meta.xml
echo   ^<shortname_zht type="string" length="256"^>%Name%^</shortname_zht^>>>meta.xml
echo   ^<publisher_ja type="string" length="256"^>NINTENDO^</publisher_ja^>>>meta.xml
echo   ^<publisher_en type="string" length="256"^>NINTENDO^</publisher_en^>>>meta.xml
echo   ^<publisher_fr type="string" length="256"^>NINTENDO^</publisher_fr^>>>meta.xml
echo   ^<publisher_de type="string" length="256"^>NINTENDO^</publisher_de^>>>meta.xml
echo   ^<publisher_it type="string" length="256"^>NINTENDO^</publisher_it^>>>meta.xml
echo   ^<publisher_es type="string" length="256"^>NINTENDO^</publisher_es^>>>meta.xml
echo   ^<publisher_zhs type="string" length="256"^>NINTENDO^</publisher_zhs^>>>meta.xml
echo   ^<publisher_ko type="string" length="256"^>NINTENDO^</publisher_ko^>>>meta.xml
echo   ^<publisher_nl type="string" length="256"^>NINTENDO^</publisher_nl^>>>meta.xml
echo   ^<publisher_pt type="string" length="256"^>NINTENDO^</publisher_pt^>>>meta.xml
echo   ^<publisher_ru type="string" length="256"^>NINTENDO^</publisher_ru^>>>meta.xml
echo   ^<publisher_zht type="string" length="256"^>NINTENDO^</publisher_zht^>>>meta.xml
echo   ^<add_on_unique_id0 type="hexBinary" length="4"^>00000000^</add_on_unique_id0^>>>meta.xml
echo   ^<add_on_unique_id1 type="hexBinary" length="4"^>00000000^</add_on_unique_id1^>>>meta.xml
echo   ^<add_on_unique_id2 type="hexBinary" length="4"^>00000000^</add_on_unique_id2^>>>meta.xml
echo   ^<add_on_unique_id3 type="hexBinary" length="4"^>00000000^</add_on_unique_id3^>>>meta.xml
echo   ^<add_on_unique_id4 type="hexBinary" length="4"^>00000000^</add_on_unique_id4^>>>meta.xml
echo   ^<add_on_unique_id5 type="hexBinary" length="4"^>00000000^</add_on_unique_id5^>>>meta.xml
echo   ^<add_on_unique_id6 type="hexBinary" length="4"^>00000000^</add_on_unique_id6^>>>meta.xml
echo   ^<add_on_unique_id7 type="hexBinary" length="4"^>00000000^</add_on_unique_id7^>>>meta.xml
echo   ^<add_on_unique_id8 type="hexBinary" length="4"^>00000000^</add_on_unique_id8^>>>meta.xml
echo   ^<add_on_unique_id9 type="hexBinary" length="4"^>00000000^</add_on_unique_id9^>>>meta.xml
echo   ^<add_on_unique_id10 type="hexBinary" length="4"^>00000000^</add_on_unique_id10^>>>meta.xml
echo   ^<add_on_unique_id11 type="hexBinary" length="4"^>00000000^</add_on_unique_id11^>>>meta.xml
echo   ^<add_on_unique_id12 type="hexBinary" length="4"^>00000000^</add_on_unique_id12^>>>meta.xml
echo   ^<add_on_unique_id13 type="hexBinary" length="4"^>00000000^</add_on_unique_id13^>>>meta.xml
echo   ^<add_on_unique_id14 type="hexBinary" length="4"^>00000000^</add_on_unique_id14^>>>meta.xml
echo   ^<add_on_unique_id15 type="hexBinary" length="4"^>00000000^</add_on_unique_id15^>>>meta.xml
echo   ^<add_on_unique_id16 type="hexBinary" length="4"^>00000000^</add_on_unique_id16^>>>meta.xml
echo   ^<add_on_unique_id17 type="hexBinary" length="4"^>00000000^</add_on_unique_id17^>>>meta.xml
echo   ^<add_on_unique_id18 type="hexBinary" length="4"^>00000000^</add_on_unique_id18^>>>meta.xml
echo   ^<add_on_unique_id19 type="hexBinary" length="4"^>00000000^</add_on_unique_id19^>>>meta.xml
echo   ^<add_on_unique_id20 type="hexBinary" length="4"^>00000000^</add_on_unique_id20^>>>meta.xml
echo   ^<add_on_unique_id21 type="hexBinary" length="4"^>00000000^</add_on_unique_id21^>>>meta.xml
echo   ^<add_on_unique_id22 type="hexBinary" length="4"^>00000000^</add_on_unique_id22^>>>meta.xml
echo   ^<add_on_unique_id23 type="hexBinary" length="4"^>00000000^</add_on_unique_id23^>>>meta.xml
echo   ^<add_on_unique_id24 type="hexBinary" length="4"^>00000000^</add_on_unique_id24^>>>meta.xml
echo   ^<add_on_unique_id25 type="hexBinary" length="4"^>00000000^</add_on_unique_id25^>>>meta.xml
echo   ^<add_on_unique_id26 type="hexBinary" length="4"^>00000000^</add_on_unique_id26^>>>meta.xml
echo   ^<add_on_unique_id27 type="hexBinary" length="4"^>00000000^</add_on_unique_id27^>>>meta.xml
echo   ^<add_on_unique_id28 type="hexBinary" length="4"^>00000000^</add_on_unique_id28^>>>meta.xml
echo   ^<add_on_unique_id29 type="hexBinary" length="4"^>00000000^</add_on_unique_id29^>>>meta.xml
echo   ^<add_on_unique_id30 type="hexBinary" length="4"^>00000000^</add_on_unique_id30^>>>meta.xml
echo   ^<add_on_unique_id31 type="hexBinary" length="4"^>00000000^</add_on_unique_id31^>>>meta.xml
echo ^</menu^>>>meta.xml
cls
goto movebackromfiledkc
:editmetaxmleb
cls
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): 
set /p Name=Enter the Game name:  
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>meta.xml
echo ^<menu type="complex" access="777"^>>>meta.xml
echo   ^<version type="unsignedInt" length="4"^>33^</version^>>>meta.xml
echo   ^<product_code type="string" length="32"^>WUP-N-%PDC%^</product_code^>>>meta.xml
echo   ^<content_platform type="string" length="32"^>WUP^</content_platform^>>>meta.xml
echo   ^<company_code type="string" length="8"^>0001^</company_code^>>>meta.xml
echo   ^<mastering_date type="string" length="32"^>^</mastering_date^>>>meta.xml
echo   ^<logo_type type="unsignedInt" length="4"^>0^</logo_type^>>>meta.xml
echo   ^<app_launch_type type="hexBinary" length="4"^>00000000^</app_launch_type^>>>meta.xml
echo   ^<invisible_flag type="hexBinary" length="4"^>00000000^</invisible_flag^>>>meta.xml
echo   ^<no_managed_flag type="hexBinary" length="4"^>00000000^</no_managed_flag^>>>meta.xml
echo   ^<no_event_log type="hexBinary" length="4"^>00000002^</no_event_log^>>>meta.xml
echo   ^<no_icon_database type="hexBinary" length="4"^>00000000^</no_icon_database^>>>meta.xml
echo   ^<launching_flag type="hexBinary" length="4"^>00000004^</launching_flag^>>>meta.xml
echo   ^<install_flag type="hexBinary" length="4"^>00000000^</install_flag^>>>meta.xml
echo   ^<closing_msg type="unsignedInt" length="4"^>0^</closing_msg^>>>meta.xml
echo   ^<title_version type="unsignedInt" length="4"^>0^</title_version^>>>meta.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>meta.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>meta.xml
echo   ^<boss_id type="hexBinary" length="8"^>0000000000000000^</boss_id^>>>meta.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>meta.xml
echo   ^<app_size type="hexBinary" length="8"^>0000000000000000^</app_size^>>>meta.xml
echo   ^<common_save_size type="hexBinary" length="8"^>0000000000000000^</common_save_size^>>>meta.xml
echo   ^<account_save_size type="hexBinary" length="8"^>0000000000000000^</account_save_size^>>>meta.xml
echo   ^<common_boss_size type="hexBinary" length="8"^>0000000000000000^</common_boss_size^>>>meta.xml
echo   ^<account_boss_size type="hexBinary" length="8"^>0000000000000000^</account_boss_size^>>>meta.xml
echo   ^<save_no_rollback type="unsignedInt" length="4"^>0^</save_no_rollback^>>>meta.xml
echo   ^<join_game_id type="hexBinary" length="4"^>00000000^</join_game_id^>>>meta.xml
echo   ^<join_game_mode_mask type="hexBinary" length="8"^>0000000000000000^</join_game_mode_mask^>>>meta.xml
echo   ^<bg_daemon_enable type="unsignedInt" length="4"^>0^</bg_daemon_enable^>>>meta.xml
echo   ^<olv_accesskey type="unsignedInt" length="4"^>3921400692^</olv_accesskey^>>>meta.xml
echo   ^<wood_tin type="unsignedInt" length="4"^>0^</wood_tin^>>>meta.xml
echo   ^<e_manual type="unsignedInt" length="4"^>0^</e_manual^>>>meta.xml
echo   ^<e_manual_version type="unsignedInt" length="4"^>0^</e_manual_version^>>>meta.xml
echo   ^<region type="hexBinary" length="4"^>00000002^</region^>>>meta.xml
echo   ^<pc_cero type="unsignedInt" length="4"^>128^</pc_cero^>>>meta.xml
echo   ^<pc_esrb type="unsignedInt" length="4"^>13^</pc_esrb^>>>meta.xml
echo   ^<pc_bbfc type="unsignedInt" length="4"^>192^</pc_bbfc^>>>meta.xml
echo   ^<pc_usk type="unsignedInt" length="4"^>128^</pc_usk^>>>meta.xml
echo   ^<pc_pegi_gen type="unsignedInt" length="4"^>128^</pc_pegi_gen^>>>meta.xml
echo   ^<pc_pegi_fin type="unsignedInt" length="4"^>192^</pc_pegi_fin^>>>meta.xml
echo   ^<pc_pegi_prt type="unsignedInt" length="4"^>128^</pc_pegi_prt^>>>meta.xml
echo   ^<pc_pegi_bbfc type="unsignedInt" length="4"^>128^</pc_pegi_bbfc^>>>meta.xml
echo   ^<pc_cob type="unsignedInt" length="4"^>128^</pc_cob^>>>meta.xml
echo   ^<pc_grb type="unsignedInt" length="4"^>128^</pc_grb^>>>meta.xml
echo   ^<pc_cgsrr type="unsignedInt" length="4"^>128^</pc_cgsrr^>>>meta.xml
echo   ^<pc_oflc type="unsignedInt" length="4"^>128^</pc_oflc^>>>meta.xml
echo   ^<pc_reserved0 type="unsignedInt" length="4"^>192^</pc_reserved0^>>>meta.xml
echo   ^<pc_reserved1 type="unsignedInt" length="4"^>192^</pc_reserved1^>>>meta.xml
echo   ^<pc_reserved2 type="unsignedInt" length="4"^>192^</pc_reserved2^>>>meta.xml
echo   ^<pc_reserved3 type="unsignedInt" length="4"^>192^</pc_reserved3^>>>meta.xml
echo   ^<ext_dev_nunchaku type="unsignedInt" length="4"^>0^</ext_dev_nunchaku^>>>meta.xml
echo   ^<ext_dev_classic type="unsignedInt" length="4"^>0^</ext_dev_classic^>>>meta.xml
echo   ^<ext_dev_urcc type="unsignedInt" length="4"^>0^</ext_dev_urcc^>>>meta.xml
echo   ^<ext_dev_board type="unsignedInt" length="4"^>0^</ext_dev_board^>>>meta.xml
echo   ^<ext_dev_usb_keyboard type="unsignedInt" length="4"^>0^</ext_dev_usb_keyboard^>>>meta.xml
echo   ^<ext_dev_etc type="unsignedInt" length="4"^>0^</ext_dev_etc^>>>meta.xml
echo   ^<ext_dev_etc_name type="string" length="512"^>^</ext_dev_etc_name^>>>meta.xml
echo   ^<eula_version type="unsignedInt" length="4"^>0^</eula_version^>>>meta.xml
echo   ^<drc_use type="unsignedInt" length="4"^>1^</drc_use^>>>meta.xml
echo   ^<network_use type="unsignedInt" length="4"^>0^</network_use^>>>meta.xml
echo   ^<online_account_use type="unsignedInt" length="4"^>0^</online_account_use^>>>meta.xml
echo   ^<direct_boot type="unsignedInt" length="4"^>0^</direct_boot^>>>meta.xml
echo   ^<reserved_flag0 type="hexBinary" length="4"^>00010001^</reserved_flag0^>>>meta.xml
echo   ^<reserved_flag1 type="hexBinary" length="4"^>00080023^</reserved_flag1^>>>meta.xml
echo   ^<reserved_flag2 type="hexBinary" length="4"^>53583445^</reserved_flag2^>>>meta.xml
echo   ^<reserved_flag3 type="hexBinary" length="4"^>00000000^</reserved_flag3^>>>meta.xml
echo   ^<reserved_flag4 type="hexBinary" length="4"^>00000000^</reserved_flag4^>>>meta.xml
echo   ^<reserved_flag5 type="hexBinary" length="4"^>00000000^</reserved_flag5^>>>meta.xml
echo   ^<reserved_flag6 type="hexBinary" length="4"^>00000003^</reserved_flag6^>>>meta.xml
echo   ^<reserved_flag7 type="hexBinary" length="4"^>00000005^</reserved_flag7^>>>meta.xml
echo   ^<longname_ja type="string" length="512"^>%Name%^</longname_ja^>>>meta.xml
echo   ^<longname_en type="string" length="512"^>%Name%^</longname_en^>>>meta.xml
echo   ^<longname_fr type="string" length="512"^>%Name%^</longname_fr^>>>meta.xml
echo   ^<longname_de type="string" length="512"^>%Name%^</longname_de^>>>meta.xml
echo   ^<longname_it type="string" length="512"^>%Name%^</longname_it^>>>meta.xml
echo   ^<longname_es type="string" length="512"^>%Name%^</longname_es^>>>meta.xml
echo   ^<longname_zhs type="string" length="512"^>%Name%^</longname_zhs^>>>meta.xml
echo   ^<longname_ko type="string" length="512"^>%Name%^</longname_ko^>>>meta.xml
echo   ^<longname_nl type="string" length="512"^>%Name%^</longname_nl^>>>meta.xml
echo   ^<longname_pt type="string" length="512"^>%Name%^</longname_pt^>>>meta.xml
echo   ^<longname_ru type="string" length="512"^>%Name%^</longname_ru^>>>meta.xml
echo   ^<longname_zht type="string" length="512"^>%Name%^</longname_zht^>>>meta.xml
echo   ^<shortname_ja type="string" length="256"^>%Name%^</shortname_ja^>>>meta.xml
echo   ^<shortname_en type="string" length="256"^>%Name%^</shortname_en^>>>meta.xml
echo   ^<shortname_fr type="string" length="256"^>%Name%^</shortname_fr^>>>meta.xml
echo   ^<shortname_de type="string" length="256"^>%Name%^</shortname_de^>>>meta.xml
echo   ^<shortname_it type="string" length="256"^>%Name%^</shortname_it^>>>meta.xml
echo   ^<shortname_es type="string" length="256"^>%Name%^</shortname_es^>>>meta.xml
echo   ^<shortname_zhs type="string" length="256"^>%Name%^</shortname_zhs^>>>meta.xml
echo   ^<shortname_ko type="string" length="256"^>%Name%^</shortname_ko^>>>meta.xml
echo   ^<shortname_nl type="string" length="256"^>%Name%^</shortname_nl^>>>meta.xml
echo   ^<shortname_pt type="string" length="256"^>%Name%^</shortname_pt^>>>meta.xml
echo   ^<shortname_ru type="string" length="256"^>%Name%^</shortname_ru^>>>meta.xml
echo   ^<shortname_zht type="string" length="256"^>%Name%^</shortname_zht^>>>meta.xml
echo   ^<publisher_ja type="string" length="256"^>NINTENDO^</publisher_ja^>>>meta.xml
echo   ^<publisher_en type="string" length="256"^>NINTENDO^</publisher_en^>>>meta.xml
echo   ^<publisher_fr type="string" length="256"^>NINTENDO^</publisher_fr^>>>meta.xml
echo   ^<publisher_de type="string" length="256"^>NINTENDO^</publisher_de^>>>meta.xml
echo   ^<publisher_it type="string" length="256"^>NINTENDO^</publisher_it^>>>meta.xml
echo   ^<publisher_es type="string" length="256"^>NINTENDO^</publisher_es^>>>meta.xml
echo   ^<publisher_zhs type="string" length="256"^>NINTENDO^</publisher_zhs^>>>meta.xml
echo   ^<publisher_ko type="string" length="256"^>NINTENDO^</publisher_ko^>>>meta.xml
echo   ^<publisher_nl type="string" length="256"^>NINTENDO^</publisher_nl^>>>meta.xml
echo   ^<publisher_pt type="string" length="256"^>NINTENDO^</publisher_pt^>>>meta.xml
echo   ^<publisher_ru type="string" length="256"^>NINTENDO^</publisher_ru^>>>meta.xml
echo   ^<publisher_zht type="string" length="256"^>NINTENDO^</publisher_zht^>>>meta.xml
echo   ^<add_on_unique_id0 type="hexBinary" length="4"^>00000000^</add_on_unique_id0^>>>meta.xml
echo   ^<add_on_unique_id1 type="hexBinary" length="4"^>00000000^</add_on_unique_id1^>>>meta.xml
echo   ^<add_on_unique_id2 type="hexBinary" length="4"^>00000000^</add_on_unique_id2^>>>meta.xml
echo   ^<add_on_unique_id3 type="hexBinary" length="4"^>00000000^</add_on_unique_id3^>>>meta.xml
echo   ^<add_on_unique_id4 type="hexBinary" length="4"^>00000000^</add_on_unique_id4^>>>meta.xml
echo   ^<add_on_unique_id5 type="hexBinary" length="4"^>00000000^</add_on_unique_id5^>>>meta.xml
echo   ^<add_on_unique_id6 type="hexBinary" length="4"^>00000000^</add_on_unique_id6^>>>meta.xml
echo   ^<add_on_unique_id7 type="hexBinary" length="4"^>00000000^</add_on_unique_id7^>>>meta.xml
echo   ^<add_on_unique_id8 type="hexBinary" length="4"^>00000000^</add_on_unique_id8^>>>meta.xml
echo   ^<add_on_unique_id9 type="hexBinary" length="4"^>00000000^</add_on_unique_id9^>>>meta.xml
echo   ^<add_on_unique_id10 type="hexBinary" length="4"^>00000000^</add_on_unique_id10^>>>meta.xml
echo   ^<add_on_unique_id11 type="hexBinary" length="4"^>00000000^</add_on_unique_id11^>>>meta.xml
echo   ^<add_on_unique_id12 type="hexBinary" length="4"^>00000000^</add_on_unique_id12^>>>meta.xml
echo   ^<add_on_unique_id13 type="hexBinary" length="4"^>00000000^</add_on_unique_id13^>>>meta.xml
echo   ^<add_on_unique_id14 type="hexBinary" length="4"^>00000000^</add_on_unique_id14^>>>meta.xml
echo   ^<add_on_unique_id15 type="hexBinary" length="4"^>00000000^</add_on_unique_id15^>>>meta.xml
echo   ^<add_on_unique_id16 type="hexBinary" length="4"^>00000000^</add_on_unique_id16^>>>meta.xml
echo   ^<add_on_unique_id17 type="hexBinary" length="4"^>00000000^</add_on_unique_id17^>>>meta.xml
echo   ^<add_on_unique_id18 type="hexBinary" length="4"^>00000000^</add_on_unique_id18^>>>meta.xml
echo   ^<add_on_unique_id19 type="hexBinary" length="4"^>00000000^</add_on_unique_id19^>>>meta.xml
echo   ^<add_on_unique_id20 type="hexBinary" length="4"^>00000000^</add_on_unique_id20^>>>meta.xml
echo   ^<add_on_unique_id21 type="hexBinary" length="4"^>00000000^</add_on_unique_id21^>>>meta.xml
echo   ^<add_on_unique_id22 type="hexBinary" length="4"^>00000000^</add_on_unique_id22^>>>meta.xml
echo   ^<add_on_unique_id23 type="hexBinary" length="4"^>00000000^</add_on_unique_id23^>>>meta.xml
echo   ^<add_on_unique_id24 type="hexBinary" length="4"^>00000000^</add_on_unique_id24^>>>meta.xml
echo   ^<add_on_unique_id25 type="hexBinary" length="4"^>00000000^</add_on_unique_id25^>>>meta.xml
echo   ^<add_on_unique_id26 type="hexBinary" length="4"^>00000000^</add_on_unique_id26^>>>meta.xml
echo   ^<add_on_unique_id27 type="hexBinary" length="4"^>00000000^</add_on_unique_id27^>>>meta.xml
echo   ^<add_on_unique_id28 type="hexBinary" length="4"^>00000000^</add_on_unique_id28^>>>meta.xml
echo   ^<add_on_unique_id29 type="hexBinary" length="4"^>00000000^</add_on_unique_id29^>>>meta.xml
echo   ^<add_on_unique_id30 type="hexBinary" length="4"^>00000000^</add_on_unique_id30^>>>meta.xml
echo   ^<add_on_unique_id31 type="hexBinary" length="4"^>00000000^</add_on_unique_id31^>>>meta.xml
echo ^</menu^>>>meta.xml
cls
goto movebackromfileeb
:editmetaxmlkb
cls
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): 
set /p Name=Enter the Game name:  
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>meta.xml
echo ^<menu type="complex" access="777"^>>>meta.xml
echo   ^<version type="unsignedInt" length="4"^>33^</version^>>>meta.xml
echo   ^<product_code type="string" length="32"^>WUP-N-%PDC%^</product_code^>>>meta.xml
echo   ^<content_platform type="string" length="32"^>WUP^</content_platform^>>>meta.xml
echo   ^<company_code type="string" length="8"^>0001^</company_code^>>>meta.xml
echo   ^<mastering_date type="string" length="32"^>^</mastering_date^>>>meta.xml
echo   ^<logo_type type="unsignedInt" length="4"^>0^</logo_type^>>>meta.xml
echo   ^<app_launch_type type="hexBinary" length="4"^>00000000^</app_launch_type^>>>meta.xml
echo   ^<invisible_flag type="hexBinary" length="4"^>00000000^</invisible_flag^>>>meta.xml
echo   ^<no_managed_flag type="hexBinary" length="4"^>00000000^</no_managed_flag^>>>meta.xml
echo   ^<no_event_log type="hexBinary" length="4"^>00000002^</no_event_log^>>>meta.xml
echo   ^<no_icon_database type="hexBinary" length="4"^>00000000^</no_icon_database^>>>meta.xml
echo   ^<launching_flag type="hexBinary" length="4"^>00000004^</launching_flag^>>>meta.xml
echo   ^<install_flag type="hexBinary" length="4"^>00000000^</install_flag^>>>meta.xml
echo   ^<closing_msg type="unsignedInt" length="4"^>0^</closing_msg^>>>meta.xml
echo   ^<title_version type="unsignedInt" length="4"^>0^</title_version^>>>meta.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>meta.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>meta.xml
echo   ^<boss_id type="hexBinary" length="8"^>0000000000000000^</boss_id^>>>meta.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>meta.xml
echo   ^<app_size type="hexBinary" length="8"^>0000000000000000^</app_size^>>>meta.xml
echo   ^<common_save_size type="hexBinary" length="8"^>0000000000000000^</common_save_size^>>>meta.xml
echo   ^<account_save_size type="hexBinary" length="8"^>0000000000000000^</account_save_size^>>>meta.xml
echo   ^<common_boss_size type="hexBinary" length="8"^>0000000000000000^</common_boss_size^>>>meta.xml
echo   ^<account_boss_size type="hexBinary" length="8"^>0000000000000000^</account_boss_size^>>>meta.xml
echo   ^<save_no_rollback type="unsignedInt" length="4"^>0^</save_no_rollback^>>>meta.xml
echo   ^<join_game_id type="hexBinary" length="4"^>00000000^</join_game_id^>>>meta.xml
echo   ^<join_game_mode_mask type="hexBinary" length="8"^>0000000000000000^</join_game_mode_mask^>>>meta.xml
echo   ^<bg_daemon_enable type="unsignedInt" length="4"^>0^</bg_daemon_enable^>>>meta.xml
echo   ^<olv_accesskey type="unsignedInt" length="4"^>3921400692^</olv_accesskey^>>>meta.xml
echo   ^<wood_tin type="unsignedInt" length="4"^>0^</wood_tin^>>>meta.xml
echo   ^<e_manual type="unsignedInt" length="4"^>0^</e_manual^>>>meta.xml
echo   ^<e_manual_version type="unsignedInt" length="4"^>0^</e_manual_version^>>>meta.xml
echo   ^<region type="hexBinary" length="4"^>00000002^</region^>>>meta.xml
echo   ^<pc_cero type="unsignedInt" length="4"^>128^</pc_cero^>>>meta.xml
echo   ^<pc_esrb type="unsignedInt" length="4"^>13^</pc_esrb^>>>meta.xml
echo   ^<pc_bbfc type="unsignedInt" length="4"^>192^</pc_bbfc^>>>meta.xml
echo   ^<pc_usk type="unsignedInt" length="4"^>128^</pc_usk^>>>meta.xml
echo   ^<pc_pegi_gen type="unsignedInt" length="4"^>128^</pc_pegi_gen^>>>meta.xml
echo   ^<pc_pegi_fin type="unsignedInt" length="4"^>192^</pc_pegi_fin^>>>meta.xml
echo   ^<pc_pegi_prt type="unsignedInt" length="4"^>128^</pc_pegi_prt^>>>meta.xml
echo   ^<pc_pegi_bbfc type="unsignedInt" length="4"^>128^</pc_pegi_bbfc^>>>meta.xml
echo   ^<pc_cob type="unsignedInt" length="4"^>128^</pc_cob^>>>meta.xml
echo   ^<pc_grb type="unsignedInt" length="4"^>128^</pc_grb^>>>meta.xml
echo   ^<pc_cgsrr type="unsignedInt" length="4"^>128^</pc_cgsrr^>>>meta.xml
echo   ^<pc_oflc type="unsignedInt" length="4"^>128^</pc_oflc^>>>meta.xml
echo   ^<pc_reserved0 type="unsignedInt" length="4"^>192^</pc_reserved0^>>>meta.xml
echo   ^<pc_reserved1 type="unsignedInt" length="4"^>192^</pc_reserved1^>>>meta.xml
echo   ^<pc_reserved2 type="unsignedInt" length="4"^>192^</pc_reserved2^>>>meta.xml
echo   ^<pc_reserved3 type="unsignedInt" length="4"^>192^</pc_reserved3^>>>meta.xml
echo   ^<ext_dev_nunchaku type="unsignedInt" length="4"^>0^</ext_dev_nunchaku^>>>meta.xml
echo   ^<ext_dev_classic type="unsignedInt" length="4"^>0^</ext_dev_classic^>>>meta.xml
echo   ^<ext_dev_urcc type="unsignedInt" length="4"^>0^</ext_dev_urcc^>>>meta.xml
echo   ^<ext_dev_board type="unsignedInt" length="4"^>0^</ext_dev_board^>>>meta.xml
echo   ^<ext_dev_usb_keyboard type="unsignedInt" length="4"^>0^</ext_dev_usb_keyboard^>>>meta.xml
echo   ^<ext_dev_etc type="unsignedInt" length="4"^>0^</ext_dev_etc^>>>meta.xml
echo   ^<ext_dev_etc_name type="string" length="512"^>^</ext_dev_etc_name^>>>meta.xml
echo   ^<eula_version type="unsignedInt" length="4"^>0^</eula_version^>>>meta.xml
echo   ^<drc_use type="unsignedInt" length="4"^>1^</drc_use^>>>meta.xml
echo   ^<network_use type="unsignedInt" length="4"^>0^</network_use^>>>meta.xml
echo   ^<online_account_use type="unsignedInt" length="4"^>0^</online_account_use^>>>meta.xml
echo   ^<direct_boot type="unsignedInt" length="4"^>0^</direct_boot^>>>meta.xml
echo   ^<reserved_flag0 type="hexBinary" length="4"^>00010001^</reserved_flag0^>>>meta.xml
echo   ^<reserved_flag1 type="hexBinary" length="4"^>00080023^</reserved_flag1^>>>meta.xml
echo   ^<reserved_flag2 type="hexBinary" length="4"^>53583445^</reserved_flag2^>>>meta.xml
echo   ^<reserved_flag3 type="hexBinary" length="4"^>00000000^</reserved_flag3^>>>meta.xml
echo   ^<reserved_flag4 type="hexBinary" length="4"^>00000000^</reserved_flag4^>>>meta.xml
echo   ^<reserved_flag5 type="hexBinary" length="4"^>00000000^</reserved_flag5^>>>meta.xml
echo   ^<reserved_flag6 type="hexBinary" length="4"^>00000003^</reserved_flag6^>>>meta.xml
echo   ^<reserved_flag7 type="hexBinary" length="4"^>00000005^</reserved_flag7^>>>meta.xml
echo   ^<longname_ja type="string" length="512"^>%Name%^</longname_ja^>>>meta.xml
echo   ^<longname_en type="string" length="512"^>%Name%^</longname_en^>>>meta.xml
echo   ^<longname_fr type="string" length="512"^>%Name%^</longname_fr^>>>meta.xml
echo   ^<longname_de type="string" length="512"^>%Name%^</longname_de^>>>meta.xml
echo   ^<longname_it type="string" length="512"^>%Name%^</longname_it^>>>meta.xml
echo   ^<longname_es type="string" length="512"^>%Name%^</longname_es^>>>meta.xml
echo   ^<longname_zhs type="string" length="512"^>%Name%^</longname_zhs^>>>meta.xml
echo   ^<longname_ko type="string" length="512"^>%Name%^</longname_ko^>>>meta.xml
echo   ^<longname_nl type="string" length="512"^>%Name%^</longname_nl^>>>meta.xml
echo   ^<longname_pt type="string" length="512"^>%Name%^</longname_pt^>>>meta.xml
echo   ^<longname_ru type="string" length="512"^>%Name%^</longname_ru^>>>meta.xml
echo   ^<longname_zht type="string" length="512"^>%Name%^</longname_zht^>>>meta.xml
echo   ^<shortname_ja type="string" length="256"^>%Name%^</shortname_ja^>>>meta.xml
echo   ^<shortname_en type="string" length="256"^>%Name%^</shortname_en^>>>meta.xml
echo   ^<shortname_fr type="string" length="256"^>%Name%^</shortname_fr^>>>meta.xml
echo   ^<shortname_de type="string" length="256"^>%Name%^</shortname_de^>>>meta.xml
echo   ^<shortname_it type="string" length="256"^>%Name%^</shortname_it^>>>meta.xml
echo   ^<shortname_es type="string" length="256"^>%Name%^</shortname_es^>>>meta.xml
echo   ^<shortname_zhs type="string" length="256"^>%Name%^</shortname_zhs^>>>meta.xml
echo   ^<shortname_ko type="string" length="256"^>%Name%^</shortname_ko^>>>meta.xml
echo   ^<shortname_nl type="string" length="256"^>%Name%^</shortname_nl^>>>meta.xml
echo   ^<shortname_pt type="string" length="256"^>%Name%^</shortname_pt^>>>meta.xml
echo   ^<shortname_ru type="string" length="256"^>%Name%^</shortname_ru^>>>meta.xml
echo   ^<shortname_zht type="string" length="256"^>%Name%^</shortname_zht^>>>meta.xml
echo   ^<publisher_ja type="string" length="256"^>NINTENDO^</publisher_ja^>>>meta.xml
echo   ^<publisher_en type="string" length="256"^>NINTENDO^</publisher_en^>>>meta.xml
echo   ^<publisher_fr type="string" length="256"^>NINTENDO^</publisher_fr^>>>meta.xml
echo   ^<publisher_de type="string" length="256"^>NINTENDO^</publisher_de^>>>meta.xml
echo   ^<publisher_it type="string" length="256"^>NINTENDO^</publisher_it^>>>meta.xml
echo   ^<publisher_es type="string" length="256"^>NINTENDO^</publisher_es^>>>meta.xml
echo   ^<publisher_zhs type="string" length="256"^>NINTENDO^</publisher_zhs^>>>meta.xml
echo   ^<publisher_ko type="string" length="256"^>NINTENDO^</publisher_ko^>>>meta.xml
echo   ^<publisher_nl type="string" length="256"^>NINTENDO^</publisher_nl^>>>meta.xml
echo   ^<publisher_pt type="string" length="256"^>NINTENDO^</publisher_pt^>>>meta.xml
echo   ^<publisher_ru type="string" length="256"^>NINTENDO^</publisher_ru^>>>meta.xml
echo   ^<publisher_zht type="string" length="256"^>NINTENDO^</publisher_zht^>>>meta.xml
echo   ^<add_on_unique_id0 type="hexBinary" length="4"^>00000000^</add_on_unique_id0^>>>meta.xml
echo   ^<add_on_unique_id1 type="hexBinary" length="4"^>00000000^</add_on_unique_id1^>>>meta.xml
echo   ^<add_on_unique_id2 type="hexBinary" length="4"^>00000000^</add_on_unique_id2^>>>meta.xml
echo   ^<add_on_unique_id3 type="hexBinary" length="4"^>00000000^</add_on_unique_id3^>>>meta.xml
echo   ^<add_on_unique_id4 type="hexBinary" length="4"^>00000000^</add_on_unique_id4^>>>meta.xml
echo   ^<add_on_unique_id5 type="hexBinary" length="4"^>00000000^</add_on_unique_id5^>>>meta.xml
echo   ^<add_on_unique_id6 type="hexBinary" length="4"^>00000000^</add_on_unique_id6^>>>meta.xml
echo   ^<add_on_unique_id7 type="hexBinary" length="4"^>00000000^</add_on_unique_id7^>>>meta.xml
echo   ^<add_on_unique_id8 type="hexBinary" length="4"^>00000000^</add_on_unique_id8^>>>meta.xml
echo   ^<add_on_unique_id9 type="hexBinary" length="4"^>00000000^</add_on_unique_id9^>>>meta.xml
echo   ^<add_on_unique_id10 type="hexBinary" length="4"^>00000000^</add_on_unique_id10^>>>meta.xml
echo   ^<add_on_unique_id11 type="hexBinary" length="4"^>00000000^</add_on_unique_id11^>>>meta.xml
echo   ^<add_on_unique_id12 type="hexBinary" length="4"^>00000000^</add_on_unique_id12^>>>meta.xml
echo   ^<add_on_unique_id13 type="hexBinary" length="4"^>00000000^</add_on_unique_id13^>>>meta.xml
echo   ^<add_on_unique_id14 type="hexBinary" length="4"^>00000000^</add_on_unique_id14^>>>meta.xml
echo   ^<add_on_unique_id15 type="hexBinary" length="4"^>00000000^</add_on_unique_id15^>>>meta.xml
echo   ^<add_on_unique_id16 type="hexBinary" length="4"^>00000000^</add_on_unique_id16^>>>meta.xml
echo   ^<add_on_unique_id17 type="hexBinary" length="4"^>00000000^</add_on_unique_id17^>>>meta.xml
echo   ^<add_on_unique_id18 type="hexBinary" length="4"^>00000000^</add_on_unique_id18^>>>meta.xml
echo   ^<add_on_unique_id19 type="hexBinary" length="4"^>00000000^</add_on_unique_id19^>>>meta.xml
echo   ^<add_on_unique_id20 type="hexBinary" length="4"^>00000000^</add_on_unique_id20^>>>meta.xml
echo   ^<add_on_unique_id21 type="hexBinary" length="4"^>00000000^</add_on_unique_id21^>>>meta.xml
echo   ^<add_on_unique_id22 type="hexBinary" length="4"^>00000000^</add_on_unique_id22^>>>meta.xml
echo   ^<add_on_unique_id23 type="hexBinary" length="4"^>00000000^</add_on_unique_id23^>>>meta.xml
echo   ^<add_on_unique_id24 type="hexBinary" length="4"^>00000000^</add_on_unique_id24^>>>meta.xml
echo   ^<add_on_unique_id25 type="hexBinary" length="4"^>00000000^</add_on_unique_id25^>>>meta.xml
echo   ^<add_on_unique_id26 type="hexBinary" length="4"^>00000000^</add_on_unique_id26^>>>meta.xml
echo   ^<add_on_unique_id27 type="hexBinary" length="4"^>00000000^</add_on_unique_id27^>>>meta.xml
echo   ^<add_on_unique_id28 type="hexBinary" length="4"^>00000000^</add_on_unique_id28^>>>meta.xml
echo   ^<add_on_unique_id29 type="hexBinary" length="4"^>00000000^</add_on_unique_id29^>>>meta.xml
echo   ^<add_on_unique_id30 type="hexBinary" length="4"^>00000000^</add_on_unique_id30^>>>meta.xml
echo   ^<add_on_unique_id31 type="hexBinary" length="4"^>00000000^</add_on_unique_id31^>>>meta.xml
echo ^</menu^>>>meta.xml
cls
goto movebackromfilekb
:editmetaxmlmk
cls
set /p PDC=Enter a 4-digit Product code (A-Z; 0-9): 
set /p Name=Enter the Game name:  
cls
echo ^<?xml version="1.0" encoding="utf-8"?^>>meta.xml
echo ^<menu type="complex" access="777"^>>>meta.xml
echo   ^<version type="unsignedInt" length="4"^>33^</version^>>>meta.xml
echo   ^<product_code type="string" length="32"^>WUP-N-%PDC%^</product_code^>>>meta.xml
echo   ^<content_platform type="string" length="32"^>WUP^</content_platform^>>>meta.xml
echo   ^<company_code type="string" length="8"^>0001^</company_code^>>>meta.xml
echo   ^<mastering_date type="string" length="32"^>^</mastering_date^>>>meta.xml
echo   ^<logo_type type="unsignedInt" length="4"^>0^</logo_type^>>>meta.xml
echo   ^<app_launch_type type="hexBinary" length="4"^>00000000^</app_launch_type^>>>meta.xml
echo   ^<invisible_flag type="hexBinary" length="4"^>00000000^</invisible_flag^>>>meta.xml
echo   ^<no_managed_flag type="hexBinary" length="4"^>00000000^</no_managed_flag^>>>meta.xml
echo   ^<no_event_log type="hexBinary" length="4"^>00000002^</no_event_log^>>>meta.xml
echo   ^<no_icon_database type="hexBinary" length="4"^>00000000^</no_icon_database^>>>meta.xml
echo   ^<launching_flag type="hexBinary" length="4"^>00000004^</launching_flag^>>>meta.xml
echo   ^<install_flag type="hexBinary" length="4"^>00000000^</install_flag^>>>meta.xml
echo   ^<closing_msg type="unsignedInt" length="4"^>0^</closing_msg^>>>meta.xml
echo   ^<title_version type="unsignedInt" length="4"^>0^</title_version^>>>meta.xml
echo   ^<title_id type="hexBinary" length="8"^>0005000010%ID%00^</title_id^>>>meta.xml
echo   ^<group_id type="hexBinary" length="4"^>00001532^</group_id^>>>meta.xml
echo   ^<boss_id type="hexBinary" length="8"^>0000000000000000^</boss_id^>>>meta.xml
echo   ^<os_version type="hexBinary" length="8"^>000500101000400A^</os_version^>>>meta.xml
echo   ^<app_size type="hexBinary" length="8"^>0000000000000000^</app_size^>>>meta.xml
echo   ^<common_save_size type="hexBinary" length="8"^>0000000000000000^</common_save_size^>>>meta.xml
echo   ^<account_save_size type="hexBinary" length="8"^>0000000000000000^</account_save_size^>>>meta.xml
echo   ^<common_boss_size type="hexBinary" length="8"^>0000000000000000^</common_boss_size^>>>meta.xml
echo   ^<account_boss_size type="hexBinary" length="8"^>0000000000000000^</account_boss_size^>>>meta.xml
echo   ^<save_no_rollback type="unsignedInt" length="4"^>0^</save_no_rollback^>>>meta.xml
echo   ^<join_game_id type="hexBinary" length="4"^>00000000^</join_game_id^>>>meta.xml
echo   ^<join_game_mode_mask type="hexBinary" length="8"^>0000000000000000^</join_game_mode_mask^>>>meta.xml
echo   ^<bg_daemon_enable type="unsignedInt" length="4"^>0^</bg_daemon_enable^>>>meta.xml
echo   ^<olv_accesskey type="unsignedInt" length="4"^>3921400692^</olv_accesskey^>>>meta.xml
echo   ^<wood_tin type="unsignedInt" length="4"^>0^</wood_tin^>>>meta.xml
echo   ^<e_manual type="unsignedInt" length="4"^>0^</e_manual^>>>meta.xml
echo   ^<e_manual_version type="unsignedInt" length="4"^>0^</e_manual_version^>>>meta.xml
echo   ^<region type="hexBinary" length="4"^>00000002^</region^>>>meta.xml
echo   ^<pc_cero type="unsignedInt" length="4"^>128^</pc_cero^>>>meta.xml
echo   ^<pc_esrb type="unsignedInt" length="4"^>13^</pc_esrb^>>>meta.xml
echo   ^<pc_bbfc type="unsignedInt" length="4"^>192^</pc_bbfc^>>>meta.xml
echo   ^<pc_usk type="unsignedInt" length="4"^>128^</pc_usk^>>>meta.xml
echo   ^<pc_pegi_gen type="unsignedInt" length="4"^>128^</pc_pegi_gen^>>>meta.xml
echo   ^<pc_pegi_fin type="unsignedInt" length="4"^>192^</pc_pegi_fin^>>>meta.xml
echo   ^<pc_pegi_prt type="unsignedInt" length="4"^>128^</pc_pegi_prt^>>>meta.xml
echo   ^<pc_pegi_bbfc type="unsignedInt" length="4"^>128^</pc_pegi_bbfc^>>>meta.xml
echo   ^<pc_cob type="unsignedInt" length="4"^>128^</pc_cob^>>>meta.xml
echo   ^<pc_grb type="unsignedInt" length="4"^>128^</pc_grb^>>>meta.xml
echo   ^<pc_cgsrr type="unsignedInt" length="4"^>128^</pc_cgsrr^>>>meta.xml
echo   ^<pc_oflc type="unsignedInt" length="4"^>128^</pc_oflc^>>>meta.xml
echo   ^<pc_reserved0 type="unsignedInt" length="4"^>192^</pc_reserved0^>>>meta.xml
echo   ^<pc_reserved1 type="unsignedInt" length="4"^>192^</pc_reserved1^>>>meta.xml
echo   ^<pc_reserved2 type="unsignedInt" length="4"^>192^</pc_reserved2^>>>meta.xml
echo   ^<pc_reserved3 type="unsignedInt" length="4"^>192^</pc_reserved3^>>>meta.xml
echo   ^<ext_dev_nunchaku type="unsignedInt" length="4"^>0^</ext_dev_nunchaku^>>>meta.xml
echo   ^<ext_dev_classic type="unsignedInt" length="4"^>0^</ext_dev_classic^>>>meta.xml
echo   ^<ext_dev_urcc type="unsignedInt" length="4"^>0^</ext_dev_urcc^>>>meta.xml
echo   ^<ext_dev_board type="unsignedInt" length="4"^>0^</ext_dev_board^>>>meta.xml
echo   ^<ext_dev_usb_keyboard type="unsignedInt" length="4"^>0^</ext_dev_usb_keyboard^>>>meta.xml
echo   ^<ext_dev_etc type="unsignedInt" length="4"^>0^</ext_dev_etc^>>>meta.xml
echo   ^<ext_dev_etc_name type="string" length="512"^>^</ext_dev_etc_name^>>>meta.xml
echo   ^<eula_version type="unsignedInt" length="4"^>0^</eula_version^>>>meta.xml
echo   ^<drc_use type="unsignedInt" length="4"^>1^</drc_use^>>>meta.xml
echo   ^<network_use type="unsignedInt" length="4"^>0^</network_use^>>>meta.xml
echo   ^<online_account_use type="unsignedInt" length="4"^>0^</online_account_use^>>>meta.xml
echo   ^<direct_boot type="unsignedInt" length="4"^>0^</direct_boot^>>>meta.xml
echo   ^<reserved_flag0 type="hexBinary" length="4"^>00010001^</reserved_flag0^>>>meta.xml
echo   ^<reserved_flag1 type="hexBinary" length="4"^>00080023^</reserved_flag1^>>>meta.xml
echo   ^<reserved_flag2 type="hexBinary" length="4"^>53583445^</reserved_flag2^>>>meta.xml
echo   ^<reserved_flag3 type="hexBinary" length="4"^>00000000^</reserved_flag3^>>>meta.xml
echo   ^<reserved_flag4 type="hexBinary" length="4"^>00000000^</reserved_flag4^>>>meta.xml
echo   ^<reserved_flag5 type="hexBinary" length="4"^>00000000^</reserved_flag5^>>>meta.xml
echo   ^<reserved_flag6 type="hexBinary" length="4"^>00000003^</reserved_flag6^>>>meta.xml
echo   ^<reserved_flag7 type="hexBinary" length="4"^>00000005^</reserved_flag7^>>>meta.xml
echo   ^<longname_ja type="string" length="512"^>%Name%^</longname_ja^>>>meta.xml
echo   ^<longname_en type="string" length="512"^>%Name%^</longname_en^>>>meta.xml
echo   ^<longname_fr type="string" length="512"^>%Name%^</longname_fr^>>>meta.xml
echo   ^<longname_de type="string" length="512"^>%Name%^</longname_de^>>>meta.xml
echo   ^<longname_it type="string" length="512"^>%Name%^</longname_it^>>>meta.xml
echo   ^<longname_es type="string" length="512"^>%Name%^</longname_es^>>>meta.xml
echo   ^<longname_zhs type="string" length="512"^>%Name%^</longname_zhs^>>>meta.xml
echo   ^<longname_ko type="string" length="512"^>%Name%^</longname_ko^>>>meta.xml
echo   ^<longname_nl type="string" length="512"^>%Name%^</longname_nl^>>>meta.xml
echo   ^<longname_pt type="string" length="512"^>%Name%^</longname_pt^>>>meta.xml
echo   ^<longname_ru type="string" length="512"^>%Name%^</longname_ru^>>>meta.xml
echo   ^<longname_zht type="string" length="512"^>%Name%^</longname_zht^>>>meta.xml
echo   ^<shortname_ja type="string" length="256"^>%Name%^</shortname_ja^>>>meta.xml
echo   ^<shortname_en type="string" length="256"^>%Name%^</shortname_en^>>>meta.xml
echo   ^<shortname_fr type="string" length="256"^>%Name%^</shortname_fr^>>>meta.xml
echo   ^<shortname_de type="string" length="256"^>%Name%^</shortname_de^>>>meta.xml
echo   ^<shortname_it type="string" length="256"^>%Name%^</shortname_it^>>>meta.xml
echo   ^<shortname_es type="string" length="256"^>%Name%^</shortname_es^>>>meta.xml
echo   ^<shortname_zhs type="string" length="256"^>%Name%^</shortname_zhs^>>>meta.xml
echo   ^<shortname_ko type="string" length="256"^>%Name%^</shortname_ko^>>>meta.xml
echo   ^<shortname_nl type="string" length="256"^>%Name%^</shortname_nl^>>>meta.xml
echo   ^<shortname_pt type="string" length="256"^>%Name%^</shortname_pt^>>>meta.xml
echo   ^<shortname_ru type="string" length="256"^>%Name%^</shortname_ru^>>>meta.xml
echo   ^<shortname_zht type="string" length="256"^>%Name%^</shortname_zht^>>>meta.xml
echo   ^<publisher_ja type="string" length="256"^>NINTENDO^</publisher_ja^>>>meta.xml
echo   ^<publisher_en type="string" length="256"^>NINTENDO^</publisher_en^>>>meta.xml
echo   ^<publisher_fr type="string" length="256"^>NINTENDO^</publisher_fr^>>>meta.xml
echo   ^<publisher_de type="string" length="256"^>NINTENDO^</publisher_de^>>>meta.xml
echo   ^<publisher_it type="string" length="256"^>NINTENDO^</publisher_it^>>>meta.xml
echo   ^<publisher_es type="string" length="256"^>NINTENDO^</publisher_es^>>>meta.xml
echo   ^<publisher_zhs type="string" length="256"^>NINTENDO^</publisher_zhs^>>>meta.xml
echo   ^<publisher_ko type="string" length="256"^>NINTENDO^</publisher_ko^>>>meta.xml
echo   ^<publisher_nl type="string" length="256"^>NINTENDO^</publisher_nl^>>>meta.xml
echo   ^<publisher_pt type="string" length="256"^>NINTENDO^</publisher_pt^>>>meta.xml
echo   ^<publisher_ru type="string" length="256"^>NINTENDO^</publisher_ru^>>>meta.xml
echo   ^<publisher_zht type="string" length="256"^>NINTENDO^</publisher_zht^>>>meta.xml
echo   ^<add_on_unique_id0 type="hexBinary" length="4"^>00000000^</add_on_unique_id0^>>>meta.xml
echo   ^<add_on_unique_id1 type="hexBinary" length="4"^>00000000^</add_on_unique_id1^>>>meta.xml
echo   ^<add_on_unique_id2 type="hexBinary" length="4"^>00000000^</add_on_unique_id2^>>>meta.xml
echo   ^<add_on_unique_id3 type="hexBinary" length="4"^>00000000^</add_on_unique_id3^>>>meta.xml
echo   ^<add_on_unique_id4 type="hexBinary" length="4"^>00000000^</add_on_unique_id4^>>>meta.xml
echo   ^<add_on_unique_id5 type="hexBinary" length="4"^>00000000^</add_on_unique_id5^>>>meta.xml
echo   ^<add_on_unique_id6 type="hexBinary" length="4"^>00000000^</add_on_unique_id6^>>>meta.xml
echo   ^<add_on_unique_id7 type="hexBinary" length="4"^>00000000^</add_on_unique_id7^>>>meta.xml
echo   ^<add_on_unique_id8 type="hexBinary" length="4"^>00000000^</add_on_unique_id8^>>>meta.xml
echo   ^<add_on_unique_id9 type="hexBinary" length="4"^>00000000^</add_on_unique_id9^>>>meta.xml
echo   ^<add_on_unique_id10 type="hexBinary" length="4"^>00000000^</add_on_unique_id10^>>>meta.xml
echo   ^<add_on_unique_id11 type="hexBinary" length="4"^>00000000^</add_on_unique_id11^>>>meta.xml
echo   ^<add_on_unique_id12 type="hexBinary" length="4"^>00000000^</add_on_unique_id12^>>>meta.xml
echo   ^<add_on_unique_id13 type="hexBinary" length="4"^>00000000^</add_on_unique_id13^>>>meta.xml
echo   ^<add_on_unique_id14 type="hexBinary" length="4"^>00000000^</add_on_unique_id14^>>>meta.xml
echo   ^<add_on_unique_id15 type="hexBinary" length="4"^>00000000^</add_on_unique_id15^>>>meta.xml
echo   ^<add_on_unique_id16 type="hexBinary" length="4"^>00000000^</add_on_unique_id16^>>>meta.xml
echo   ^<add_on_unique_id17 type="hexBinary" length="4"^>00000000^</add_on_unique_id17^>>>meta.xml
echo   ^<add_on_unique_id18 type="hexBinary" length="4"^>00000000^</add_on_unique_id18^>>>meta.xml
echo   ^<add_on_unique_id19 type="hexBinary" length="4"^>00000000^</add_on_unique_id19^>>>meta.xml
echo   ^<add_on_unique_id20 type="hexBinary" length="4"^>00000000^</add_on_unique_id20^>>>meta.xml
echo   ^<add_on_unique_id21 type="hexBinary" length="4"^>00000000^</add_on_unique_id21^>>>meta.xml
echo   ^<add_on_unique_id22 type="hexBinary" length="4"^>00000000^</add_on_unique_id22^>>>meta.xml
echo   ^<add_on_unique_id23 type="hexBinary" length="4"^>00000000^</add_on_unique_id23^>>>meta.xml
echo   ^<add_on_unique_id24 type="hexBinary" length="4"^>00000000^</add_on_unique_id24^>>>meta.xml
echo   ^<add_on_unique_id25 type="hexBinary" length="4"^>00000000^</add_on_unique_id25^>>>meta.xml
echo   ^<add_on_unique_id26 type="hexBinary" length="4"^>00000000^</add_on_unique_id26^>>>meta.xml
echo   ^<add_on_unique_id27 type="hexBinary" length="4"^>00000000^</add_on_unique_id27^>>>meta.xml
echo   ^<add_on_unique_id28 type="hexBinary" length="4"^>00000000^</add_on_unique_id28^>>>meta.xml
echo   ^<add_on_unique_id29 type="hexBinary" length="4"^>00000000^</add_on_unique_id29^>>>meta.xml
echo   ^<add_on_unique_id30 type="hexBinary" length="4"^>00000000^</add_on_unique_id30^>>>meta.xml
echo   ^<add_on_unique_id31 type="hexBinary" length="4"^>00000000^</add_on_unique_id31^>>>meta.xml
echo ^</menu^>>>meta.xml
cls
goto movebackromfilemk
:::::Moveback files:::::
:movebackromfilesnes
move app.xml ../Tools/NES/JNUSTool/BASEROM/code
move WUP-FB5P.rpx ../Tools/NES/JNUSTool/BASEROM/code
move meta.xml ../Tools/NES/JNUSTool/BASEROM/meta
goto bootdrcpng_pmeu
:movebackromfilessnes
move app.xml ../Tools/SNES/JNUSTool/BASEROM/code
move WUP-JAJP.rpx ../Tools/SNES/JNUSTool/BASEROM/code
move meta.xml ../Tools/SNES/JNUSTool/BASEROM/meta
goto bootdrcpng_fz
:movebackromfiledkc
move app.xml ../Tools/SNES/JNUSTool/BASEROM/code
move WUP-JACP.rpx ../Tools/SNES/JNUSTool/BASEROM/code
move meta.xml ../Tools/SNES/JNUSTool/BASEROM/meta
goto bootdrcpng_fz
:movebackromfileeb
move app.xml ../Tools/SNES/JNUSTool/BASEROM/code
move WUP-JBBP.rpx ../Tools/SNES/JNUSTool/BASEROM/code
move meta.xml ../Tools/SNES/JNUSTool/BASEROM/meta
goto bootdrcpng_fz
:movebackromfilekb
move app.xml ../Tools/SNES/JNUSTool/BASEROM/code
move WUP-JANP.rpx ../Tools/SNES/JNUSTool/BASEROM/code
move meta.xml ../Tools/SNES/JNUSTool/BASEROM/meta
goto bootdrcpng_fz
:movebackromfilemk
move app.xml ../Tools/SNES/JNUSTool/BASEROM/code
move WUP-JAKP.rpx ../Tools/SNES/JNUSTool/BASEROM/code
move meta.xml ../Tools/SNES/JNUSTool/BASEROM/meta
goto bootdrcpng_fz
:::::TGAFILES:::::
:bootdrcpng_pmeu
echo (Optional) Please put following files into the Files directory now. 
echo If you put one of them into the directory, please put the rest of them there too.
echo if you choose none, the NES VC Injection files will be used.
echo Icon file named iconTex.png OR iconTex.tga - Dimensions: 128x128
echo TV banner named bootTvTex.png OR bootTvTex.tga - Dimensions: 1280x720
echo 854x480 GamePad banner named bootDrcTex.png OR bootDrcTex.tga
echo
echo Did you put tga files (1)
echo png (2)
echo or no files (3) to the files folder?
set /p TGA=Enter the number behind the option: 
if %TGA%==1 goto movetga_nes
if %TGA%==2 goto convert_nes
if %TGA%==3 goto template_nes
:movetga_nes
cd ..
cd ..
cd ..
cd Files
move iconTex.tga ../Tools/NESSNES/Tools/NES/JNUSTool/BASEROM/meta
move bootDrcTex.tga ../Tools/NESSNES/Tools/NES/JNUSTool/BASEROM/meta
move bootTvTex.tga ../Tools/NESSNES/Tools/NES/JNUSTool/BASEROM/meta
cd ..
cd Tools
cd NESSNES
cd Source
goto templatelogo_nes
:convert_nes
cd ..
cd ..
cd ..
cd Files
move iconTex.png ../Tools/NESSNES/Source
move bootDrcTex.png ../Tools/NESSNES/Source
move bootTvTex.png ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
cd Source
png2tgacmd.exe -i bootDrcTex.png --width=854 --height=480 --tga-bpp=24 --tga-compression=none
png2tgacmd.exe -i bootTvTex.png --width=1280 --height=720 --tga-bpp=24 --tga-compression=none
png2tgacmd.exe -i iconTex.png --width=128 --height=128 --tga-bpp=32 --tga-compression=none
goto move_nes
:move_nes
move bootDrcTex.tga ../Tools/NES/JNUSTool/BASEROM/meta
move bootDrcTex.tga ../Tools/NES/JNUSTool/BASEROM/meta
move iconTex.tga ../Tools/NES/JNUSTool/BASEROM/meta
goto templatelogo_nes
:template_nes
cd ..
cd Tools
cd NES
cd Storage
cd GAME_FILES
move bootLogoTex.tga ../../JNUSTool/BASEROM/meta
move bootDrcTex.tga ../../JNUSTool/BASEROM/meta
move IconTex.tga ../../JNUSTool/BASEROM/meta
move bootDrcTex.tga ../../JNUSTool/BASEROM/meta
cd ..
cd ..
goto packing_nes
:templatelogo_nes
cd ..
cd Tools
cd NES
cd Storage
cd GAME_FILES
move bootLogoTex.tga ../../JNUSTool/BASEROM/meta
cd ..
cd ..
goto packing_nes

:bootdrcpng_fz
echo (Optional) Please put following files into the Files directory now. 
echo If you put one of them into the directory, please put the rest of them there too.
echo if you choose none, the NES VC Injection files will be used.
echo Icon file named iconTex.png OR iconTex.tga - Dimensions: 128x128
echo TV banner named bootTvTex.png OR bootTvTex.tga - Dimensions: 1280x720
echo 854x480 GamePad banner named bootDrcTex.png OR bootDrcTex.tga
echo
echo Did you put tga files (1)
echo png (2)
echo or no files (3) to the files folder?
set /p TGA=Enter the number behind the option: 
if %TGA%==1 goto movetga_snes
if %TGA%==2 goto convert_snes
if %TGA%==3 goto template_snes
:movetga_snes
cd ..
cd ..
cd ..
cd Files
move iconTex.tga ../Tools/NESSNES/Tools/SNES/JNUSTool/BASEROM/meta
move bootDrcTex.tga ../Tools/NESSNES/Tools/SNES/JNUSTool/BASEROM/meta
move bootTvTex.tga ../Tools/NESSNES/Tools/SNES/JNUSTool/BASEROM/meta
cd ..
cd Tools
cd NESSNES
cd Source
goto templatelogo_snes
:convert_snes
cd ..
cd ..
cd ..
cd Files
move iconTex.png ../Tools/NESSNES/Source
move bootDrcTex.png ../Tools/NESSNES/Source
move bootTvTex.png ../Tools/NESSNES/Source
cd ..
cd Tools
cd NESSNES
cd Source
png2tgacmd.exe -i bootDrcTex.png --width=854 --height=480 --tga-bpp=24 --tga-compression=none
png2tgacmd.exe -i bootTvTex.png --width=1280 --height=720 --tga-bpp=24 --tga-compression=none
png2tgacmd.exe -i iconTex.png --width=128 --height=128 --tga-bpp=32 --tga-compression=none
goto move_snes
:move_snes
move bootDrcTex.tga ../Tools/SNES/JNUSTool/BASEROM/meta
move bootDrcTex.tga ../Tools/SNES/JNUSTool/BASEROM/meta
move iconTex.tga ../Tools/SNES/JNUSTool/BASEROM/meta
goto templatelogo_snes
:template_snes
cd ..
cd Tools
cd SNES
cd Storage
cd GAME_FILES
move bootLogoTex.tga ../../JNUSTool/BASEROM/meta
move bootDrcTex.tga ../../JNUSTool/BASEROM/meta
move IconTex.tga ../../JNUSTool/BASEROM/meta
move bootDrcTex.tga ../../JNUSTool/BASEROM/meta
cd ..
cd ..
goto packing_snes
:templatelogo_snes
cd ..
cd Tools
cd SNES
cd Storage
cd GAME_FILES
move bootLogoTex.tga ../../JNUSTool/BASEROM/meta
cd ..
cd ..
goto packing_snes
:::::packing:::::
:packing_nes
cd JNUSTool
cd BASEROM
move code ../../NUSPACKER/input
move content ../../NUSPACKER/input
move meta ../../NUSPACKER/input
cd ..
cd ..
cd NUSPACKER 
start Pack_Games.bat
cls
echo if the packer window closed press enter
pause
cd install
move injected_vc_game ../../../../../../Injected_Games
cls
echo have fun with your vc game
pause
exit
:packing_snes
cd JNUSTool
cd BASEROM
move code ../../NUSPACKER/input
move content ../../NUSPACKER/input
move meta ../../NUSPACKER/input
cd ..
cd ..
cd NUSPACKER 
start Pack_Games.bat
cls
echo if the packer window closed press enter
pause
cd install
move injected_vc_game ../../../../../../Injected_Games
cls
echo have fun with your vc game
pause
exit
:erroridcheck
cls
del /f /q ..\TOOLS\Storage\ID
cls
echo you entered a non hex digit.
pause
cls
if %num%==1 goto editappxmlsnes
if %num%==2 goto editappxmldkc
if %num%==3 goto editappxmleb
if %num%==4 goto editappxmlkb
if %num%==5 goto editmetaxmlmk
goto editappxmlnes
