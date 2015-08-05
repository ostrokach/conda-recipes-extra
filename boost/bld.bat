setlocal enableextensions

if %PY3K% EQU 1 (
    set MSVC_VER="10.0"
) else (
    set MSVC_VER="9.0"
)

if %ARCH% EQU 32 (
    call "%VCINSTALLDIR%\vcvarsall.bat" x86
	set EXTRA_ARGS=""
)
if %ARCH% EQU 64 (
    call "%VCINSTALLDIR%\vcvarsall.bat" x64
	set EXTRA_ARGS="address-model=64"
)

python -c "from __future__ import print_function; import distutils.sysconfig; print(distutils.sysconfig.get_python_inc(True))" > temp.txt
set /p PYTHON_INCLUDE_DIR=<temp.txt

call bootstrap.bat

bjam.exe --debug-configuration ^
         --user-config="%RECIPE_DIR%/user-config-win.jam" ^
		 -sBZIP2_LIBPATH="%LIBRARY_LIB%" -sBZIP2_INCLUDE="%LIBRARY_INC%" -sBZIP2_BINARY=bzip2 ^
		 -sZLIB_INCLUDE="%LIBRARY_INC%" -sZLIB_LIBPATH="%LIBRARY_LIB%" -sZLIB_BINARY=zlib ^
		 link=shared toolset="msvc-%MSVC_VER%" %EXTRA_ARGS% stage

robocopy "stage\lib" "%LIBRARY_LIB%" /E /NFL
robocopy "boost" "%LIBRARY_INC%\boost" /E /NFL /NDL

exit 0