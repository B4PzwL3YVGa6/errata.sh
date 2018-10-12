#!/usr/bin/env bash

ba="https://github.com/gohugoio/hugo/releases/download/"
bb="v0.49/hugo_0.49_Linux-64bit.tar.gz"
bc=$ba$bb

cd docs && curl -sL $bc | tar xz && ./hugo
