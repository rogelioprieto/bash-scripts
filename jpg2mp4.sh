!#/bin/bash
#convert all the png images (into folder) to mp4 video
#Oct 2024
#Rogelio Prieto
ffmpeg -framerate 0.5 -pattern_type glob -i '*.jpg' -c:v libx264 -r 30 -pix_fmt yuv420p output.mp4

#framerate parameter: 1=second. 0.5=2 seconds.
#Source: https://shotstack.io/learn/use-ffmpeg-to-convert-images-to-video/
