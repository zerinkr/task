#!/bin/bash

# Provjeriti dali je shell Bash
if [ -z "$BASH_VERSION" ]; then
  echo "This script must be executed by bash shell"
  exit 1
fi
# Instrukcije - bez argumenata
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <path> <string>"
  exit 1
fi

# Provjeri ima li /tmp/logs
logs_dir=$1
if [ ! -d "$logs_dir" ]; then
  echo "Error: $logs_dir is not a valid directory"
  exit 1
fi

# String za search x2 - provjeri
if [ -z "$2" ]; then
  echo "Error: search string argument not provided"
  exit 1
fi

# search string
search_string="$2"

# Generalno o fajlu pa novi red
printf "%-20s%-20s%-20s%-20s\n" "File Name" "File Size" "Total Lines" "Search Word Count"
printf "%s\n" "-----------------------------------------------------------------------"

# awk da skenira fajl
while IFS= read -r -d '' file; do
  if [ -f "$file" ]; then
    # Get file stats
    file_name=$(basename "$file")
    file_size=$(du -h "$file" | awk '{print $1}')
    total_lines=$(wc -l < "$file")
    search_word_count=$(grep -c "$search_string" "$file")

# rezultat
 printf "%-20s%-20s%-20s%-20s\n" "$file_name" "$file_size" "$total_lines" "$search_word_count"
  fi
done < <(find "$logs_dir" -type f -name '*.log' -print0) | sort -rnk4
exit 0
