@echo off

:git_add
  echo adding all files..
  call git.exe add --all .
  if %errorlevel% NEQ 0 echo add failed. & pause & exit /B 1

:git_commit
  set "msg=%*"
  if "%msg%"=="" set "msg=updated."
  echo commiting..
  call git.exe commit -m "%msg%"
  set "msg="
  if %errorlevel% NEQ 0 pause & exit /B 2

:git_push
  echo pushing..
  call git.exe push
  if %errorlevel% NEQ 0 (
    echo push failed.
    echo trying pull first.
    call git.exe pull
    if %errorlevel% NEQ 0 echo pull failed. & pause & exit /B 3
    echo pushing again..
    call git.exe push
    if %errorlevel% NEQ 0 echo push failed. & pause & exit /B 4
  )

:end
  echo done.
  exit /B

