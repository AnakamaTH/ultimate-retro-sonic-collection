:: WORKS IN PROCCES BUILD
:: Created by AnakamaTheHedgehog

@echo off
set version=4.1
set directory=%cd%
set name=Ultimate Retro Sonic Collection (PSOP)
echo Please wait...
title %name% V%version%
(NET FILE||(powershell start-process -FilePath '%0' -verb runas)&&(exit \B)) >NUL 2>&1
(NET FILE||(exit)) >NUL 2>&1

:: Another color text thing

for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

:: Check if user is running for the first time by seeing if a file is still there

:FirstTime
if exist data\req\check.txt (set first=1) else set first=0

if %first%=0 goto:Menu
if %first%=1 goto:Warning

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

:: Code credits to "Microsoft Visual Studio Redist all in one"

set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

if "%IS_X64%" == "1" goto X64

:X86

start /wait vcredist2005_x86.exe /q

start /wait vcredist2008_x86.exe /qb

start /wait vcredist2010_x86.exe /passive /norestart

start /wait vcredist2012_x86.exe /passive /norestart

start /wait vcredist2013_x86.exe /passive /norestart

start /wait vcredist2015_2017_2019_2022_x86.exe /passive /norestart

goto:EndRedist

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

:EndRedist
del data\req\check.txt
cd ..
cd ..

:: Game Menu

:Menu
cls
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  %name% V%version% 
echo ============================================================
echo.
echo  [ 1 ] 16 Bit Classics
echo  [ 2 ] Emulator
echo  [ 3 ] Sonic 4
echo  [ 4 ] Extras 
echo.
echo  [ / ] Settings
echo  [ - ] Exit
echo.
set /p choice= Category:
if %choice%==/ goto:Settings
if %choice%==\ goto:Settings
if %choice%==1 goto:16BitClassics
if %choice%==2 goto:Emulator
if %choice%==3 goto:Sonic4
if %choice%==4 goto:extra
if %choice%==- goto:exit
if %choice%==c goto:credits
if %choice%==C goto:credits
if %choice%==+ goto:suggest

:Settings
cls
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
echo.
pause>nul
goto:Settings

:16BitClassics
cls
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  16 Bit Classics
echo ============================================================
echo. 
echo  [ 1 ] Sonic the Hedgehog
echo  [ 2 ] Sonic the Hedgehog 2
echo  [ 3 ] Sonic the Hedgehog CD
echo  [ 4 ] Sonic the Hedgehog 3 and Knuckles
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
if %choice%==1 goto:s1emu
if %choice%==2 goto:s2emu
if %choice%==3 goto:s3g
if %choice%==4 goto:s1g
if %choice%==5 goto:s2g
if %choice%==6 goto:tripletrouble
if %choice%==7 goto:blast
if %choice%==8 goto:chaos
if %choice%==+ goto:chaos
if %choice%==- goto:Menu

:Sonic4
cls
pushd %~dp0
set "choice=-"
echo.
echo ============================================================
echo  Sonic the Hedgehog 4
echo ============================================================
echo.
echo  [ 1 ] Sonic 4 Epsiode 1
echo  [ 1 ] Sonic 4 Epsiode 2
echo.
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:4ep1
if %choice%==2 goto:4ep2
if %choice%==- goto:Menu

:Extra
cls
pushd %~dp0
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
echo  [ 5 ] Sonic Mania Plus
echo.
echo  [ - ] GO BACK
echo.
set /p choice= Game: 
if %choice%==1 goto:s1f
if %choice%==2 goto:s2a
if %choice%==3 goto:sonicforeverexpensionpack
if %choice%==4 goto:3air
if %choice%==5 goto:mania
if %choice%==- goto:Menu

:: SONIC1 to SONIC3 launch

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
echo Please put a Sonic the Hedgehog Classic apk file or a Sonic 1 Data.rsdk into the "data" folder and press a button...
cd ..
cd ..
if exist *.rsdk (goto:s1rsdk) else echo No RSDK files found.
pause
goto:sonic

:s1rsdk
set directory=%cd%
echo RSDK file found
rename *.rsdk Data.rsdk
move *.rsdk classic\sonic
echo %cd%
pause
if exist classic\sonic\data.rsdk (call :ColorText 9 "Succes") else goto:errors1
cd %cdsonic%
timeout 2 > NUL
start RSDKv4_64.exe
goto:16BitClassics

:errors1
cls
call :ColorText C "ERROR"
echo.
echo The data file could not be extracted.
echo Please make sure you have provided Sonic 1 data.rsdk
echo Data.rsdk can be found inside the "Sonic the Hedgehog Classic" apk file or in Sonic Origins files.
echo Press any key to go to the menu.
pause>nul
goto:Menu

:sonic2
cd data\classic\sonic2
echo Opening Sonic 2
start RSDKv4_64.exe
timeout 2 > NUL
goto:Menu

:soniccd
cd data\classic\soniccd
echo Opening Sonic CD
start RSDKv3_64.exe
timeout 2 > NUL
goto:Menu

:sonic3
cd data\classic\sonic3
echo Opening Sonic 3 and Knuckles
start SONIC3K.EXE
timeout 2 > NUL
goto:Menu

:: S1F to MANIA Launch scripts
:sonicforever
cd data\extra\s1f
echo Opening Sonic Forever
start SonicForever.exe
timeout 2 > NUL
goto:Menu

:sonicforeverexpensionpack
cd data\extra\s1fpack
echo Opening Sonic Forever Expansion Pack
start SonicForever.exe
timeout 2 > NUL
goto:Menu

:2absolute
cd data\extra\s2a
echo Opening Sonic 2 Absolute
start Sonic2Absolute.exe
timeout 2 > NUL
goto:Menu

:3air
cd data\extra\s3air
echo Opening Sonic 3 A.I.R.
start Sonic3AIR.exe
timeout 2 > NUL
goto:Menu

:cdr
cd data\extra\soniccdrestored
echo Opening Sonic CD Restored.
start Restored.exe
goto:Menu

:mania
cd data\extra\mania
echo Starting Sonic Mania Plus
start SonicMania.exe
goto:Menu

:: SMS1 to CHAOS launch scripts

:sms1
cd data\8bit
echo Starting Sonic SMS Remake
start SonicSMSRemake.exe
goto:Menu

:sms2
cd data\8bit
echo Starting Sonic SMS Remake 2
start SonicSMSRemake2.exe
goto:Menu

:sms3
cd data\8bit\Sonic SMS Remake 3
echo Starting Sonic SMS Remake 3
start SonicSMSRemake3TimelinesSAGE2023.exe
goto:Menu

:chaos
cd data\8bit
echo Starting Sonic Chaos Remake
start SonicChaosRemake.exe
goto:Menu


:: Emulator launch scripts

:s1g
cd data\emu
start EmuHawk.exe roms\s1.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:Emulator

:s2g
cd data\emu
start EmuHawk.exe roms\s2.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:Emulator

:tripletrouble
cd data\emu
start EmuHawk.exe roms\tripletrouble.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:Menu

:blast
cd data\emu
start EmuHawk.exe roms\sblast.gg
timeout 2 > NUL
msg * Press "Alt + Enter" for Fullscreen
goto:Menu

:: Sonic 4 Launch scripts

:4ep1
SET /P AREYOUSURE1=Do you have Sonic 4 Epsiode 1 on Steam? (Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO :NoPiracyS4EP1
steam://launch/202530

:NoPiracyS4EP1
echo This project doesn't support piracy
echo If you don't have Sonic 4 Epsiode 1 on Steam, you have to buy it!
echo If you have the game on another platform, you can add its files directly into data\others\s4ep1
pause
start https://store.steampowered.com/app/202530/Sonic_the_Hedgehog_4__Episode_I/

goto:Menu

:4ep2
SET /P AREYOUSURES4E2=Do you have Sonic 4 Epsiode 2 on Steam? (Y/N)?
IF /I "%AREYOUSURES4E2%" NEQ "Y"
start steam://launch/203650  
start https://store.steampowered.com/app/203650/Sonic_the_Hedgehog_4__Episode_II/ 

goto:Menu

:: SETTINGS

:updates
:: Open the latest version page.
start https://github.com/AnakamaTH/proper-sonic-origins-plus/releases
goto:Menu

:: Suggest menu with a Yes/No section.

:suggest
cls
echo Wanna suggest a game to add or report a bug?
echo (A mod, remake etc.)
SET /P AREYOUSURE=Are you sure (Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO :Menu
start https://github.com/AnakamaTH/proper-sonic-origins-plus/issues/new
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
echo SEGA: Sonic The Hedgehog, the logo, the base game and the character, the series.
echo RSDKModding: RSDKv4 Decomplation.
echo Team Forever: Sonic Forever and Sonic 2 Absolute.
echo Christian Whitehead: Sonic Mania Plus.
echo Karl: Sonic 1 Expansion Pack Mod for Sonic Forever.
echo Creative Araya: Sonic SMS Remakes.
echo Laiker_2003: Sonic Chaos Remake.
echo Eukaryot: Sonic 3 A.I.R.
echo Korama: Sonic 3 and Knuckles Patch, Sega PC Reloaded.
echo.
echo All rights reversed.
pause
goto:Menu

:: Close the launcher

:Exit
echo Close the launcher?
SET /P AREYOUSURE=Are you sure (Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO :Menu

:: Color text thing

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
 