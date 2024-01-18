#!/bin/bash

# enumdir.sh - Enumerate a directory and prompt the user to view files
# Usage: enumdir.sh directory
# Example: enumdir.sh /home/user

dir="$1" # $1 is the first argument passed to the script

# Check if the user entered an argument
# check if the argument is not empty or -h or --help

echo "The directory is $dir"

usage()
{
    echo "Usage:    enumdir.sh <directory>"
    echo "Example:  enumdir.sh /home/user"
    echo "          -h|--help: display help"
}


if [ $# -eq 0 ]; then
    usage
    exit
fi

if [[ $1 == "-h" || $1 == "--help" ]]; then
    usage
    exit
fi


if [ -d "$dir" ]; then
    # Change to the directory
    #cd "$dir"
    cd -e "$dir" || { echo "Error: Unable to change to the directory $dir."; exit 1; }

    shopt -s dotglob  # Enable globbing to include dot files
    for file in *; do
        # Check if the item is a file (not a directory)
        if [ -f "$file" ]; then
            # Prompt the user to view the file
            echo ""
            read -p "Do you want to view '$dir/$file'? (y/n): " response
            if [ "$response" == "y" ]; then
                # Use cat command to view the file
                cat "$file"
            fi
        fi
    done
    shopt -u dotglob  # Disable globbing to exclude dot files from subsequent commands

else
    echo "The $dir doesn't exist."
    exit 1
fi

