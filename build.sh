#!/bin/bash

# Function to compile LaTeX and update metadata
compile_and_update() {
    local file=$1
    local dir=$(dirname "$file")
    local filename=$(basename "$file")
    local basename="${filename%.tex}"

    echo "Processing $file"
    
    # Compile LaTeX
    pdflatex -output-directory="$dir" "$file"

    # Update metadata
    echo >> "$dir/metadata.txt" 
    echo "Last compiled: $(date)" >> "$dir/metadata.txt"
    echo "Revision by: $(git config user.name)" >> "$dir/metadata.txt"
    echo "Commit: $(git rev-parse HEAD)" >> "$dir/metadata.txt"
    
    # Clean up auxiliary files
    rm -f "$dir/$basename".{aux,log,out,synctex.gz,toc,lof,lot,bbl,blg,nav,snm,vrb}

    # Add changes to git
    git add "$dir/${filename%.tex}.pdf" "$dir/metadata.txt"
}

# Get the root directory of the git repository
repo_root=$(git rev-parse --show-toplevel)

# Change to the repository root
cd "$repo_root"

# Get list of changed and new .tex files that are one layer deep
changed_files=$(git diff --name-only HEAD | grep '*/.*\.tex$')
new_files=$(git ls-files --others --exclude-standard | grep '*/.*\.tex$')

# Combine changed and new files
all_files="$changed_files $new_files"

# Process each changed file
for file in $changed_files; do
    if [[ $(ls "$(dirname "$file")"/*.tex | wc -l) -eq 1 ]]; then
        compile_and_update "$file"
    fi
done

# Commit changes
git commit -m "Compile LaTeX and update metadata"

# Push changes
git push origin HEAD

echo "Changes have been compiled, committed, and pushed to the remote repository."