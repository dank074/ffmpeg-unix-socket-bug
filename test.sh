#!/bin/bash
file1="expectedOutput.wav"
file2="actualOutput.wav"

input="sample2.wav"

# output sample wav file to unix domain socket 
socat - UNIX-LISTEN:"./example.sock" < $input &

# create expected output by using regular sample file as input
ffmpeg -i $input -c:a copy -f wav $file1

# now use unix domain socket as input
ffmpeg -i unix:./example.sock -c:a copy -f wav $file2

# compare the expected vs actual output files
if cmp -s "$file1" "$file2"; then
    printf 'The file "%s" is the same as "%s"\n' "$file1" "$file2"
else
    printf 'The file "%s" is different from "%s"\n' "$file1" "$file2"
fi

