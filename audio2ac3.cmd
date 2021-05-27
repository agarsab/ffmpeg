@echo off
:: Use ffmpeg to convert any audio stream to Dolby Digital or AC-3
:: ffmpeg.exe has to be in the same directory or in PATH environment variable

set input_file=%1
set output_file=%~n1[AC3]%~x1

IF EXIST %input_file% (
    ffmpeg.exe -hide_banner -i %input_file% -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k "%output_file%"
) ELSE (
    echo Usage: %0 input_file_name.ext
    echo Error: File %input_file% not foud
)
