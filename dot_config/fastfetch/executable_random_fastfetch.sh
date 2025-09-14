#!/bin/bash

# Directory where logos are stored
LOGO_DIR="$HOME/.config/fastfetch/logos"

# List of all logo files in the directory
LOGO_FILES=($(ls $LOGO_DIR))

# Choose a random logo from the list
RANDOM_LOGO=${LOGO_FILES[$RANDOM % ${#LOGO_FILES[@]}]}

# Run fastfetch with the selected logo
fastfetch --kitty "$LOGO_DIR/$RANDOM_LOGO" --logo-height 20 --logo-padding-left 4 --logo-padding-top 2
