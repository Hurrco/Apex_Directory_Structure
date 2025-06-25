@echo off
SETLOCAL

REM Define the name of the backup file with a timestamp.
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set "timestamp=%datetime:~0,8%_%datetime:~8,6%"
set "backupName=Apex_Directory_Backup_%timestamp%.zip"
set "desktopPath=%USERPROFILE%\Desktop"

echo =================================================
echo            Backup Workspace
echo =================================================
echo.
echo This script will create a .zip archive of your entire workspace.

echo.
echo Backup file will be saved as:
echo %backupName%
echo.
pause

REM Use PowerShell to create a compressed archive.
set "psCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    Compress-Archive -Path '.\*' -DestinationPath '%desktopPath%\%backupName%' -Force; 
}""""

echo Creating backup... Please wait.
%psCommand%

REM Use PowerShell to show a toast notification confirming the action.
set "psToastCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; 
    $template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; 
    $toastXml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template); 
    $toastXml.GetElementsByTagName('text')[0].AppendChild($toastXml.CreateTextNode('Backup Complete')) > $null; 
    $toastXml.GetElementsByTagName('text')[1].AppendChild($toastXml.CreateTextNode('Your workspace has been backed up to the desktop.')) > $null; 
    $toast = [Windows.UI.Notifications.ToastNotification]::new($toastXml); 
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Apex.Directory.Structure').Show($toast); 
}""""

%psToastCommand%

echo.
echo Backup complete! The file has been saved to your desktop.
pause
