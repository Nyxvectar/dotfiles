#!/bin/bash

today=$(date +%Y-%m-%d)

first_exam_date="2027-01-06"
final_exam_date="2027-06-07"

days_to_first_exam=$(( ($(date -d "$first_exam_date" +%s) - $(date -d "$today" +%s)) / 86400 ))
days_to_final_exam=$(( ($(date -d "$final_exam_date" +%s) - $(date -d "$today" +%s)) / 86400 ))

notify-send --urgency=critical "高考倒计时" "距离首考仅剩 $days_to_first_exam 天\n距离终考仅剩 $days_to_final_exam 天"
