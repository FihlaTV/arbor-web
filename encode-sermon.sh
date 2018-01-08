#!/usr/bin/env bash
# Usage:
# encode-sermon.sh "sermon title" "speaker" wav m4a

# encode to m4a
ffmpeg -i "$3" \
       -c:a aac \
       -b:a 96k \
       -ac 1 \
       -af "volume=20dB" \
       -metadata title="$1" \
       -metadata author="$2" \
       -metadata year=2018 \
       -movflags +faststart \
       "$4"

# emit useful information
stat "$4"

# upload to web host
scp "$4" arborchurch@arborchurch.com:arborchurch.com/podcast


