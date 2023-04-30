#!/bin/bash

# Provjeriti dali je shell Bash
if [ -z "$BASH_VERSION" ]; then
  echo "This script must be executed by bash shell"
  exit 1
fi

# Instrukcije - bez argumenata
if [ $# -eq 0 ]; then
  echo "Usage: $0 <logs_directory_path> <search_string>"
  exit 1
fi

# Provjeri ima li /tmp/logs
logs_dir=$1
if [ ! -d "$logs_dir" ]; then
  echo "Error: $logs_dir is not a valid directory"
  exit 1
fi

# String za search x2
search_string=$2

# Generalno o fajlu pa novi red
printf "%-20s%-20s%-20s%-20s\n" "File Name" "File Size" "Total Lines" "Search Word Count"
printf "%s\n" "-----------------------------------------------------------------------"

# awk da skenira fajl
for file in "$logs_dir"/*.log; do
  if [ -f "$file" ]; then
    # Get file stats
    file_name=$(basename "$file")
    file_size=$(du -h "$file" | awk '{print $1}')
    total_lines=$(wc -l < "$file")
    search_word_count=$(grep -c "$search_string" "$file")

# rezultat
    printf "%-20s%-20s%-20s%-20s\n" "$file_name" "$file_size" "$total_lines" "$search_word_count"
  fi
done | sort -rnk4

exit 0

