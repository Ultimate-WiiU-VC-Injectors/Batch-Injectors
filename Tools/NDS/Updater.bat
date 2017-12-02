@echo off
echo Downloading new update...
mkdir temp
cd Updaterfiles
copy *.* ..\temp\
cd ..
cd temp
aria2c.exe https://github.com/Hotbrawl20/UltimateNDSInjector/archive/master.zip
pause
unzip *.zip
del /f /q UltimateNDSInjector-master.zip
rename UltimateNDSInjector-master Update
cd ..

rd /f /q Tools
del /f /q NDSINJECTOR.bat
rd /f /q SOURCE_FILES
del /f /q clean.bat
cd temp
cd Update
del /f /q "README.md"
move Tools ../../
move NDSINJECTOR.bat ../../
move SOURCE_FILES ../../
move clean.bat ../../
cd ..
cd ..
rd /f /q /s temp
cls
echo Update completed
pause
start NDSINJECTOR.bat