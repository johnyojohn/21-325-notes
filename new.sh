#!/bin/bash

# Change to the root directory
cd "$(git rev-parse --show-toplevel)" || exit 1

# Use current date if no argument is provided
date=${1:-$(date +%Y-%m-%d)}

# Create directory with the given date
dir_name="$date lecture notes"
counter=1
while [ -d "$dir_name" ]; do
    counter=$((counter + 1))
    dir_name="$date lecture notes $counter"
done
mkdir "$dir_name"

# Copy template to the new directory
cp template.tex "$dir_name/notes.tex"

# Get the Git user name
git_user=$(git config user.name)

# If git user name is not set, use a default value
if [ -z "$git_user" ]; then
    git_user="Unknown User"
fi

# Create metadata file
echo "Initial upload: $(date)" > "$dir_name/metadata.txt"
echo "Uploaded by: $git_user" >> "$dir_name/metadata.txt"
echo >> "$dir_name/metadata.txt"  # Add an empty line
echo >> "$dir_name/metadata.txt"  # Add an empty line
echo "Revision history:" >> "$dir_name/metadata.txt"


# Add and commit changes
git add "$dir_name"
git commit -m "Add lecture notes for $date"

echo "Lecture notes created and committed. Remember to push your changes when you're ready."