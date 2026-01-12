@echo off
REM Build script for Pricing Application
REM Requires MinGW to be installed and in PATH

echo Building Pricing Application...
echo.

REM Check if mingw32-make exists
where mingw32-make >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: mingw32-make not found in PATH
    echo Please install MinGW and add it to your PATH
    echo Download from: https://www.mingw-w64.org/
    pause
    exit /b 1
)

REM Check if gcc exists
where gcc >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: gcc not found in PATH
    echo Please install MinGW and add it to your PATH
    pause
    exit /b 1
)

REM Build the application
mingw32-make
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Build failed!
    pause
    exit /b 1
)

echo.
echo Build successful!
echo Executable: PricingApp.exe
echo.
echo Run the application? (Y/N)
set /p RUNAPP=

if /i "%RUNAPP%"=="Y" (
    echo Running PricingApp.exe...
    start PricingApp.exe
)

pause
