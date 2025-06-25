@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Set the base path for projects
set "PROJECTS_PATH=02_PROJECTS\_ACTIVE"

:menu
cls
echo =================================================
echo            Create a New Project
echo =================================================
echo.
echo Select the type of project to create:
echo 1. Commissioned Project (for a client)
echo 2. University Project
echo 3. Personal Project
echo 4. Exit
echo.

set /p "choice=Enter your choice (1-4): "

if "%choice%"=="1" goto commissioned
if "%choice%"=="2" goto university
if "%choice%"=="3" goto personal
if "%choice%"=="4" goto :eof

echo Invalid choice. Please try again.
pause
goto menu

:commissioned
cls
echo --- Creating a new Commissioned Project ---
echo.
set /p "client=Enter the client's name: "
set /p "name=Enter the project's name: "

set "PROJECT_NAME=COMMISSIONED_!client!_!name!"
set "FULL_PATH=%PROJECTS_PATH%\!PROJECT_NAME!"

echo.
echo Creating project directory: !FULL_PATH!
md "!FULL_PATH!"

REM Create subdirectories for commissioned projects
md "!FULL_PATH!\0_Brief_and_Goals"
md "!FULL_PATH!\1_Research_and_Data"
md "!FULL_PATH!\2_Work_In_Progress"
md "!FULL_PATH!\3_Feedback_and_Revisions"
md "!FULL_PATH!\4_Final_Deliverables"

echo # !PROJECT_NAME! > "!FULL_PATH!\README.md"
echo. >> "!FULL_PATH!\README.md"
echo Client: !client! >> "!FULL_PATH!\README.md"
echo Project: !name! >> "!FULL_PATH!\README.md"

echo.
echo Commissioned project created successfully!
pause
goto menu

:university
cls
echo --- Creating a new University Project ---
echo.
set /p "course=Enter the course code (e.g., CS101): "
set /p "name=Enter the project's name: "

set "PROJECT_NAME=UNI_!course!_!name!"
set "FULL_PATH=%PROJECTS_PATH%\!PROJECT_NAME!"

echo.
echo Creating project directory: !FULL_PATH!
md "!FULL_PATH!"

echo # !PROJECT_NAME! > "!FULL_PATH!\README.md"
echo. >> "!FULL_PATH!\README.md"
echo Course: !course! >> "!FULL_PATH!\README.md"
echo Project: !name! >> "!FULL_PATH!\README.md"

echo.
echo University project created successfully!
pause
goto menu

:personal
cls
echo --- Creating a new Personal Project ---
echo.
set /p "name=Enter the project's name: "

set "PROJECT_NAME=PERSONAL_!name!"
set "FULL_PATH=%PROJECTS_PATH%\!PROJECT_NAME!"

echo.
echo Creating project directory: !FULL_PATH!
md "!FULL_PATH!"

echo # !PROJECT_NAME! > "!FULL_PATH!\README.md"

echo.
echo Personal project created successfully!
pause
goto menu
