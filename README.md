# Minecraft 終界傳送門尋找工具

這個工具能幫助玩家在 Minecraft 中使用三角測量法快速定位終界傳送門的確切座標。只需在兩個不同位置記錄下丟擲終界之眼後的座標和面向角度，程式將自動計算出終界傳送門的位置。

## 功能特點

- 使用簡單的三角測量原理計算終界傳送門座標
- 提供詳細的中英文使用說明
- 僅需輸入兩個觀測點的座標和面向角度
- 自動計算並顯示精確與四捨五入後的座標
- 無需安裝任何額外軟體，支援 Windows 系統

## 使用說明

### 測量步驟

1. **第一次測量 (觀測點 A)**

   - 按下 F3 顯示座標與面向資訊
   - 丟出終界之眼，觀察其飛行方向
   - 將準心的 Y 軸綠色線對準終界之眼中心位置
   - 記下目前座標 (X1, Z1) 和面向角 yaw1 (Facing 的第一個數字)

2. **移動觀測 (觀測點 B)**

   - 往面向方向的左或右約 45 度移動 100 格左右
   - 再丟第二次終界之眼測量
   - 同樣將準心對準終界之眼中心，記下新的座標 (X2, Z2) 和新的 yaw2

3. **執行程式**
   - 啟動 EndPortalFinder.bat
   - 依照提示輸入記錄的座標和角度
   - 程式將自動計算並顯示終界傳送門的座標

## 安裝方法

1. 從 GitHub 下載 EndPortalFinder.bat 檔案
2. 雙擊執行即可使用，無需安裝

## 系統需求

- Windows 作業系統
- 支援 PowerShell (Windows 7/8/10/11 預設已安裝)

## 原理說明

本工具使用數學三角測量法，通過兩個觀測點的座標和方向角，計算兩條直線的交點。終界之眼的飛行方向指向終界傳送門，因此兩條觀測線的交點即為終界傳送門的位置。

## 注意事項

- 兩個觀測點必須與目標點不在同一直線上
- 測量時請確保終界之眼飛行線上沒有障礙物
- 準確的 yaw 角度對計算結果至關重要

---

# Minecraft End Portal Finder

This tool helps players in Minecraft quickly locate the exact coordinates of End Portals using triangulation. By recording coordinates and facing angles at two different locations after throwing Eyes of Ender, the program will automatically calculate the position of the End Portal.

## Features

- Uses simple triangulation principles to calculate End Portal coordinates
- Provides detailed instructions in both Chinese and English
- Requires only the coordinates and facing angles of two observation points
- Automatically calculates and displays exact and rounded coordinates
- No additional software installation needed, supports Windows systems

## Instructions

### Measurement Steps

1. **First Measurement (Observation Point A)**

   - Press F3 to display coordinates and facing information
   - Throw an Eye of Ender and observe its flight direction
   - Align your crosshair's Y-axis green line with the center of the Eye of Ender
   - Note your current coordinates (X1, Z1) and facing angle yaw1 (first number in Facing)

2. **Move and Observe (Observation Point B)**

   - Move about 100 blocks to the left or right (approximately 45 degrees from your facing direction)
   - Throw a second Eye of Ender
   - Again, align your crosshair with the Eye of Ender's center and note the new coordinates (X2, Z2) and new yaw2

3. **Run the Program**
   - Launch EndPortalFinder.bat
   - Enter the recorded coordinates and angles as prompted
   - The program will automatically calculate and display the End Portal coordinates

## Installation

1. Download the EndPortalFinder.bat file from GitHub
2. Simply double-click to run, no installation required

## System Requirements

- Windows operating system
- Supports PowerShell (pre-installed on Windows 7/8/10/11)

## How It Works

This tool uses mathematical triangulation by calculating the intersection point of two lines based on the coordinates and direction angles from two observation points. The flight direction of Eyes of Ender points toward the End Portal, so the intersection of the two observation lines gives the location of the End Portal.

## Important Notes

- The two observation points must not be on the same line with the target
- Ensure there are no obstacles in the flight path of the Eye of Ender during measurement
- Accurate yaw angles are crucial for calculation results
