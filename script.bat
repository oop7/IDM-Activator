@echo off
setlocal enabledelayedexpansion

:: Self-elevation code
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B
)

:: Set script directories
set "SCRIPT_DIR=%~dp0"
set "SRC_DIR=%SCRIPT_DIR%src\"
set "DEFAULT_DEST_DIR=C:\Program Files (x86)\Internet Download Manager"

:: Set the paths for the .bin files
set "DATA_FILE=%SRC_DIR%data.bin"
set "REGISTRY_FILE=%SRC_DIR%Registry.bin"
set "EXTENSIONS_FILE=%SRC_DIR%extensions.bin"

:: Define color codes for output
set "RESET=[0m"
set "GREEN=[32m"
set "RED=[31m"
set "YELLOW=[33m"

:: Check for administrator rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%You need to run this script as Administrator. Please right-click the script and choose "Run as Administrator".%RESET%
    pause
    exit /b
)

:: Now running with admin privileges
echo %GREEN%Running with administrative privileges...%RESET%

:: Display ASCII art
chcp 65001 >nul

:: Define the path to your ASCII art file
set "ascii_file=%SRC_DIR%\ASCII_art.txt"

:: Define the number of spaces for padding
set "padding=                                            "

:: Loop through each line in the ASCII art file and add spaces
for /f "delims=" %%i in (%ascii_file%) do (
    echo !padding!%%i
)

:: Add blank lines at the bottom for additional space
echo.
echo.
echo.

:: Display warning message about the default installation path
echo %RED%Warning: The default installation path for the software is:%RESET%
echo %YELLOW%%DEFAULT_DEST_DIR%%RESET%
echo %RED%If the software is not installed in this directory, please ensure the path is correct before continuing.%RESET%

:: Prompt for user input
echo.
echo %GREEN%============[1] Activate%RESET%
echo.
echo %GREEN%======[2] Extra-FileType_Extensions%RESET%
echo.
echo %RED%===[3] Exit%RESET%
set /p choice=Choose an option (1, 2, or 3): 

:: Handle user choice
if "%choice%"=="1" (
    call :verifyFile "%DATA_FILE%" "data.bin"
    call :verifyFile "%REGISTRY_FILE%" "Registry.bin"
    call :verifyDestinationDirectory

    :: Terminate IDMan.exe process if running
    call :terminateProcess "IDMan.exe"

    echo %GREEN%Activated successfully!%RESET%
    regedit /s "%REGISTRY_FILE%"
    copy "%DATA_FILE%" "%DEFAULT_DEST_DIR%\IDMan.exe" >nul
    if %errorlevel% neq 0 (
        echo %RED%Error: Failed to copy the file to the destination directory.%RESET%
    )
    pause
) else if "%choice%"=="2" (
    call :verifyFile "%DATA_FILE%" "data.bin"
    echo %GREEN%Extensions updated successfully!%RESET%
    regedit /s "%EXTENSIONS_FILE%"
    pause
) else if "%choice%"=="3" (
    echo %GREEN%Exiting the script. Thank you!%RESET%
    pause
    exit
) else (
    echo %RED%Invalid choice. Please run the script again and select option 1, 2, or 3.%RESET%
)

:: Wait for user to press a key before closing
pause
endlocal
exit /b

:: Subroutine to verify file existence
:verifyFile
    echo Verifying source file "%~2"...
    if not exist "%~1" (
        echo %RED%Source file "%~2" not found. Please verify.%RESET%
        pause
        exit /b
    )
    echo Source file "%~2" exists.
    exit /b

:: Subroutine to verify destination directory
:verifyDestinationDirectory
    echo Verifying destination directory...
    if not exist "%DEFAULT_DEST_DIR%" (
        echo %RED%Destination directory not found. Please verify the path.%RESET%
        pause
        exit /b
    )
    echo Destination directory exists.
    exit /b

:: Subroutine to terminate a process
:terminateProcess
    echo Terminating %~1 if running...
    @taskkill /F /IM %~1 >nul 2>&1
    if %errorlevel% neq 0 (
        echo %RED%Failed to terminate %~1 or process not found.%RESET%
    ) else (
        echo %GREEN%%~1 process terminated.%RESET%
    )
    exit /b