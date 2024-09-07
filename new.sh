#!/bin/bash

     # Check if a date argument is provided
     if [ $# -eq 0 ]; then
         echo "Please provide a date in the format YYYY-MM-DD"
         exit 1
     fi

     # Create directory with the given date
     dir_name="$1 lecture notes"
     mkdir "$dir_name"

     # Copy template to the new directory
     cp template.tex "$dir_name/lecture.tex"

     # Create metadata file
     echo "Initial upload: $(date)" > "$dir_name/metadata.txt"
     echo "Uploaded by: $USER" >> "$dir_name/metadata.txt"
     echo "Revision history:" >> "$dir_name/metadata.txt"

     # Add and commit changes
     git add "$dir_name"
     git commit -m "Add lecture notes for $1"
     git push origin main

     echo "Lecture notes created and pushed to repository"