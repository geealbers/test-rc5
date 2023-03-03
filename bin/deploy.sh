#!/bin/bash

BUILD_DIR="_site"

DIR=$(dirname "$0")
cd $DIR/..

echo "Deleting old publication"
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

echo "Generating site"
quire build

echo "Updating gh-pages branch"
git add -f $BUILD_DIR && git commit -m "Automated deploy at $(date)."
git subtree push --prefix $BUILD_DIR origin gh-pages
