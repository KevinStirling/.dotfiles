# params for ffmpeg
params="-c:v libx264rgb -an -r 60 -max_muxing_queue_size 1024 -crf 0 -preset veryslow -y"

# slice a clip.mkv from the full recording
ffmpeg -i recording.mkv -ss $start -t $time $params clip.mkv

# create the cropped twitter clip
ffmpeg -i clip.mkv -vf "crop=960:540" $params cropped.mkv

# convert the clip into a gif using gifski
gifski -r 45 -Q 100 -W 960 -H 540 cropped.mkv -o cropped.gif
