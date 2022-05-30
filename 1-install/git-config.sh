#!/usr/bin/sh
git config --global credential.helper store # make sure that git stores our credentials and remembers them
git config --global init.defaultBranch master # set default branch when initing a folder so git doesnt through warnings