#!/bin/bash

set -euo pipefail

git fetch
git checkout master
git reset --hard origin/master
git pull origin master
line=$(head -n 1 README.md)
echo -n "" > README.md
echo "$(($line + 1))" >> README.md
git add README.md
git config --global user.email "sidanmor@gmail.com"
if git diff --cached --quiet; then
	echo "No changes to commit"
	exit 0
fi

git commit -m "Add one"
git push origin master
