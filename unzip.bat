:: Unzip the first parameter to the second parameter with 7zr.exe
:: If the second parameter is not specified, unzip to the current directory

@echo off
setlocal
:: Check if 7zr.exe is in the path
where /q 7zr.exe
if %errorlevel% neq 0 (
    echo 7zr.exe not found in path
    exit /b 1
)
:: Check if the first parameter is specified
if "%1"=="" (
    echo No zip file specified
    exit /b 1
)
:: Check if the first parameter is a file
if not exist "%1" (
    echo Zip file "%1" not found
    exit /b 1
)
:: Check if the second parameter is specified
if "%2"=="" (
    set unzipdir=.
) else (
    set unzipdir=%2
)
:: Check if the second parameter is a directory
if not exist "%unzipdir%" (
    echo Directory "%unzipdir%" not found
    exit /b 1
)
:: Unzip the file
7zr.exe x -y "%1" -o"%unzipdir%"
endlocal
exit /b 0
