::Create a folder and stick the .bat file along with getmail.exe, and rxgrep.exe in it. 
@ECHO OFF
goto :start
:runcommand
CLS
ECHO MUAHAHAHAHAHAHAHAHAH >> message.txt
::Insert command here you want to run 
CLS 
TYPE message.txt
PAUSE
EXIT

:start
del *.txt
del *.out
del *.dat
CLS
::ping -n 120 127.0.0.1 REM <<<--- Uncomment this to add more time in between checking email. 
getmail -u email-address -pw password -s email-server -xtract REM Change email address, password, and email server
ping -n 5 127.0.0.1 > NUL REM PING For dramatic effect
type *.out > alltext1.dat
rxgrep alltext1.dat "Run Command" >> foundcommand.txt
ping -n 5 127.0.0.1 > NUL REM PING For dramatic effect
type *.txt > alltext2.dat
rxgrep alltext2.dat "Run Command" >> foundcommand.txt
findstr /m "Run Command" foundcommand.txt
if %errorlevel% EQU 0 goto :runcommand
if %errorlevel% EQU 1 goto :start
goto :start
