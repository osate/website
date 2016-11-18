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

git remote add upstream "https://$GH_TOKEN@github.com/osate/osate.github.io.git"
git fetch upstream
git reset upstream/master

git add --all .
git commit -m "rebuild pages at ${rev}"
git push upstream HEAD:master
