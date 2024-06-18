#!/bin/bash

convert_seconds() {
    local seconds=$(echo "scale=0; $1 / 1" | bc)
    local hours=$(( seconds / 3600 ))
    local minutes=$(( (seconds % 3600) / 60 ))
    local seconds=$(( seconds % 60 ))

	if [ "$hours" -eq "00" ]; then
		printf "%02d:%02d\n" $minutes $seconds
	else
		printf "%02d:%02d:%02d\n" $hours $minutes $seconds
	fi
}

truncate_string() {
  local input_string="$*"
  local max_length=30
  
  if [ "${#input_string}" -gt "$max_length" ]; then
    echo "${input_string:0:$max_length}…"
  else
    echo "$input_string"
  fi
}

# Extract the relevant information
state=$(nowplaying-cli get playbackRate)
artist=$(nowplaying-cli get artist)
title=$(nowplaying-cli get title)

duration=$(nowplaying-cli get duration)
elapsedTime=$(nowplaying-cli get elapsedTime)
human_duration=$(convert_seconds $duration)
human_elapsedTime=$(convert_seconds $elapsedTime)

# Set the appropriate icon based on the state
if [ "$state" == "null" ]; then
  icon="" 
elif [ "$state" == "0" ]; then
  icon=""  # Pause icon
else
  icon=""  # Stop icon
fi

# Output the information for SketchyBar
if [ "$state" == "null" ]; then
  LABEL=""
else
  SONG_NAME="$artist - $title"
  LABEL="[$human_elapsedTime/$human_duration] $(truncate_string $SONG_NAME)"
fi

# ADHOC: Output to file for tmux nowplaying
# TODO: Patch to tmux-powerline nowplaying
printf "$SONG_NAME" > /tmp/nowplaying

sketchybar --set "$NAME" icon="$icon" label="$LABEL"
