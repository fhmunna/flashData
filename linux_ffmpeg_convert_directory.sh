find /media/mun/diskone -iname '*.mkv' | while read line
do
	ffmpeg -i "$line" -c:a copy -c:v copy  ${line%.*}.mp4
	echo ${line%.*}.mp4
done
