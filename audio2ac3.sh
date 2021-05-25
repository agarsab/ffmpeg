# Extract all streams and convert audio streams to AC3 or Dolby Digital
# $1 input file
# $2 output file
ffmpeg -i $1 -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k $2
