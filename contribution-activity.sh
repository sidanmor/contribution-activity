#!/bin/bash

line=$(head -n 1 README.md)
git fetch
git reset --hard origin/master
git pull origin master
echo -n "" > README.md
echo "$(($line + 1))" >> README.md
git add README.md
git commit -m "Add one"
git push origin master
