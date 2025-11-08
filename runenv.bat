@echo off
break off
echo executing commands..
echo activating environment
call env\Scripts\activate
echo environment activated successfully (time taken 0.004s)
echo opening vscode on project folder
cd projectAPT
call cmd /c "code ."
echo vscode running 
echo.
echo starting apache server and sql
echo start
call cmd /c "C:\xampp\xampp_start.exe"
call explorer.exe "C:\xampp\xampp-control.exe"
echo you are about to run the django server for this project
echo.
echo typing exit will terminate all batch operations and cmd instance
echo to deploy cleanup operations press n and continue 
timeout /t 1 >nul
cls
echo python manage.py runserver | clip
cmd /k "python manage.py runserver"
call cmd /c "C:\xampp\xampp_stop.exe"
taskkill /f /im xampp-control.exe
taskkill /f /im Code.exe
exit
