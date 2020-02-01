@echo off
Title Encoding files with CERTUTIL utility by Hackoo 2018
color 0A & Mode 83,3
If "%~1"=="" ( 
    color 0C & Mode 80,3
    echo(
    echo       You must drag and drop a file over this batch script to be encoded !
    Timeout /T 5 /nobreak>nul & exit /b
)
@for /f %%i in ("certutil.exe") do if not exist "%%~$path:i" (
  echo CertUtil.exe not found.
  pause
  exit /b
)
set "TempFile=%Temp%\Temp_b64 
set "OutputFile=%~nx1_encoded%~x0"
If exist "%OutputFile%" Del "%OutputFile%" >nul 2>&1
echo(
echo         Please wait a while ... Encoding "%~nx1" is in progress ...
certutil.exe -f -encode "%~1" "%TempFile%" >nul 2>&1
(
    echo @echo off 
    echo Title My head kinda look like this
    echo echo Hello, my name is Kalesheezer, but you can call me Digi Kulamba
    echo echo and my head kinda look like this:
    echo CERTUTIL -f -decode "%%~f0" "%%Temp%%\%~nx1" ^>nul 2^>^&1 
    echo Timeout /T 5 /nobreak^>nul
    echo Start "%~n1" "%%Temp%%\%~nx1"
    echo Exit
)>> "%OutputFile%"
copy "%OutputFile%" /b + "%TempFile%" /b >nul 2>&1
If exist "%TempFile%" Del "%TempFile%" >nul 2>&1
Timeout /T 2 /NoBreak>nul & exit 