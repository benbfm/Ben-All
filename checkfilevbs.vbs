/*
*check if html file existing in source then open with chrome in full screen mode
*auto-play music in html
*/
Dim wshShell,sapi ,fso, sourceFolder, destinationFolder, sourceFile,message
set wshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
message ="有OEM订单 请按要求打包"
sourceFolder = "\\ip\shared\Mat_Initiative Planning\26 PDIDB\"
destinationFolder = "C:\temp\"
sourceFile = "dd13.html" 
If fso.FileExists(sourceFolder&sourceFile) Then
   fso.CopyFile sourceFolder&sourceFile, destinationFolder,1
wshShell.Run "TaskKill /f /im chrome.exe",0,True
wshShell.Run "chrome.exe --start-fullscreen --autoplay-policy=no-user-gesture-required c:\temp\dd13.html"
WScript.Sleep 1000
fso.DeleteFile  sourceFolder&sourceFile
for i=1 to 3
Set sapi=CreateObject("sapi.spvoice")
sapi.Speak message  
sapi.WaitUntilDone 10000
WScript.Sleep 1000
next
End If
Set fso = Nothing
