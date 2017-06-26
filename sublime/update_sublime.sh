#!/bin/bash
SUBLIME_PACKAGES_PATH="$HOME/Library/Application Support/Sublime Text 2/Packages/"
rsync -a -v ./ "$SUBLIME_PACKAGES_PATH" --exclude update_sublime.sh
