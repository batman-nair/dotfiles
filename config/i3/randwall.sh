walls=(/home/arjun/Pictures/Wallpapers/*)
rwall=${walls[RANDOM % ${#walls[@]}]}
wal -i $rwall -t

