# record fullscreen with ffmpeg
alias rec-socials-gif='ffmpeg -y -use_wallclock_as_timestamps 1 -thread_queue_size 4096 -f pulse -ac 2 -ar 48000 -i default -video_size 1920x1080 -r 60 -thread_queue_size 4096 -f x11grab -i :0.0 -c:v libx264rgb -vsync cfr -crf 0 -pix_fmt rgb24 -preset ultrafast'

# params for ffmpeg
params="-c:v libx264rgb -an -r 60 -max_muxing_queue_size 1024 -crf 0 -preset veryslow -y"

# slice a clip.mkv from the full recording
ffmpeg -i recording.mkv -ss $start -t $time $params clip.mkv

# create the cropped twitter clip
ffmpeg -i clip.mkv -vf "crop=960:540" $params cropped.mkv

# convert the clip into a gif using gifski
gifski -r 45 -Q 100 -W 960 -H 540 cropped.mkv -o cropped.gif
