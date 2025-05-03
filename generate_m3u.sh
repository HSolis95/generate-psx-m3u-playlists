#!/bin/bash

# Base folders
BASE_DIR="./"
MULTI_DIR="${BASE_DIR}/multi"

# Create 'multi' folder if it doesn't exist
mkdir -p "$MULTI_DIR"

# Find all multi-disc .chd files (e.g., files containing "(Disc 1)", etc.)
find "$BASE_DIR" -maxdepth 1 -type f -name "*.chd" | grep -E "\(Disc [0-9]+\)" | while read -r filepath; do
    filename=$(basename "$filepath")

    # Strip "(Disc N)" and extension to group them
    base_name=$(echo "$filename" | sed -E 's/ \(Disc [0-9]+\)\.chd$//')

    # If m3u already exists, skip
    m3u_path="${BASE_DIR}/${base_name}.m3u"
    if [[ -f "$m3u_path" ]]; then
        echo "Skipped (already exists): ${base_name}.m3u"
        continue
    fi

    # Find all matching discs
    mapfile -t disc_files < <(find "$BASE_DIR" -maxdepth 1 -type f -name "${base_name} (Disc *.chd" | sort)

    # Move discs to 'multi' and write m3u list
    > "$m3u_path"  # Create or empty the m3u file
    for disc in "${disc_files[@]}"; do
        disc_name=$(basename "$disc")
        mv "$disc" "$MULTI_DIR/"
        echo "multi/$disc_name" >> "$m3u_path"
    done

    echo "Created and moved: $base_name.m3u"
done
