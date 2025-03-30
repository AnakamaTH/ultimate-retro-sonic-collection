:: WIP BUILD
:: Created by AnakamaTheHedgehog
:: CREDIT IF USED ANY CODE FROM HERE!

@echo off
echo Please wait...
(NET FILE||(powershell start-process -FilePath '%0' -verb runas)&&(exit \B)) >NUL 2>&1
(NET FILE||(exit)) >NUL 2>&1

:Variables
set version=4.01
set directory=%cd%
set name=Ultimate Retro Sonic Collection (PSOP)
set epic=Epic Games
set oepic=on Epic Games
set sm=Steam
set osm=on Steam

title %name% V%version%

:: Color text thing

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

:FirstTime
if exist data\req\check.txt (set first=1) else set first=0

if %first%==1 goto:Warning
if %first%==0 goto:Menu

:: Show a warning for installing all the files

:Warning
cls
call :ColorText C "!! WARNING !!"
echo.
echo Please make sure you downloaded all the files from the releases and extracted them!
echo Otherwise, the games will not work!
echo Press any button to contiune...
pause>nul

:Redist
cls
call :ColorText 9 "Installing requied redist..."
cd data\redist
start /wait bizhawk_prereqs.exe /passive /norestart

:: Code credits to "Microsoft Redist all in one"

set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

if "%IS_X64%" == "1" goto X64

:X86

start /wait vcredist2005_x86.exe /q

start /wait vcredist2008_x86.exe /qb

start /wait vcredist2010_x86.exe /passive /norestart

start /wait vcredist2012_x86.exe /passive /norestart

start /wait vcredist2013_x86.exe /passive /norestart

start /wait vcredist2015_2017_2019_2022_x86.exe /passive /norestart

:X64

start /wait vcredist2005_x86.exe /q
start /wait vcredist2005_x64.exe /q

start /wait vcredist2008_x86.exe /qb
start /wait vcredist2008_x64.exe /qb

start /wait vcredist2010_x86.exe /passive /norestart
start /wait vcredist2010_x64.exe /passive /norestart

start /wait vcredist2012_x86.exe /passive /norestart
start /wait vcredist2012_x64.exe /passive /norestart

start /wait vcredist2013_x86.exe /passive /norestart
start /wait vcredist2013_x64.exe /passive /norestart

start /wait vcredist2015_2017_2019_2022_x86.exe /passive /norestart
start /wait vcredist2015_2017_2019_2022_x64.exe /passive /norestart

del data\req\check.txt
cd ..
cd ..

:: Game Menu

:Menu
cls
set back=Menu
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  %name% V%version%
echo ============================================================
echo.
echo  [ 1 ] 16 Bit Classics
echo  [ 2 ] Emulator
echo  [ 3 ] Steam and Epic Games
echo  [ 4 ] Extra
echo.
echo  [ / ] Settings
echo  [ - ] EXIT
echo.
set /p choice= Category:
if %choice%==/ goto:Settings
if %choice%==\ goto:Settings
if %choice%==1 goto:16BitClassics
if %choice%==2 goto:Emulator
if %choice%==3 goto:Paid
if %choice%==4 goto:extra
if %choice%==c goto:credits
if %choice%==C goto:credits
if %choice%==+ goto:suggest
if %choice%==- goto:exit

:Settings
cls
set back=Settings
pushd %~dp0
set "choice=-"
echo ============================================================
echo  Settings
echo ============================================================
echo.
echo  [ / ] Check for Updates
echo  [ + ] Suggest Games
echo  [ C ] Credits
echo  [ V ] Version Info
echo.
echo  [ - ] Go Back
echo.
set /p choice= Option:
if %choice%==- goto:Menu
if %choice%==c goto:credits
if %choice%==C goto:credits
if %choice%==/ goto:settings
if %choice%==v goto:version
if %choice%==V goto:version
if %choice%==+ goto:suggest

:version
cls
echo Version Info:
echo.
if "%first%" == "1" call :ColorText 2 "Running for the first time"
if "%first%" == "0" call :ColorText C "Not running for the first time"
echo.
echo.
call :ColorText 9 "%name% V%version%"
echo.
echo.
echo Press any button to exit...
pause>nul
goto:%back%

:: AD
:genesiscollection
echo Why you should install Sonic Genesis Collection?
timeout 1 > NUL
echo Sonic Genesis Collection has more then 50 sonic games and rom hacks from Sega Genesis to choose from!
timeout 1 > NUL
echo With lots of customizability and incredible performance!
timeout 1 > NUL
echo Try Sonic Genesis Collection on GameJolt today!
echo Credits to AnakamaTheHedgehog
timeout 2 > NUL
start https://gamejolt.com/games/sonicgenesiscollection/883397
timeout 2 > NUL
goto:%back%

:16Bit
cls
set back=:16Bit
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  16 Bit Classics
echo ============================================================
echo. 
echo  [ 1 ] Sonic 1
echo  [ 2 ] Sonic 2
echo  [ 3 ] Sonic CD
echo  [ 4 ] Sonic 3 and Knuckles
echo.
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:sonic
if %choice%==2 goto:sonic2
if %choice%==3 goto:soniccd
if %choice%==4 goto:sonic3
if %choice%==- goto:Menu

:Emulator
cls
set back=Emulator
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  Emulator
echo ============================================================
echo.
echo  [ 1 ] Sonic 1 Sega Genesis
echo  [ 2 ] Sonic 2 Sega Genesis
echo  [ 3 ] Sonic 3 and Knuckles Sega Genesis
echo  [ 4 ] Sonic 1 Game Gear
echo  [ 5 ] Sonic 2 Game Gear
echo  [ 6 ] Sonic 3D Blast
echo  [ 7 ] Sonic Blast
echo  [ 8 ] Sonic Chaos
echo  [ 9 ] Triple Trouble
echo.
echo  [ + ] Install Genesis Collection
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:s1g
if %choice%==2 goto:s2g
if %choice%==3 goto:s3g
if %choice%==4 goto:s1emu
if %choice%==5 goto:s2emu
if %choice%==6 goto:tripletrouble
if %choice%==7 goto:blast
if %choice%==8 goto:chaos
if %choice%==+ goto:genesiscollection
if %choice%==- goto:Menu

:Paid
cls
set back=Paid
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  Select the platform
echo ============================================================
echo.
echo  [ 1 ] Steam
echo  [ 2 ] Epic Games
echo.
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:Steam
if %choice%==2 goto:EpicGames
if %choice%==- goto:Menu

:Steam
cls
set platform=Steam
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  %platform%
echo ============================================================
echo.
echo  [ 1 ] Sonic 4 Epsiode 1
echo  [ 2 ] Sonic 4 Epsiode 2
echo  [ 3 ] Sonic Mania
echo  [ 4 ] Sonic Origins
echo  [ 5 ] Sonic Adventure 2
echo.
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:4ep1
if %choice%==2 goto:4ep2
if %choice%==3 goto:maniasteam
if %choice%==4 goto:originssteam
if %choice%==5 goto:sa2%platform%
if %choice%==- goto:%back%

:EpicGames
cls
set platform=Epic Games
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  %platform%
echo ============================================================
echo.
echo  [ 1 ] Sonic Mania Plus
echo  [ 2 ] Sonic Origins
echo.
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:maniaepic
if %choice%==2 goto:originsepic
if %choice%==- goto:%back%

:Extra
cls
pushd %~dp0
set back=Extra
set "choice=-"
echo.
echo ============================================================
echo  Extra
echo ============================================================
echo.
echo  [ 1 ] Sonic Forever
echo  [ 2 ] Sonic 2 Absolute
echo  [ 3 ] Sonic Forever: Expansion Pack
echo  [ 4 ] Sonic 3 Angel Island Revisited
echo.
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:s1f
if %choice%==2 goto:s2a
if %choice%==3 goto:sonicforeverexpensionpack
if %choice%==4 goto:3air
if %choice%==- goto:Menu

:: Steam - Epic Games launch scripts

:sa2steam
cls
echo Launching Sonic Adventure 2 %osm%
start steam://launch/213610
timeout 2 > NUL
goto:%platform%

:originsepic
cls
echo Launching Sonic Origins %oepic%
start com.epicgames.launcher://apps/78705aae6f39495e920966615c7a22ae%3A6816faab4bc34aaaad5bba36ca7af5f6%3A5070a8e44cf74ba3b9a4ca0c0dce5cf1?action=launch&silent=false
timeout 2 > NUL
goto:%platform%

:originssteam
cls
echo Launching Sonic Origins %osm%
start %platform%://launch/1794960
timeout 2 > NUL
goto:%platform%

:maniasteam
cls
echo Launching Sonic Mania %osm%
start steam://launch/584400
timeout 2 > NUL
goto:%platform%

:maniaepic
cls
echo Launching Sonic Mania %oepic%
start start com.epicgames.launcher://apps/78705aae6f39495e920966615c7a22ae%3A6816faab4bc34aaaad5bba36ca7af5f6%3A5070a8e44cf74ba3b9a4ca0c0dce5cf1?action=launch&silent=false
timeout 2 > NUL
goto:%platform%

:4ep1steam
echo Launching Sonic 4 Epsiode 1 %osm%
start steam://launch/202530
timeout 2 > NUL
goto:%platform%

:4ep2steam
echo Launching Sonic 4: Epsiode 2 %osm%
start steam://launch/203650
timeout 2 > NUL
goto:%platform%

:sonic
cls
cd data\classic\sonic
set cdsonic=%cd%
echo Checking data.rsdk..
if exist data.rsdk (echo Succes, opening) else goto:sonicdata
start RSDKv4_64.exe
timeout 2 > NUL
goto:Menu

:sonicdata
cls
set game= Sonic 1
echo Please put a %game% "Data.rsdk" into the "data" folder.
cd ..
cd ..
echo.
pause
if exist *.rsdk (goto:s1rsdk) else echo No RSDK files found.
pause
echo Going back...
goto:%back%

:s1rsdk
echo RSDK file found
rename *.rsdk Data.rsdk
move *.rsdk classic\sonic
if exist classic\sonic\data.rsdk (call :ColorText 9 "Succes") else goto:errors1
cd classic\sonic
timeout 2 > NUL
start RSDKv4_64.exe
goto:%back%

:errors1
cls
call :ColorText C "ERROR"
echo.
echo The data file could not be extracted.
echo Please make sure you have provided Sonic 1 data.rsdk
echo Data.rsdk can be found inside the "Sonic the Hedgehog Classic" apk file or in Sonic Origins files.
echo Press any key to go back...
pause>nul
goto:%back%

:: SONIC 2 RSDK STUFF

:sonic2
set game=Sonic 2
cls
cd data\classic\sonic2
echo Checking data.rsdk..
if exist data.rsdk (echo Succes, opening) else goto:sonic2data
start RSDKv4_64.exe
timeout 2 > NUL
goto:Menu

:sonic2data
cls
echo Please put a %game% "Data.rsdk" into the "data" folder
cd ..
cd ..
echo.
pause
if exist *.rsdk (goto:s2rsdk) else echo No RSDK files found.
pause
echo Going back...
goto:%back%

:s2rsdk
echo RSDK file found
rename *.rsdk Data.rsdk
move Data.rsdk classic\sonic2
if exist classic\sonic2\data.rsdk (call :ColorText 9 "Succes") else goto:errors2
cd classic\sonic2
timeout 2 > NUL
start RSDKv4_64.exe
goto:%back%

:errors2
cls
call :ColorText C "ERROR"
echo.
echo The data file could not be extracted.
echo Please make sure you have provided Sonic 2 data.rsdk
echo Data.rsdk can be found inside the "Sonic the Hedgehog 2 Classic" apk file or in Sonic Origins files.
echo Press any key to go back...
pause>nul
goto:%back%

:: 

:soniccd
set game=Sonic CD
cls
cd data\classic\soniccd
echo Checking data.rsdk..
if exist data.rsdk (echo Succes, opening) else goto:cddata
start RSDKv3_64.exe
timeout 2 > NUL
goto:Menu

:cddata
cls
echo Please put a %game% "Data.rsdk" into the "data" folder
cd ..
cd ..
echo.
pause
if exist *.rsdk (goto:cdrsdk) else echo No RSDK files found.
pause
echo Going back...
goto:%back%

:cdrsdk
echo RSDK file found
rename *.rsdk Data.rsdk
move Data.rsdk classic\soniccd
if exist classic\soniccd\data.rsdk (call :ColorText 9 "Succes") else goto:errorscd
cd classic\soniccd
timeout 2 > NUL
start RSDKv3_64.exe
goto:%back%

:errorscd
cls
call :ColorText C "ERROR"
echo.
echo The data file could not be extracted.
echo Please make sure you have provided Sonic 2 data.rsdk
echo Data.rsdk can be found inside the "Sonic the Hedgehog 2 Classic" apk file or in Sonic Origins files.
echo Press any key to go back...
pause>nul
goto:%back%

:sonic3
cd data\classic\sonic3
echo Opening Sonic 3 and Knuckles
start SONIC3K.EXE
timeout 2 > NUL
goto:%back%

:: Extras

:3air
cd data\extra\s3air
echo Opening Sonic 3 A.I.R.
start Sonic3AIR.exe
timeout 2 > NUL
goto:%back%

:cdr
cd data\extra\soniccdrestored
echo Opening Sonic CD Restored.
start Restored.exe
goto:%back%

:: Emulator launch scripts

:s1emu
cd data\emu
start EmuHawk.exe roms\s1.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:%back%

:s2emu
cd data\emu
start EmuHawk.exe roms\s2.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:%back%

:tripletrouble
cd data\emu
start EmuHawk.exe roms\tripletrouble.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:%back%

:blast
cd data\emu
start EmuHawk.exe roms\sblast.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:%back%


:: SETTINGS

:updates
start https://github.com/AnakamaTH/ultimate-retro-sonic-collection/releases
goto:Menu

:: Suggest menu with a Yes/No section.

:suggest
cls
echo Wanna suggest a game to add or report a bug?
echo (A mod, remake etc.)
SET /P AREYOUSURE=Are you sure (Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO :Menu
start https://github.com/AnakamaTH/ultimate-retro-sonic-collection/issues/new
goto:Menu

:: Credits Menu

:credits
cls
call :ColorText 9 "CREDITS"
echo.
echo.
call :ColorText 2 "LEGAL NOTE: THIS LAUNCHER HAS NOTHING TO DO WITH SEGA OR SONIC TEAM, IT IS A COMPLETELY FAN-MADE SCRIPT."
echo.
echo.
echo AnakamaTheHedgehog: Batch Scripts, Collection, idea.
echo SEGA: Sonic The Hedgehog, the games, the logo, the base game, the character, and the series.
echo TASEmulators Team: EmuHawk Emulator
echo RSDKModding Team: RSDKv4 Decomplation.
echo Gabe Newel: Steam platform.
echo Eukaryot: Sonic 3 A.I.R.
echo Korama: Sonic 3 and Knuckles Patch, Sega PC Reloaded.
echo.
echo All rights reserved.
pause
goto:Menu

:: Close the launcher

:Exit
cls
echo Close the launcher?
set "choice=-"
echo.
set /p choice= Y/N: 
if %choice%==y exit
if %choice%==Y exit
if %choice%==N goto:Menu
if %choice%==n goto:Menu

:: Color text thing

:ColorText
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
