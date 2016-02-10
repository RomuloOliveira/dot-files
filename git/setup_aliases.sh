#!/bin/sh

git config alias.lasts-commits 'log --oneline -n 5'
git config alias.ahead-of-master 'log master..HEAD --oneline'
