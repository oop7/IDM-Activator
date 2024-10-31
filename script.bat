@echo off
setlocal

:: Set script directories
set "SCRIPT_DIR=%~dp0"
set "SRC_DIR=%SCRIPT_DIR%src\"
set "DEFAULT_DEST_DIR=C:\Program Files (x86)\Internet Download Manager"

:: Set the paths for the encoded files
set "ENCODED_FILE=%SRC_DIR%encoded.txt"
set "ENCODED_2_FILE=%SRC_DIR%encoded_2.txt"
set "ENCODED_3_FILE=%SRC_DIR%encoded_3.txt"
:: Define color codes for output
set "RESET=[0m"
set "GREEN=[32m"
set "RED=[31m"

:: Check for administrator rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    :: If not admin, print a message and exit
    echo %RED%You need to run this script as Administrator. Please right-click the script and choose "Run as Administrator".%RESET%
    pause
    exit /b
)

:: Now running with admin privileges
echo %GREEN%Running with administrative privileges...%RESET%
echo Decoding encoded files...

:: Decode main file
powershell -Command "[System.IO.File]::WriteAllBytes('%TEMP%\decoded_file.txt', [System.Convert]::FromBase64String((Get-Content '%ENCODED_FILE%' -Raw)))"
if %errorlevel% neq 0 (
    echo %RED%Failed to decode file.%RESET%
    pause
    exit /b
)

:: Decode main_2 file
powershell -Command "[System.IO.File]::WriteAllBytes('%TEMP%\decoded_2_file.txt', [System.Convert]::FromBase64String((Get-Content '%ENCODED_2_FILE%' -Raw)))"
if %errorlevel% neq 0 (
    echo %RED%Failed to decode file.%RESET%
    pause
    exit /b
)

:: Decode main_3 file
powershell -Command "[System.IO.File]::WriteAllBytes('%TEMP%\decoded_3_file.txt', [System.Convert]::FromBase64String((Get-Content '%ENCODED_3_FILE%' -Raw)))"
if %errorlevel% neq 0 (
    echo %RED%Failed to decode file.%RESET%
    pause
    exit /b
)

:: Display ASCII art
chcp 65001 >nul
@echo off
setlocal enabledelayedexpansion

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
echo %RED%%DEFAULT_DEST_DIR%%RESET%
echo %RED%If the software is not installed in this directory, please ensure the path is correct before continuing.%RESET%

:: Prompt for user input
echo %GREEN%1. Activate%RESET%
echo %GREEN%2. Extra-FileType_Extensions%RESET%
echo 3. Exit
set /p choice=Choose an option (1 or 3): 

:: Handle user choice
if "%choice%"=="1" (
    echo Verifying source file...
    if not exist "%TEMP%\decoded_file.txt" (
        echo %RED%Source file not found. Please verify.%RESET%
        pause
        exit /b
    )

    if not exist "%TEMP%\decoded_2_file.txt" (
    echo %RED%Source file "decoded_2_file.txt" not found. Please verify.%RESET%
    pause
    exit /b
    )

    echo Both source files exist.

    echo Verifying destination directory...
    if not exist "%DEFAULT_DEST_DIR%" (
        echo %RED%Destination directory not found. Please verify the path.%RESET%
        pause
        exit /b
    )
    echo Destination directory exists.

     :: Terminate IDMan.exe process if running
    echo Terminating IDMan.exe if running...
    @taskkill /F /IM IDMan.exe >nul 2>&1
    if %errorlevel% neq 0 (
        echo %RED%Failed to terminate IDMan.exe or process not found.%RESET%
    ) else (
        echo %GREEN%IDMan.exe process terminated.%RESET%
    )

    echo %GREEN%Activated%RESET%
    regedit /s "%TEMP%\decoded_2_file.txt"
    copy "%TEMP%\decoded_file.txt" "%DEFAULT_DEST_DIR%\IDMan.exe" >nul
    if %errorlevel% neq 0 (
        echo %RED%Failed to copy the file.%RESET%
    )
    pause
) else if "%choice%"=="2" (
    echo Verifying source file...
    if not exist "%TEMP%\decoded_file.txt" (
        echo %RED%Source file not found. Please verify.%RESET%
        pause
        exit /b
    )

    echo source file exist.

    echo %GREEN%Done%RESET%
    regedit /s "%TEMP%\decoded_3_file.txt"
    pause
) else if "%choice%"=="3" (
    echo Exiting...
    pause
    exit
) else (
    echo %RED%Invalid choice. Please run the script again and choose 1, 2, or 3.%RESET%
)

:: Wait for user to press a key before closing
pause
endlocal
