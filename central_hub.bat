@echo off
SETLOCAL

REM PowerShell script to create a GUI for the automation hub.
set "psCommand="""
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Automation Hub'
$form.Size = New-Object System.Drawing.Size(400, 500)
$form.StartPosition = 'CenterScreen'

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Text = 'Select a task to automate:'
$label.Location = New-Object System.Drawing.Point(20, 20)
$label.AutoSize = $true
$form.Controls.Add($label)

# Function to create a button
function Create-Button($text, $yPos, $scriptName) {
    $button = New-Object System.Windows.Forms.Button
    $button.Text = $text
    $button.Location = New-Object System.Drawing.Point(40, $yPos)
    $button.Size = New-Object System.Drawing.Size(300, 40)
    $button.Add_Click({ 
        Start-Process -FilePath 'cmd.exe' -ArgumentList '/c .\automation\'"""$scriptName"""''
    })
    $form.Controls.Add($button)
}

# Create buttons for each script
Create-Button '1. Add Files to Inbox' 50 'add_to_inbox.bat'
Create-Button '2. Create New Project' 100 'manage_projects.bat'
Create-Button '3. Create Resource Note' 150 'create_resource_note.bat'
Create-Button '4. Setup New University Course' 200 'setup_new_course.bat'
Create-Button '5. Quick Capture Note' 250 'quick_capture.bat'
Create-Button '6. Archive a Project' 300 'archive_project.bat'
Create-Button '7. Start Weekly Review' 350 'weekly_review.bat'
Create-Button '8. Backup Workspace' 400 'backup_workspace.bat'

# Show the form
$form.ShowDialog() | Out-Null

"""

powershell -NoProfile -ExecutionPolicy Bypass -Command %psCommand%
