#!/bin/bash

git merge --no-commit --no-ff "$1"
if [ $? -eq 0 ]; then
	echo "No conflicts"
else
	echo "There is conflicts"
fi
git merge --abort
