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
)

@REM ===========================================================================
@REM Find java.exe
@REM ===========================================================================

if "%JAVA_HOME%"=="" (
  set "JAVACMD=java"
) else (
  if exist "%JAVA_HOME%\bin\java.exe" (
    set "JAVACMD=%JAVA_HOME%\bin\java.exe"
  ) else (
    echo Error: JAVA_HOME is set to an invalid directory.
    echo JAVA_HOME = "%JAVA_HOME%"
    echo Please set the JAVA_HOME variable in your environment to match the
    echo location of your Java installation.
    echo.
    goto error
  )
)

@REM ===========================================================================
@REM Get Maven wrapper jar and properties
@REM ===========================================================================

set WRAPPER_JAR=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar
set WRAPPER_PROPERTIES=%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.properties

@REM ===========================================================================
@REM Download Maven wrapper if it doesn't exist
@REM ===========================================================================

if not exist "%WRAPPER_JAR%" (
  echo Downloading Maven wrapper...
  powershell -Command "& {'%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\MavenWrapperDownloader.exe'}"
  if %ERRORLEVEL% neq 0 (
    echo Error downloading Maven wrapper
    goto error
  )
)

@REM ===========================================================================
@REM Run Maven
@REM ===========================================================================

"%JAVACMD%" ^
  -classpath "%WRAPPER_JAR%" ^
  "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" ^
  %MAVEN_OPTS% ^
  org.apache.maven.wrapper.MavenWrapperMain %*

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
@endlocal & exit /b %ERROR_CODE%
