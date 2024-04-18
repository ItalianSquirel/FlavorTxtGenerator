#!/bin/bash

# Seed random number generator
RANDOM=$(date +%s)

countDown=10

while [ $countDown -gt 0 ]; do
    seed=$RANDOM
    # Bash does not need reseeding like Python, using date and RANDOM variability
    
    # Generate a random sleep time between 0.1 and 4.1 seconds
    sleepTime=$(awk -v seed=$seed 'BEGIN{srand(seed); print 0.1 + rand() * 4.0}')
    sleep $sleepTime

    # Read verbs from verbs.txt file
    if [ -f verbs.txt ]; then
        mapfile -t verbs < verbs.txt
        nverbs=${#verbs[@]}
        verbIndex=$(($RANDOM % nverbs))
        randVerb=${verbs[$verbIndex]}
    else
        echo "Error: File 'verbs.txt' not found."
        exit 1
    fi

    # Read nouns from nouns.txt file
    if [ -f nouns.txt ]; then
        mapfile -t nouns < nouns.txt
        nnouns=${#nouns[@]}
        nounIndex=$(($RANDOM % nnouns))
        randNoun=${nouns[$nounIndex]}
    else
        echo "Error: File 'nouns.txt' not found."
        exit 1
    fi

    # Output random verb and noun
    echo "${randVerb}ing ${randNoun}..."

    # Decrement countdown
    ((countDown--))
done
