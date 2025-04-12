@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: --------------------------------------------
:: Minecraft Triangulation Tool
:: --------------------------------------------

:: 創建臨時說明文件
echo 使用說明:> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo Minecraft 測量步驟說明:>> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo 1. 第一次測量 (觀測點 A)>> "%TEMP%\mc_help.txt"
echo    - 先按下 F3 顯示座標與面向資訊>> "%TEMP%\mc_help.txt"
echo    - 丟出終界之眼 觀察其飛行方向>> "%TEMP%\mc_help.txt"
echo    - 將準心的 Y 軸綠色線對準終界之眼中心位置>> "%TEMP%\mc_help.txt"
echo    - 記下目前座標 (X1, Z1) 和面向角 yaw1 (Facing 的第一個數字)>> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo 2. 移動觀測 (觀測點 B)>> "%TEMP%\mc_help.txt"
echo    - 往面向的方向的左或右約 45 度移動 100 格左右>> "%TEMP%\mc_help.txt"
echo    - 再丟第二次終界之眼測量>> "%TEMP%\mc_help.txt"
echo    - 同樣將準心對準終界之眼中心 記下新的座標 (X2, Z2) 和新的 yaw2>> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo --------------------------------------------->> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo USAGE INSTRUCTIONS:>> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo Minecraft Measurement Instructions:>> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo 1. First Measurement (Observation Point A)>> "%TEMP%\mc_help.txt"
echo    - Press F3 to display coordinates and facing information.>> "%TEMP%\mc_help.txt"
echo    - Throw an Eye of Ender and observe its flight direction.>> "%TEMP%\mc_help.txt"
echo    - Align your crosshair's Y-axis green line with the center of the Eye of Ender.>> "%TEMP%\mc_help.txt"
echo    - Note your current coordinates (X1, Z1) and facing angle yaw1 (first number in Facing).>> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"
echo 2. Move and Observe (Observation Point B)>> "%TEMP%\mc_help.txt"
echo    - Move about 100 blocks to the left or right (approximately 45 degrees from your facing direction).>> "%TEMP%\mc_help.txt"
echo    - Throw a second Eye of Ender.>> "%TEMP%\mc_help.txt"
echo    - Again, align your crosshair with the Eye of Ender's center and note the new coordinates (X2, Z2) and new yaw2.>> "%TEMP%\mc_help.txt"
echo.>> "%TEMP%\mc_help.txt"

cls
echo =============================================
echo   Minecraft Triangulation Tool
echo =============================================
echo.

type "%TEMP%\mc_help.txt"
echo.
echo Press any key to continue to data entry...
pause > nul
cls

echo =============================================
echo   Minecraft Triangulation Tool
echo =============================================
echo.

:: Input Observation Point A
set /p x1="Enter X coordinate for Point A: "
set /p z1="Enter Z coordinate for Point A: "
set /p yaw1="Enter yaw angle for Point A (in degrees): "

echo.
:: Input Observation Point B
set /p x2="Enter X coordinate for Point B: "
set /p z2="Enter Z coordinate for Point B: "
set /p yaw2="Enter yaw angle for Point B (in degrees): "

echo.
echo Calculating, please wait...
echo.

:: 顯示輸入的資料
echo Input data summary:
echo Point A: X=%x1%, Z=%z1%, yaw=%yaw1%
echo Point B: X=%x2%, Z=%z2%, yaw=%yaw2%
echo.
echo Press any key to start calculation...
pause > nul

:: 創建一個簡單的PowerShell腳本，僅執行基本計算
echo Preparing calculation...
echo Write-Host "Calculation started" > "%TEMP%\triangle_calc.ps1"
echo $pi = [math]::PI >> "%TEMP%\triangle_calc.ps1"
echo $x1 = %x1% >> "%TEMP%\triangle_calc.ps1"
echo $z1 = %z1% >> "%TEMP%\triangle_calc.ps1"
echo $yaw1 = %yaw1% >> "%TEMP%\triangle_calc.ps1"
echo $x2 = %x2% >> "%TEMP%\triangle_calc.ps1"
echo $z2 = %z2% >> "%TEMP%\triangle_calc.ps1"
echo $yaw2 = %yaw2% >> "%TEMP%\triangle_calc.ps1"
echo Write-Host "Variables set" >> "%TEMP%\triangle_calc.ps1"

echo $theta1 = $yaw1 * $pi / 180 >> "%TEMP%\triangle_calc.ps1"
echo $theta2 = $yaw2 * $pi / 180 >> "%TEMP%\triangle_calc.ps1"
echo $dx1 = -[math]::Sin($theta1) >> "%TEMP%\triangle_calc.ps1"
echo $dz1 = [math]::Cos($theta1) >> "%TEMP%\triangle_calc.ps1"
echo $dx2 = -[math]::Sin($theta2) >> "%TEMP%\triangle_calc.ps1"
echo $dz2 = [math]::Cos($theta2) >> "%TEMP%\triangle_calc.ps1"
echo Write-Host "Direction vectors calculated" >> "%TEMP%\triangle_calc.ps1"

echo $A = $dx1 >> "%TEMP%\triangle_calc.ps1"
echo $B = -$dx2 >> "%TEMP%\triangle_calc.ps1"
echo $C = $dz1 >> "%TEMP%\triangle_calc.ps1"
echo $D = -$dz2 >> "%TEMP%\triangle_calc.ps1"
echo $E = $x2 - $x1 >> "%TEMP%\triangle_calc.ps1"
echo $F = $z2 - $z1 >> "%TEMP%\triangle_calc.ps1"
echo $det = $A * $D - $B * $C >> "%TEMP%\triangle_calc.ps1"
echo Write-Host "Determinant = $det" >> "%TEMP%\triangle_calc.ps1"

echo if ([math]::Abs($det) -lt 1e-8) { >> "%TEMP%\triangle_calc.ps1"
echo     Write-Host "ERROR: Lines are parallel" >> "%TEMP%\triangle_calc.ps1"
echo     exit 1 >> "%TEMP%\triangle_calc.ps1"
echo } >> "%TEMP%\triangle_calc.ps1"

echo $t = ($E * $D - $B * $F) / $det >> "%TEMP%\triangle_calc.ps1"
echo $s = ($A * $F - $E * $C) / $det >> "%TEMP%\triangle_calc.ps1"
echo $xi = $x1 + $dx1 * $t >> "%TEMP%\triangle_calc.ps1"
echo $zi = $z1 + $dz1 * $t >> "%TEMP%\triangle_calc.ps1"
echo Write-Host "RESULT:$xi,$zi,$t,$s" >> "%TEMP%\triangle_calc.ps1"

echo Running PowerShell calculation...
echo PowerShell output:
echo ----------------------------------

:: 直接執行PowerShell並捕獲輸出
set "ps_output="
for /f "usebackq delims=" %%a in (`powershell -NoProfile -ExecutionPolicy Bypass -File "%TEMP%\triangle_calc.ps1" 2^>^&1`) do (
    echo %%a
    set "ps_output=!ps_output!%%a"
    if "%%a"=="ERROR: Lines are parallel" (
        goto calculation_failed
    )
    echo %%a | findstr /C:"RESULT:" > nul && (
        for /f "tokens=1* delims=:" %%b in ("%%a") do (
            set "result=%%c"
        )
    )
)

echo ----------------------------------
echo.

:: 如果找不到結果
if "%result%"=="" (
    echo No result found in the output.
    goto calculation_failed
)

echo.
echo Calculation result: %result%
echo.

for /f "tokens=1-4 delims=," %%a in ("%result%") do (
    set xi=%%a
    set zi=%%b
    set t=%%c
    set s=%%d
)

echo.
echo Predicted intersection coordinates: (X, Z) = (%xi%, %zi%)
echo Distance from Point A along direction: t = %t%
echo Distance from Point B along direction: s = %s%

:: 計算四捨五入後的整數座標
for /f "delims=" %%a in ('powershell -NoProfile -Command "[math]::Round(%xi%)"') do set xi_round=%%a
for /f "delims=" %%a in ('powershell -NoProfile -Command "[math]::Round(%zi%)"') do set zi_round=%%a

echo.
echo Rounded coordinates for easy navigation: (X, Z) = (%xi_round%, %zi_round%)
goto end_pause

:calculation_failed
echo.
echo Calculation failed. Please check your input values.
echo.
echo Point A: X=%x1%, Z=%z1%, yaw=%yaw1%
echo Point B: X=%x2%, Z=%z2%, yaw=%yaw2%
echo.
echo Note: The two observation points must not be on the same line
echo with the target. Also, make sure to use correct yaw values.

:end_pause
echo.
echo Program has completed. Press any key to exit...
pause > nul

:: 清理臨時文件
echo Cleaning up...
del "%TEMP%\mc_help.txt" >nul 2>&1
del "%TEMP%\triangle_calc.ps1" >nul 2>&1
del "%TEMP%\triangle_calc.ps1.log" >nul 2>&1
