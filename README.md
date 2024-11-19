# ffmpeg-unix-socket-bug
To reproduce the bug, simply run `./test.sh` 

`test.sh` will write `sample2.wav` to the Unix Domain Socket, from which Ffmpeg will read as input.

The resulting output is missing 65536 bytes of data when compared to the same ffmpeg command that uses the original file as input
