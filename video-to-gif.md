# mp4 to image

````
ffmpeg -i time2.mp4 -r 0.2 image-%06d.png
````

# image to gif

````
convert -delay 40 -loop 0 time-*.png animation2.gif
````
