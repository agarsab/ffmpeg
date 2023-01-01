@echo off
::================================================================
:: AUTHOR        Angel Garcia-Galan (angelgs@gmail.com)
:: LICENSE       European Union Public Licence (EUPL)
::               https://joinup.ec.europa.eu/collection/eupl/
:: SOURCE        https://github.com/agarsab/ffmpeg
:: FUNCTION      Use ffmpeg to convert any audio stream to Dolby Digital or AC-3
:: NOTES         ffmpeg.exe has to be in the same directory or in PATH environment variable
::               Tested in Microsoft Windows 10
:: ARGUMENTS     -f filename
::               -d foldername
:: VERSION       2023-01-01
#================================================================

if /I "%~1" == "-f" goto File
if /I "%~1" == "-d" goto Directory

:Usage
echo Usage: %0 -f filename.ext
echo Usage: %0 -d foldername
exit /b 1

:File
set input_file=%2
set output_file=%~n2[AC3]%~x2
if exist %input_file% (
    ffmpeg.exe -hide_banner -i %input_file% -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k "%output_file%"
    exit /b 0
) else (
    echo Error: File %input_file% not foud
    exit /b 2)

:Directory
forfiles /p %2 /c "cmd /c ffmpeg.exe -hide_banner -i @file -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k @fname[AC3].@ext"
exit /b 0
