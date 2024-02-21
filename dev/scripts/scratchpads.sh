#!/bin/bash
func=$1
fm(){
  tmux new -s file_manager ranger
}

if [ "$func" = "fm" ]; then
  fm
fi
