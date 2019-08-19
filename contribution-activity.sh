#!/bin/bash

git fetch
git checkout master
git reset --hard origin/master
git pull origin master
line=$(head -n 1 README.md)
echo -n "" > README.md
echo "$(($line + 1))" >> README.md
git add README.md
git config --global user.email "sidanmor@gmail.com"
git commit -m "Add one"
git push origin master
