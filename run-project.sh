#!/bin/bash

TARGET_DIR_NAME="your-project-directory" #example: to-do
BASE_PATH=~/project-location #example: ~/Documents/git/run-projects
COMMANDS=("your commands list") #"git branch" "yarn" ...

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
bash "$SCRIPT_DIR/ignite.sh" "$TARGET_DIR_NAME" "$BASE_PATH" "${COMMANDS[@]}"

