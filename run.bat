@REM @REM /L számként (start, léps, stop) /r mappában rekurzívan
@REM FOR /L %%A IN (1,1,5) DO (


@Echo Off

Set "proxlist=test.txt"

call :getFile

Call :SetRand

ECHO a >> a.txt
git add .
set "commit=:%randline%: Test"
@REM echo %commit%
git commit -m "%commit%"
Exit

:SetRand
Set/A "rand=(%RANDOM%%%total)+1"
Call Set "randline=%%line[%rand%]%%"

:getFile
For /F "Tokens=1* Delims=:" %%a In ('FindStr/N "^" "%proxlist%"') Do (
    Set "line[%%a]=%%b"
    Set "total=%%a"
)