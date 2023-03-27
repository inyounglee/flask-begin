@echo off

set VENV_DIR=.venv
set REQ_TXT=requirements.txt

IF EXIST %VENV_DIR% (
  echo Already is virtualenv
) ELSE (
  set /p=Initializing virtualenv... <nul
  python -m venv .venv
  echo ok
)

timeout /t 1 /nobreak > nul
set /p=Activating virtualenv... <nul
call .\.venv\Scripts\activate

IF %errorlevel% NEQ 0 (
  echo Failed to activate virtualenv
  exit /b 1
)
echo ok

pip install flask

IF EXIST %REQ_TXT% (
  pip install -r %REQ_TXT%
  echo Dependencies installed!
) ELSE (
  echo No dependencies
)
