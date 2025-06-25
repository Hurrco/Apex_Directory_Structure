@echo off
SETLOCAL

REM Set the paths for active and archived projects
set "activePath=02_PROJECTS\_ACTIVE"
set "archivedPath=02_PROJECTS\_ARCHIVED"

REM Use PowerShell to display a folder browser dialog.
set "psCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    Add-Type -AssemblyName System.windows.forms; 
    $dialog = New-Object System.Windows.Forms.FolderBrowserDialog; 
    $dialog.Description = 'Select a project to archive'; 
    $dialog.SelectedPath = '%cd%\%activePath%'; 
    if ($dialog.ShowDialog() -eq 'OK') { 
        return $dialog.SelectedPath; 
    } 
}""""

for /f "delims=" %%I in ('%psCommand%') do set "projectPath=%%I"

if not defined projectPath (
    echo No project was selected.
    goto :eof
)

REM Move the selected project folder to the archive.
echo Moving project to archive...
move "%projectPath%" "%archivedPath%\"

REM Use PowerShell to show a toast notification confirming the action.
set "psToastCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; 
    $template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; 
    $toastXml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template); 
    $toastXml.GetElementsByTagName('text')[0].AppendChild($toastXml.CreateTextNode('Project Archived')) > $null; 
    $toastXml.GetElementsByTagName('text')[1].AppendChild($toastXml.CreateTextNode('The selected project has been moved to the archive.')) > $null; 
    $toast = [Windows.UI.Notifications.ToastNotification]::new($toastXml); 
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Apex.Directory.Structure').Show($toast); 
}""""

%psToastCommand%

echo.
echo Done.
pause
