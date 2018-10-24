@ECHO OFF&PUSHD %~DP0 &TITLE NtrQQ专用精简
mode con cols=48 lines=26
color 2F
Rd "%WinDir%\system32\test_permissions" >NUL 2>NUL
Md "%WinDir%\System32\test_permissions" 2>NUL||(Echo 请使用右键管理员身份运行！&&PAUSE >NUL&&EXIT)
Rd "%WinDir%\System32\test_permissions" 2>NUL
SetLocal EnableDelayedExpansion
:Menu
Cls
@ echo. 
@ echo.请将本文件放置在QQ根目录下运行
@ echo. 
@ echo.  1.关闭QQ（必须）
@ echo. 
@ echo.  2.清理后台相关文件及注册残留
@ echo. 
@ echo.  3.删除QQ无用文件（执行后QQ无法直接运行，需搭配 NtrQQ 或 去校验补丁）
@ echo. 
@ echo.  4.清除BAK备份文件
@ echo. 
@ echo. 
set /p xj= 请输入选项数字后按回车：
if /i "%xj%"=="1" Goto CloseQQ
if /i "%xj%"=="2" Goto CleanQQ
if /i "%xj%"=="3" Goto Cleanother
if /i "%xj%"=="4" Goto CleanBAK
@ echo.
echo      选择无效，请重新输入
ping -n 2 127.1>nul 
goto menu
:CloseQQ
@ echo.
ECHO　　　正在关闭中..请稍等..
:: 安装前结束相关进程
taskkill /f /im TXP* >NUL 2>NUL
taskkill /f /im tad* >NUL 2>NUL
taskkill /f /im QQP* >NUL 2>NUL
taskkill /f /im QQC* >NUL 2>NUL
taskkill /f /im QQ.exe >NUL 2>NUL
CLS & ECHO.&ECHO 结束进程完成，任意键返回！&PAUSE >NUL 2>NUL & CLS & GOTO MENU
:CleanQQ
@ echo.
ECHO 清理后台相关文件及注册残留中..请稍等..
:: 清理后台相关文件及注册残留
rd/s/q "%AppData%\Tencent\QQ"  2>NUL
rd/s/q "%AppData%\Tencent\Logs"2>NUL
rd/s/q "%AppData%\Tencent\Users"2>NUL
rd/s/q "%AppData%\Tencent\QTalk"2>NUL
rd/s/q "%AppData%\Tencent\QQLite"2>NUL
rd/s/q "%APPDATA%\Tencent\QQDoctor"2>NUL
rd/s/q "%AppData%\Tencent\DeskUpdate"2>NUL
rd/s/q "%ProgramData%\Tencent\QQProtect"2>NUL
rd/s/q "%AppData%\Tencent\AndroidAssist"2>NUL
rd/s/q "%AppData%\Tencent\AndroidServer"2>NUL
rd/s/q "%AppData%\Tencent\QQPhoneManager"2>NUL
rd/s/q "%AppData%\Tencent\QQPhoneAssistant"2>NUL
rd/s/q "%UserProfile%\Documents\Tencent"   2>NUL
rd/s/q "%UserProfile%\My Documents\Tencent"2>NUL
rd/s/q "%UserProFile%\AppData\LocalLow\QQMiniDL"2>NUL
rd/s/q "%AllUsersProfile%\Application Data\QQPet"2>NUL
rd/s/q "%UserProfile%\AppData\Local\Tencent\QQPet"2>NUL
rd/s/q "%USERPROFILE%\Local Settings\Tencent\QQPet"2>NUL
rd/s/q "%USERPROFILE%\Local Settings\QQKartLiveUpdate"2>NUL
rd/s/q "%UserProfile%\Documents\Tencent Files\QPlus"   2>NUL
rd/s/q "%UserProfile%\My Documents\Tencent Files\QPlus"2>NUL
rd/s/q "%AllUsersProfile%\Application Data\Tencent\QQProtect"2>NUL
reg delete HKLM\SYSTEM\CurrentControlSet\services\QQProtect /F>NUL 2>NUL
rd/s/q "%CommonProgramFiles%\Tencent\QQProtect"2>NUL
rd/s/q "%CommonProgramFiles(x86)%\Tencent\QQProtect"2>NUL
for /f "skip=2 tokens=3 delims= " %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v personal') do (
       for /f "delims=*" %%j in ('echo %%i') do rd/s/q "%%j\Tencent Files\All Users\QQ\Misc\OperateFace" 2>NUL)
:: 占用后禁止生成
md  "%AppData%\Tencent\QQ\Misc\CSC\2052\7"2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\9">NUL 2>NUL
md "%AppData%\Tencent\QQ\Misc\CSC\2052\13">NUL 2>NUL
echo.banner>"%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" 2>NUL
echo.superQQ>"%AppData%\Tencent\QQ\Misc\com.tencent.wireless"  2>NUL
echo.NoTipLink> "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18"2>NUL
echo.ClientType> "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18"2>NUL
Attrib +r  "%AppData%\Tencent\QQ\Misc\CSC\2052\7\4" >NUL 2>NUL
Attrib +r  "%AppData%\Tencent\QQ\Misc\CSC\2052\7\5" >NUL 2>NUL
Attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\13\7" >NUL 2>NUL
Attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\9\18" >NUL 2>NUL
Attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\13\16" >NUL 2>NUL
Attrib +r "%AppData%\Tencent\QQ\Misc\CSC\2052\7\21" >NUL 2>NUL
Attrib +r  "%AppData%\Tencent\QQ\Misc\com.tencent.wireless" >NUL 2>NUL
CLS & ECHO.&ECHO 清理后台相关文件及注册残留完成，任意键返回！&PAUSE >NUL 2>NUL & CLS & GOTO MENU
:Cleanother
@ echo.
ECHO 清理无用文件中..请稍等..
del /s/f/q "*.tvl">NUL 2>NUL
del /s/f/q "*.tsd">NUL 2>NUL
:: InstallNews
del /s/f/q "Misc\InstallNews.xml">NUL 2>NUL
:: BrSelfExp
del /s/f/q "Misc\BrSelfExp">NUL 2>NUL
:: QScan
del /s/f/q "Misc\QScan">NUL 2>NUL
:: 自动更新
del /s/f/q "AuI18N">NUL 2>NUL
:: 无用文件
del /s/f/q "ShellExt">NUL 2>NUL
:: QQ更新
del /s/f/q "txupd.exe">NUL 2>NUL
:: TIM推广
del /s/f/q "Timsh.exe">NUL 2>NUL
:: 新版本更新介绍
del /s/f/q "QQWhatsnew.txt">NUL 2>NUL
:: 卸载QQ
del /s/f/q "QQUninst.exe">NUL 2>NUL
:: QQ协议
del /s/f/q "QQLicense.rtf">NUL 2>NUL
:: Bin内无用文件
:: QQ许可
del /s/f/q "Bin\LICENSE">NUL 2>NUL
:: QQ流氓软件下载工具
del /s/f/q "Bin\SetupEx">NUL 2>NUL
:: 腾讯IP库(无用)
del /s/f/q "Bin\TSIP.DAT">NUL 2>NUL
:: QQ注册右键表情
del /s/f/q "Bin\AddEmotion.htm">NUL 2>NUL
:: QQ校验
del /s/f/q "Bin\Applaunch.prf">NUL 2>NUL
:: QQ高清摄像头驱动
del /s/f/q "Bin\ABL.sys">NUL 2>NUL
del /s/f/q "Bin\PBL.sys">NUL 2>NUL
:: 自动更新
del /s/f/q "Bin\auclt.exe">NUL 2>NUL
:: QQ应用宝
del /s/f/q "Bin\maLauncher.exe">NUL 2>NUL
del /s/f/q "Bin\maUpdat.exe">NUL 2>NUL
del /s/f/q "Bin\maMainFrame.rdb">NUL 2>NUL
del /s/f/q "Bin\maMainFrame.tpc">NUL 2>NUL
del /s/f/q "Bin\maJmp.dll">NUL 2>NUL
del /s/f/q "Bin\maMainFrame.dll">NUL 2>NUL
del /s/f/q "Bin\maUtility.dll">NUL 2>NUL
:: 上报文件
del /s/f/q "Bin\QPerfHelper.exe">NUL 2>NUL
del /s/f/q "Bin\QScanEngine.dll">NUL 2>NUL
del /s/f/q "Bin\QPerfMon.dll">NUL 2>NUL
:: QQ电脑管家
del /s/f/q "Bin\QQPcmgrDownload.exe">NUL 2>NUL
:: QQ安全中心
del /s/f/q "Bin\QQSafeUD.exe">NUL 2>NUL
@echo off
for /f "delims=" %%i in ('dir /ad /b /s^|sort /r') do rd /q "%%i" 2>NUL
CLS & ECHO.&ECHO 清除无用文件完成，任意键返回！&PAUSE >NUL 2>NUL & CLS & GOTO MENU
:CleanBAK
@ echo.
ECHO 　　　正在清除BAK备份文件中..请稍等..
del /s/f/q "*.bak">NUL 2>NUL
CLS & ECHO.&ECHO 清除BAK备份文件完成，任意键返回！&PAUSE >NUL 2>NUL & CLS & GOTO MENU
