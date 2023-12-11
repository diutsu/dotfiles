#!/bin/zsh

src_dir="./files"
dest_dir="$HOME"

# Parse command-line options
while getopts "iu" opt; do
  case $opt in
    i)
      mode="install"
      ;;
    u)
      mode="update"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Check if either -i or -u is provided
if [[ "$mode" != "install"  && "$mode" != "update" ]]; then
    echo "Either -i (install) or -u (update) must be provided."
    exit 1
fi

# Check if the destination directory exists
if [ ! -d "$dest_dir" ]; then
    echo "Destination directory '$dest_dir' does not exist. Exiting."
    exit 1
fi


# Generate the list of files to update
files_to_update=($(find "$src_dir" -type f))

# Process the list of files
for file in "${files_to_update[@]}"; do
    # Remove common prefix "files/" from file names
    file_name=$(echo "$file" | sed "s|$src_dir/||")
    dest_file="$dest_dir/$file_name"

    if [[ "$mode" == "install" ]]; then
        if [ -e "$dest_file" ]; then
            if diff -r "$file" "$dest_file" > /dev/null; then
                echo "No change between $file and $dest_file"
            else
                cp -r "$file" "$dest_dir"
                echo "Updated $file with $dest_file"
            fi
        else
            cp -r "$file" "$dest_dir"
            echo "Created: $dest_file"
        fi
    elif [[ "$mode" == "update" ]]; then
        if [ -e "$dest_file" ]; then
            if diff -r "$file" "$dest_file" > /dev/null; then
                echo "No change between $file and $dest_file"
            else
                cp -r "$dest_file" "$file"
                echo "Updated: $file with $dest_file"
            fi
        else
            echo "File not found in local filesystem: $dest_file. Skipping..."
        fi
    fi
done
