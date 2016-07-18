#!/bin/bash

#install unrar if not already installed

TORRENTDIR=test_in/
OUTDIR=test_out/


ZIPS=`find $TORRENTDIR -name *".zip"`

function mkout {
  OUTEND=${OUTDIR}$1
  mkdir $OUTEND
}

for ZIP in $ZIPS;do
  if [[ ! -f "$ZIP.done" ]];then
    mkout `basename $ZIP .zip`
    unzip $ZIP -d $OUTEND
    touch $ZIP.done
  fi
done


RARS=`find $TORRENTDIR -name *".rar"`

for RAR in $RARS;do
  if [[ ! -f "$RAR.done" ]];then
    mkout `basename $RAR .rar`
    unrar e $RAR $OUTEND
    touch $RAR.done
  fi
done


