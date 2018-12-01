#!/bin/bash

DATA_FILE="data/$1-$2.txt"
SCRIPT_FILE="scripts/$1-$2.exs"

if [ ! -f $DATA_FILE ]; then
    echo "Data file not found at: $DATA_FILE"
    exit
fi

if [ ! -f $SCRIPT_FILE ]; then
    echo "Runner script not found at: $SCRIPT_FILE"
    exit
fi

cat $DATA_FILE | mix run $SCRIPT_FILE
