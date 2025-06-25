@echo off
SETLOCAL

echo =================================================
echo            Starting Weekly Review
echo =================================================
echo.
echo This script will open the key folders for your weekly review.
echo.
pause

REM Open the main folders for review
echo Opening Inbox...
start "" "00_INBOX\_TO_PROCESS"
start "" "00_INBOX\_STAGING"

echo Opening Active Projects...
start "" "02_PROJECTS\_ACTIVE"

echo Opening Active Goals...
start "" "01_HORIZONS\20_GOALS\_ACTIVE"

REM Use PowerShell to show a toast notification with a reminder
set "psToastCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; 
    $template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; 
    $toastXml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template); 
    $toastXml.GetElementsByTagName('text')[0].AppendChild($toastXml.CreateTextNode('Weekly Review Started')) > $null; 
    $toastXml.GetElementsByTagName('text')[1].AppendChild($toastXml.CreateTextNode('Your key folders are now open. Remember to clear your inbox, review your projects, and check on your goals.')) > $null; 
    $toast = [Windows.UI.Notifications.ToastNotification]::new($toastXml); 
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Apex.Directory.Structure').Show($toast); 
}""""

%psToastCommand%

echo.
echo Your weekly review folders have been opened.
echo.
pause
