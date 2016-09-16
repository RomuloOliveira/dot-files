#!/bin/sh

git config --global alias.lasts-commits 'log --oneline -n 5'
git config --global alias.ahead-of-master 'log --oneline origin/master..HEAD'
git config --global alias.last-tag 'describe --abbrev=0 --tags'
git config --global alias.autosquash 'rebase origin/master --autosquash -i'
git config --global alias.delete-merged-branches "branch --merged origin/master | grep -v master | grep -v '*' | xargs git branch -D"
