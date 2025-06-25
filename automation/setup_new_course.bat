@echo off
SETLOCAL

set "educationPath=03_AREAS\33_LEARNING_AND_SKILLS\FORMAL_EDUCATION"

cls
echo =================================================
echo            Setup New University Course
echo =================================================
echo.

set /p "year=Enter the academic year (e.g., 2024-2025): "
set /p "course=Enter the course code (e.g., CS101): "

if not defined year (
    echo Academic year cannot be empty.
    pause
    exit /b
)

if not defined course (
    echo Course code cannot be empty.
    pause
    exit /b
)

set "coursePath=%educationPath%\%year%\%course%"

echo.
echo Creating course structure at: %coursePath%

md "%coursePath%\Lectures"
md "%coursePath%\Readings"
md "%coursePath%\Labs"
md "%coursePath%\Assignments"
md "%coursePath%\Notes"

echo # %course% - %year% > "%coursePath%\README.md"

REM Use PowerShell to show a toast notification confirming the action.
set "psToastCommand=powershell -NoProfile -ExecutionPolicy Bypass -Command """& { 
    [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; 
    $template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02; 
    $toastXml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template); 
    $toastXml.GetElementsByTagName('text')[0].AppendChild($toastXml.CreateTextNode('Course Structure Created')) > $null; 
    $toastXml.GetElementsByTagName('text')[1].AppendChild($toastXml.CreateTextNode('The folder structure for %course% has been created.')) > $null; 
    $toast = [Windows.UI.Notifications.ToastNotification]::new($toastXml); 
    [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('Apex.Directory.Structure').Show($toast); 
}""""

%psToastCommand%

echo.
echo Course structure created successfully!
pause
