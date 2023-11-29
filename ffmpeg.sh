#Probe file
ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 Top_Gun_Maverick_2022.mkv							
#Probe file
ffprobe -v error -select_streams a:0 -show_entries stream=codec_name -of default=noprint_wrappers=1:nokey=1 Top_Gun_Mav							
#erick_2022.mkv	
#Encode
ffmpeg -i Top_Gunner_Danger_Zone_\(2022\).mp4 -c:v libx264 -preset slow -crf 20 -c:a aac -b:a 160k -vf format=yuv420p -movflags +faststart TopGunneroutput.mp4							

#Encode breakdown
 #Callsign
ffmpeg
#INPUT
-i
#Conversion Parameters
-c:v libx264 -preset slow -crf 20 -c:a aac -b:a 160k -vf format=yuv420p -movflags +faststart						

#Hardware Acceleration
ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i input.mp4 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4							
