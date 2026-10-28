cd "C:/Users/davie/portfolio-site/media"
V="C:/Users/davie/Videos"; M="C:/Users/davie/OneDrive/Documents/---Motion Graphics---"
mk(){ id="$1"; src="$2"; frac="$3"
  d=$(ffprobe -v error -show_entries format=duration -of csv=p=0 "$src"); t=$(awk -v d="$d" -v f="$frac" 'BEGIN{printf "%.2f", d*f}')
  w=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 "$src" | head -1)
  vw=${w%,*}; vh=${w#*,}; if [ "$vh" -gt "$vw" ]; then sc="scale=-2:640"; else sc="scale=720:-2"; fi
  ffmpeg -v error -y -ss "$t" -t 6 -i "$src" -an -vf "$sc,fps=30" -c:v libx264 -crf 30 -preset veryfast -pix_fmt yuv420p -movflags +faststart "$id.mp4" </dev/null
  ffmpeg -v error -y -ss "$t" -i "$src" -frames:v 1 -vf "$sc" -q:v 4 "$id.jpg" </dev/null
  echo "$id done"; }
mk tars-longform "$V/11th Longform 1.mp4" 0.40
mk test-edit "$V/Test edit(1).mp4" 0.25
mk anna "$M/TARS/Anna's Video project/Anna's Video Project_2.mp4" 0.25
mk podcast-trailer "$V/Podcast Trailer video_2.mp4" 0.05
mk habaripay "$M/Saamu Eleja fintech/Habari Pay edit.mp4" 0.25
mk edge-cases "$M/TARS/Edge Cases Aren't Edge Cases in CX/Edge Cases Aren't Edge Cases in CX_5.mp4" 0.40
mk altschool "$M/../../../Videos/Altschool casestudy/Altschool casestudy.mp4" 0.20
mk builders "$V/Buillders in fintech video.mp4" 0.10
mk metrics "$M/The Metrics/brand identity.mov" 0.30
mk move9ja "$M/Move9ja/travel insurance.mp4" 0.40
mk chaos "$M/TARS/Jaya's Video/Press_1_for_chaos_2.mp4" 0.40
mk spark "$M/Collage Promo Recreation/v1 - SPARK/SPARK - collage promo.mp4" 0.30
mk maven "$V/MavenAI assignment/MavenAI assignment.mp4" 0.10
mk lakowe "$V/Lakowe.mp4" 0.15
mk building "$V/Building showcase.mp4" 0.05
mk northgate "$V/FUTA NORTHGATE.mp4" 0.55
ls -la
