@echo off
SETLOCAL

REM Use PowerShell to display a file open dialog and capture the selected file paths.
set "psCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    Add-Type -AssemblyName System.windows.forms; 
    $dialog = New-Object System.Windows.Forms.OpenFileDialog; 
    $dialog.Title = 'Select files to add to your Inbox'; 
    $dialog.Multiselect = $true; 
    if ($dialog.ShowDialog() -eq 'OK') { 
        return $dialog.FileNames -join '|'; 
    } 
}""""

for /f "delims=" %%I in ('%psCommand%') do set "filePaths=%%I"

if not defined filePaths (
    echo No files were selected.
    goto :eof
)

REM Define the destination for the files.
set "inboxPath=00_INBOX\_TO_PROCESS"

echo Moving files to %inboxPath%...

REM PowerShell returns paths separated by a pipe '|'. We need to process them in a loop.
REM We will use a little trick with string substitution to loop through the paths.

:move_loop
for /f "tokens=1* delims=|" %%A in ("!filePaths!") do (
    if not "%%A"=="" (
        echo Moving "%%~nxA"
        move "%%A" "%inboxPath%\"
    )
    set "filePaths=%%B"
)

if defined filePaths goto move_loop

REM Use PowerShell to show a toast notification confirming the action.
set "psToastCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; 
    $template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; 
    $toastXml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template); 
    $toastXml.GetElementsByTagName('text')[0].AppendChild($toastXml.CreateTextNode('Files Added to Inbox')) > $null; 
    $toastXml.GetElementsByTagName('text')[1].AppendChild($toastXml.CreateTextNode('The selected files have been moved to your _TO_PROCESS folder.')) > $null; 
    $toast = [Windows.UI.Notifications.ToastNotification]::new($toastXml); 
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Apex.Directory.Structure').Show($toast); 
}""""

%psToastCommand%

echo.
echo Done.
pause
