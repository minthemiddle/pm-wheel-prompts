#!/bin/bash

week=$(date +%U)

echo "Weekly Product Challenge - CW${week}"
echo

cat <<EOT
Here are your options for week ${week}'s challenge.
Pick one area that you want to improve in and work on the challenge for at least 5min.
Share your learnings and progress in the One-on-One with your manager and/or publicly in this thread.

EOT

sqlite3 -header database.sqlite < script.sql | awk '
  BEGIN { FS = "|" }
  NR == 1 { next }
  {
    printf("%s\n%s\n", $1, $2)
    print $3
    print ""
  }
'
