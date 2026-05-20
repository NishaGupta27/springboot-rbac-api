@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script for Windows
@REM
@REM Required ENV vars:
@REM JAVA_HOME - location of a JDK home dir
@REM
@REM Optional ENV vars
@REM M2_HOME - location of maven's installed home (default is your unzipped maven download).
@REM MAVEN_BATCH_ECHO - set to 'on' to enable the echoing of the batch commands
@REM MAVEN_BATCH_PAUSE - set to 'on' to wait for a keystroke before ending
@REM MAVEN_OPTS - parameters passed to the Java VM when running Maven
@REM     e.g. to debug Maven itself, use
@REM set MAVEN_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=8000
@REM MAVEN_SKIP_RC - flag to disable loading of mavenrc files
@REM
@REM BEGIN INITIALIZATION
@REM ===========================================================================

@setlocal

set ERROR_CODE=0

@REM To isolate internal variables from possible post scripts, we use another setlocal
@setlocal

@REM ===========================================================================
@REM Maven initialization, location of the Maven home, checks for the JAVA_HOME
@REM ===========================================================================

if not "%JAVA_HOME%" == "" goto OkJHome

echo.
echo Error: JAVA_HOME not found in your environment. >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

:OkJHome
if exist "%JAVA_HOME%\bin\java.exe" goto init

echo.
echo Error: JAVA_HOME is set to an invalid directory. >&2
echo JAVA_HOME = "%JAVA_HOME%" >&2
echo Please set the JAVA_HOME variable in your environment to match the >&2
echo location of your Java installation. >&2
echo.
goto error

@REM ===========================================================================
@REM Find the project base dir, i.e. the directory that contains the folder ".mvn".
@REM Fallback to current working directory if not found.

set MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
IF "%MAVEN_PROJECTBASEDIR%"=="" (
set MAVEN_PROJECTBASEDIR=%CD%
)

@REM ===========================================================================
@REM Provide default value for MAVEN_HOME if not already set
@REM ===========================================================================

IF "%M2_HOME%"=="" (
  set "M2_HOME=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper"
  if not "%MAVEN_PROJECTBASEDIR%"=="" (
    cd /d "%MAVEN_PROJECTBASEDIR%"
  )
)

if "%MAVEN_SKIP_RC%" == "" goto runRcPre
@REM Skip the set of variables that have been already defined.
goto runRcPost
:runRcPre
@setlocal
@for /F "usebackq delims== tokens=1,2" %%A in ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") do set "JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%A"
:runRcPost
@endlocal & set "JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%"

:skipRcPre
@REM ===========================================================================
@REM Maven start up batch file, in Windows create this file and execute it with "cmd /c call mvnw"
@REM check for post script, e.g. mvnw.cmd, to run after Maven
@REM ===========================================================================

@setlocal

set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain
set WRAPPER_PROPERTIES_PATH="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties"
set MAVEN_PROJECTBASEDIR=%cd%

cd /d "%EXEC_DIR%"

@REM Provide default value for MAVEN_HOME if not already set
if "%M2_HOME%"=="" (
  set "M2_HOME=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper"
)

@REM Provide default value for MAVEN_OPTS if not already set
if "%MAVEN_OPTS%"=="" (
  set "MAVEN_OPTS=-Xmx1024m"
)

@REM Find java.exe
if "%JAVA_HOME%"=="" (
  set "JAVACMD=java"
) else (
  set "JAVACMD=%JAVA_HOME%\bin\java.exe"
)

if not exist "%JAVACMD%" (
  echo.
  echo Error: JAVA_HOME is not defined correctly.
  echo We cannot execute %JAVACMD%
  echo.
  goto error
)

@REM ===========================================================================
@REM Use the Java_Home in the env as the default.
@REM ===========================================================================

setlocal enabledelayedexpansion

for /F "usebackq delims=" %%a in ("%WRAPPER_PROPERTIES_PATH%") do (
  if "%%a" not equ "" (
    set "line=%%a"
    if not "!line:~0,1!"=="#" (
      set "!line!"
    )
  )
)

set MAVEN_JAVA_EXE="%JAVA_HOME%\bin\java.exe"
set WRAPPER_JAR_ECHO=%WRAPPER_JAR:"=%
for /F "tokens=1,2 delims==" %%a in ("%WRAPPER_PROPERTIES_PATH%") do (
    if "%%a"=="distributionUrl" (
        set WRAPPER_URL=%%b
    )
)

cd /d "%MAVEN_PROJECTBASEDIR%"

%MAVEN_JAVA_EXE% ^
  -classpath %WRAPPER_JAR_ECHO% ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" ^
  %MAVEN_OPTS% ^
  %MAVEN_ARGS% ^
  %* 
if %ERRORLEVEL% neq 0 (
  echo.
  echo Build failed with exit code %ERRORLEVEL%.
  echo.
  goto error
)

goto end

:error
set ERROR_CODE=1

:end
@endlocal & set ERROR_CODE=%ERROR_CODE%

if not "%MAVEN_SKIP_RC%"=="" @goto skipRcPost
@REM check for post script, e.g. mvnw.cmd, to run after Maven
@if exist "%MAVEN_PROJECTBASEDIR%\mvnw.cmd" (
  call "%MAVEN_PROJECTBASEDIR%\mvnw.cmd" %*
) else (
  %COMSPEC% /c "exit /b %ERROR_CODE%"
)

if %ERRORLEVEL% neq 0 goto error

goto end
:skipRcPost
if "%MAVEN_SKIP_RC%"=="" @endlocal & cmd /c exit /b %ERROR_CODE%
@endlocal & cmd /c exit /b %ERROR_CODE%
