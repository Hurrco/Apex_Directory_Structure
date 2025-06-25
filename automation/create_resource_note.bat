@echo off
SETLOCAL

set "resourcesPath=04_RESOURCES\41_KNOWLEDGE_BANK"

:menu
cls
echo =================================================
echo            Create a New Resource Note
echo =================================================
echo.
echo Select a category for your new note:
echo 1. Articles and Papers
echo 2. Books
echo 3. Courses
echo 4. IT Research
echo 5. Quotes and Snippets
echo 6. Exit
echo.

set /p "choice=Enter your choice (1-6): "

if "%choice%"=="1" set "category=ARTICLES_AND_PAPERS" & goto create_note
if "%choice%"=="2" set "category=BOOKS" & goto create_note
if "%choice%"=="3" set "category=COURSES" & goto create_note
if "%choice%"=="4" set "category=IT_RESEARCH" & goto create_note
if "%choice%"=="5" set "category=QUOTES_AND_SNIPPETS" & goto create_note
if "%choice%"=="6" goto :eof

echo Invalid choice. Please try again.
pause
goto menu

:create_note
cls
echo --- Creating a new note in %category% ---
echo.
set /p "filename=Enter a filename for your note (without extension): "

set "fullPath=%resourcesPath%\%category%\%filename%.md"

if exist "%fullPath%" (
    echo.
    echo A file with that name already exists.
    pause
    goto menu
)

echo # %filename% > "%fullPath%"
echo. >> "%fullPath%"
echo Date: %date% >> "%fullPath%"

start "" "%fullPath%"

echo.
echo Note created and opened successfully!
pause
goto menu
