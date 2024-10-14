#!/bin/bash

week=$(date +%U)

output="Weekly Product Challenge - CW${week}\n\n"
output+="Here are your options for week ${week}'s challenge.\n"
output+="Pick one area that you want to improve in and work on the challenge for at least 5min.\n"
output+="Share your learnings and progress in the One-on-One with your manager and/or publicly in this thread.\n\n"

# Get the directory of the script
script_dir=$(dirname "$0")

# Append the output of the sqlite3 and awk commands to the variable
output+=$(sqlite3 -header $script_dir/database.sqlite < $script_dir/script.sql | awk '
  BEGIN { FS = "|" }
  NR == 1 { next }
  {
    printf("%s\n%s\n\n", $1, $2)
  }
')

# Copy the output to the clipboard
echo -e "$output" | pbcopy
