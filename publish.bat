@echo off
setlocal EnableExtensions DisableDelayedExpansion

rem Always publish this checkout, regardless of the caller's working directory.
pushd "%~dp0"
if errorlevel 1 exit /b 1
set "publish_exit_code=1"
set "publish_branch="
set "publish_message="

rem Accept both a quoted message and the original unquoted multi-word form.
:message_args
if "%~1"=="" goto message_ready
if defined publish_message (
  set "publish_message=%publish_message% %~1"
) else (
  set "publish_message=%~1"
)
shift
goto message_args

:message_ready
if not defined publish_message set "publish_message=Update website"

git.exe rev-parse --show-toplevel >nul 2>&1
if errorlevel 1 (
  echo Publish failed: the script must be inside the website repository.
  goto finish
)
for /f "delims=" %%B in ('git.exe branch --show-current') do set "publish_branch=%%B"
if not "%publish_branch%"=="master" (
  echo Publish failed: this website must be on master. No branch was changed.
  goto finish
)
git.exe remote get-url origin >nul 2>&1
if errorlevel 1 (
  echo Publish failed: the origin remote is not configured.
  goto finish
)

rem Do not turn an unfinished merge, rebase, or cherry-pick into a publish commit.
for %%S in (MERGE_HEAD REBASE_HEAD CHERRY_PICK_HEAD REVERT_HEAD) do (
  git.exe rev-parse -q --verify %%S >nul 2>&1
  if not errorlevel 1 (
    echo Publish failed: finish the current Git operation first.
    goto finish
  )
)
for /f "delims=" %%U in ('git.exe ls-files --unmerged') do (
  echo Publish failed: resolve the unmerged files first.
  goto finish
)

rem Preserve the existing workflow: include new files and deletions in this checkout.
echo Staging website changes, including untracked files...
git.exe status --short
git.exe add --all -- .
if errorlevel 1 (
  echo Publish failed while staging changes.
  set "publish_exit_code=2"
  goto finish
)
git.exe diff --cached --check
if errorlevel 1 (
  echo Publish failed: fix the reported whitespace errors. Staged changes are preserved.
  set "publish_exit_code=3"
  goto finish
)

rem A clean index may still have local commits to push; avoid an empty commit.
git.exe diff --cached --quiet
if errorlevel 2 (
  echo Publish failed while checking staged changes.
  set "publish_exit_code=3"
  goto finish
)
if errorlevel 1 (
  git.exe commit -m "%publish_message%"
  if errorlevel 1 (
    echo Publish failed while committing. Staged changes are preserved.
    set "publish_exit_code=4"
    goto finish
  )
) else (
  echo No new file changes to commit.
)

rem Push only this website's integration branch. Rejection must not trigger a pull or merge.
echo Pushing master to origin...
git.exe push origin HEAD:refs/heads/master
if errorlevel 1 (
  echo Publish failed while pushing. Local commits are preserved.
  echo Fetch and reconcile the remote changes manually, then run publish.bat again.
  set "publish_exit_code=5"
  goto finish
)
echo Published successfully.
set "publish_exit_code=0"
goto finish

:finish
popd
exit /b %publish_exit_code%
