#!/bin/bash
tmpdir=$HOME/chrome$1/

if [ -d "$tmpdir" ]; then
    rm -rf $tmpdir
fi

rsync -av --delete --exclude=/Singleton* --exclude=/Session* $3/ $tmpdir > /dev/null

browser=$2

shift 3
$browser --user-data-dir=$tmpdir "$@"
