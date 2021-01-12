@REM @REM /L számként (start, léps, stop) /r mappában rekurzívan
@REM FOR /L %%A IN (1,1,5) DO (


@Echo Off

Set "proxlist=test.txt"

call :getFile
Call :SetRand

For /F "Tokens=1* Delims=:" %%a In ('FindStr/N "^" "a.txt"') Do (
    Set "count=%%a"
)


ECHO a >> a.txt
set "commit=:%randline%: %count%. commit"
git add .
git commit -m "%commit%"
git push
echo %commit%
TIMEOUT 5
if NOT %count%==75 run.bat
Exit

:SetRand
Set/A "rand=(%RANDOM%%%total)+1"
Call Set "randline=%%line[%rand%]%%"

:getFile
For /F "Tokens=1* Delims=:" %%a In ('FindStr/N "^" "%proxlist%"') Do (
    Set "line[%%a]=%%b"
    Set "total=%%a"
)