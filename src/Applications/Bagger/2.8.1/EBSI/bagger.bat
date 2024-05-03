@rem ##########################################################################
@rem
@rem  EBSI
@rem
@rem ##########################################################################
@ECHO OFF

SET Dapp.home=%USERPROFILE%\bagger
MKDIR %Dapp.home%

SET JAVA_HOME=%~dp0\jre1.7.0_80


@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  bagger startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

REM set DIRNAME=%~dp0
REM if "%DIRNAME%" == "" set DIRNAME=.
REM set APP_BASE_NAME=%~n0
set APP_HOME=%~dp0

@rem Add default JVM options here. You can also use JAVA_OPTS and BAGGER_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=C:/Progra~2/Java/jre7/bin/java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
REM set JAVA_EXE=%JAVA_HOME%/bin/java.exe
set JAVA_EXE=%JAVA_HOME%\bin\java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windowz variants

if not "%OS%" == "Windows_NT" goto win9xME_args
if "%@eval[2+2]" == "4" goto 4NT_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*
goto execute

:4NT_args
@rem Get arguments from the 4NT Shell from JP Software
set CMD_LINE_ARGS=%$

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\bagger-2.8.1.jar;%APP_HOME%\lib\spring-richclient-vldocking-1.1.0.jar;%APP_HOME%\lib\bagger-core-2.8.1.jar;%APP_HOME%\lib\bagger-business-2.8.1.jar;%APP_HOME%\lib\spring-richclient-jdk5-1.0.0.jar;%APP_HOME%\lib\spring-boot-starter-logging-1.3.2.RELEASE.jar;%APP_HOME%\lib\vldocking-2.1.4.jar;%APP_HOME%\lib\spring-richclient-docking-1.0.0.jar;%APP_HOME%\lib\spring-richclient-sandbox-1.0.0.jar;%APP_HOME%\lib\spring-richclient-jdk6-1.0.0.jar;%APP_HOME%\lib\spring-richclient-support-1.0.0.jar;%APP_HOME%\lib\forms-1.0.7.jar;%APP_HOME%\lib\nachocalendar-0.23.jar;%APP_HOME%\lib\groovy-all-2.4.12.jar;%APP_HOME%\lib\spring-richclient-resources-1.0.0.jar;%APP_HOME%\lib\spring-richclient-binding-1.0.0.jar;%APP_HOME%\lib\spring-richclient-core-1.0.0.jar;%APP_HOME%\lib\swingx-0.9.3.jar;%APP_HOME%\lib\looks-2.0.4.jar;%APP_HOME%\lib\bagit-4.12.3.jar;%APP_HOME%\lib\spring-web-2.5.1.jar;%APP_HOME%\lib\spring-binding-1.0.jar;%APP_HOME%\lib\spring-context-2.5.1.jar;%APP_HOME%\lib\spring-beans-2.5.1.jar;%APP_HOME%\lib\spring-core-2.5.1.jar;%APP_HOME%\lib\json-20151123.jar;%APP_HOME%\lib\logback-classic-1.1.3.jar;%APP_HOME%\lib\jcl-over-slf4j-1.7.13.jar;%APP_HOME%\lib\jul-to-slf4j-1.7.13.jar;%APP_HOME%\lib\log4j-over-slf4j-1.7.13.jar;%APP_HOME%\lib\httpmime-4.3.2.jar;%APP_HOME%\lib\httpclient-4.3.2.jar;%APP_HOME%\lib\spring-richclient-form-1.0.0.jar;%APP_HOME%\lib\commons-logging-1.1.3.jar;%APP_HOME%\lib\slf4j-api-1.7.13.jar;%APP_HOME%\lib\commons-compress-1.8.1.jar;%APP_HOME%\lib\commons-logging-api-1.1.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\jsap-2.1.jar;%APP_HOME%\lib\dom4j-1.6.1.jar;%APP_HOME%\lib\commons-net-3.3.jar;%APP_HOME%\lib\commons-exec-1.2.jar;%APP_HOME%\lib\jaxen-1.1.4.jar;%APP_HOME%\lib\classworlds-1.1.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\commons-collections-3.1.jar;%APP_HOME%\lib\logback-core-1.1.3.jar;%APP_HOME%\lib\httpcore-4.3.1.jar;%APP_HOME%\lib\xml-apis-1.0.b2.jar;%APP_HOME%\lib\ognl-2.6.9.jar

@rem Execute bagger
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% -Dapp.home=%Dapp.home% %BAGGER_OPTS% -classpath "%CLASSPATH%" gov.loc.repository.bagger.BaggerApplication %CMD_LINE_ARGS%
REM "%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% -Dapp.home="%APP_HOME%" %BAGGER_OPTS%  -classpath "%CLASSPATH%" gov.loc.repository.bagger.BaggerApplication --spring.config.location=file:"%APP_HOME%/config/application.properties" %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
pause

rem Set variable BAGGER_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%BAGGER_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
