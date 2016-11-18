#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

cd build/html

git init
git config user.name "Lutz Wrage"
git config user.email "lutz.wrage@gmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/osate/sandbox.git"
git fetch upstream
git reset upstream

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:master
