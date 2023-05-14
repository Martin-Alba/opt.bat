@echo off
cls

echo Ejecutando el archivo como admin / Running the script as admin...
echo.
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :Continue
) else (
    echo ESP: Se debe ejecutar como administrador.
    echo ESP: Hacer click derecho en el script y "Ejecutar como administrador".
    echo.
    echo.
    echo ENG: This batch file requires administrator privileges
    echo ENG: Please right-click on the script and select "Run as administrator".
    pause >nul
    goto :EOF
)

:Continue
echo Local Temp
del C:\Users\%username%\AppData\Local\Temp /f /s /q
rd C:\Users\%username%\AppData\Local\Temp /s /q
echo DNS
ipconfig /flushdns
echo Win Temp
IF EXIST C:\Windows\Temp (
    del c:\Windows\Temp /f /s /q
    rd c:\Windows\Temp /s /q
)

exit