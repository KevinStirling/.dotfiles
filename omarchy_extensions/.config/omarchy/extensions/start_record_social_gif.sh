# record fullscreen with ffmpeg
alias rec-socials-gif='ffmpeg -y -use_wallclock_as_timestamps 1 -thread_queue_size 4096 -f pulse -ac 2 -ar 48000 -i default -video_size 1920x1080 -r 60 -thread_queue_size 4096 -f x11grab -i :0.0 -c:v libx264rgb -vsync cfr -crf 0 -pix_fmt rgb24 -preset ultrafast'
