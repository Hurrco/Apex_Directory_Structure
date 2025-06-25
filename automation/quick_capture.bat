@echo off
SETLOCAL

set "draftsPath=05_OUTPUTS\_DRAFTS_AND_IDEAS"

REM Generate a timestamp for the filename.
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set "timestamp=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%_%datetime:~8,2%-%datetime:~10,2%-%datetime:~12,2%"

set "noteName=QuickNote_%timestamp%.md"
set "fullPath=%draftsPath%\%noteName%"

echo # Quick Note - %timestamp% > "%fullPath%"
echo. >> "%fullPath%"

REM Open the new note in the default Markdown editor.
start "" "%fullPath%"

REM Use PowerShell to show a toast notification.
set "psToastCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; 
    $template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; 
    $toastXml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template); 
    $toastXml.GetElementsByTagName('text')[0].AppendChild($toastXml.CreateTextNode('Quick Note Created')) > $null; 
    $toastXml.GetElementsByTagName('text')[1].AppendChild($toastXml.CreateTextNode('A new note has been created in your drafts folder and is ready for editing.')) > $null; 
    $toast = [Windows.UI.Notifications.ToastNotification]::new($toastXml); 
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Apex.Directory.Structure').Show($toast); 
}""""

%psToastCommand%
