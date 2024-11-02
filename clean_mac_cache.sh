#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to convert bytes to human readable format
convert_size() {
    local size=$1
    local units=('B' 'KB' 'MB' 'GB' 'TB')
    local unit_index=0

    while (( size > 1024 )); do
        size=$(( size / 1024 ))
        unit_index=$(( unit_index + 1 ))
    done

    echo "$size${units[$unit_index]}"
}

# Function to calculate directory size
get_size() {
    local dir="$1"
    if [ -d "$dir" ]; then
        size=$(du -sk "$dir" 2>/dev/null | cut -f1)
        echo $((size * 1024)) # Convert KB to bytes
    else
        echo 0
    fi
}

# Print header
echo -e "${GREEN}Cache Cleaning Tool${NC}"
echo "================================================"
echo "Analyzing directories..."
echo

# Calculate initial sizes
USER_CACHE_SIZE=$(get_size ~/Library/Caches)
SYSTEM_CACHE_SIZE=$(get_size /Library/Caches)
TRASH_SIZE=$(get_size ~/.Trash)

# Show directories to be cleaned
echo "The following will be cleaned:"
echo "------------------------------------------------"
[ $USER_CACHE_SIZE -gt 0 ] && echo -e "${YELLOW}User Cache${NC} (~Library/Caches): $(convert_size $USER_CACHE_SIZE)"
[ $SYSTEM_CACHE_SIZE -gt 0 ] && echo -e "${YELLOW}System Cache${NC} (/Library/Caches): $(convert_size $SYSTEM_CACHE_SIZE)"
[ $TRASH_SIZE -gt 0 ] && echo -e "${YELLOW}Trash${NC}: $(convert_size $TRASH_SIZE)"

# Calculate total size
TOTAL_SIZE=$((USER_CACHE_SIZE + SYSTEM_CACHE_SIZE + TRASH_SIZE))

echo "------------------------------------------------"
echo -e "Total space to be freed: ${GREEN}$(convert_size $TOTAL_SIZE)${NC}"
echo

# Ask for confirmation
read -p "Do you want to proceed with cleaning? (y/n): " confirm
if [[ $confirm != [yY] ]]; then
    echo "Operation cancelled."
    exit 1
fi

# Ask for sudo password at the beginning
echo "Please enter your password to proceed with cleaning:"
sudo -v

# Keep sudo alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo
echo "Cleaning in progress..."
echo "------------------------------------------------"

cleaned_size=0

# Clean User Cache
if [ -d ~/Library/Caches ] && [ $USER_CACHE_SIZE -gt 0 ]; then
    echo "Cleaning User Cache..."
    sudo rm -rf ~/Library/Caches/* 2>/dev/null
    cleaned_size=$((cleaned_size + USER_CACHE_SIZE))
fi

# Clean System Cache (with sudo)
if [ -d /Library/Caches ] && [ $SYSTEM_CACHE_SIZE -gt 0 ]; then
    echo "Cleaning System Cache..."
    sudo rm -rf /Library/Caches/* 2>/dev/null
    cleaned_size=$((cleaned_size + SYSTEM_CACHE_SIZE))
fi

# Clean Trash
if [ -d ~/.Trash ] && [ $TRASH_SIZE -gt 0 ]; then
    echo "Cleaning Trash..."
    rm -rf ~/.Trash/* 2>/dev/null
    cleaned_size=$((cleaned_size + TRASH_SIZE))
fi

echo "------------------------------------------------"
echo -e "${GREEN}Cleaning completed!${NC}"
echo -e "Total space freed: ${GREEN}$(convert_size $cleaned_size)${NC}"
echo

exit 0
