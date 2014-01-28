#!/bin/bash
 
# brew install rtmpdump
# brew install ffmpeg
# brew install youtube-dl
# brew install imagemagick
 
ID='nZtfW2e2Cp0' # YouTube video ID, i.e. https://www.youtube.com/watch?v={ID}
 
# fetch the video file with youtube-dl
# convert it to MP4 (not really needed, but keeps the filename predictable)
if [ ! -f $ID.mp4 ]; then
  youtube-dl --output '%(id)s.%(ext)s' --recode-video mp4 $ID
fi
 
# convert the video file to GIF with ffmpeg
START='00:00:31.000' # start 20 seconds in
LENGTH='00:00:08.000' # end after 6 seconds
SIZE='275x155' # size of the output GIF
./ffmpeg -ss $START -i $ID.mp4 -pix_fmt rgb24 -r 10 -s $SIZE -t $LENGTH $ID-unoptimized.gif
 
# optimize the GIF with imagemagick
convert -layers Optimize $ID-unoptimized.gif $ID.gif
 
# credits:
# http://www.commandlinefu.com/commands/view/10002/create-an-animated-gif-from-a-youtube-video
# http://superuser.com/a/436109/106809

# via  https://gist.github.com/hubgit/6369464
