#!/usr/bin/env bash

DIR=$1
TERM=$2

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Usage: $0 directory_name search_term"
    exit 1
fi

[ $# -eq 2 ] || {
    echo "Usage: $0 directory_name search_term"
    exit 1
}

if [ -d "$DIR" ]; then
    cd $DIR
    for i in *; do
        echo $i $(wc -l $i | awk '{ print $1 }') $(du -h $i | awk '{ print $1 }') $(grep -c $TERM $i)
    done | column -t | sort -rhk4
else
    echo "$DIR directory does not exist."
    exit 1
fi
