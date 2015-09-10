#!/bin/bash

LOCAL_BLAST_DB="/blast/db"
DIR1=`dirname $LOCAL_BLAST_DB`
if [ ! -d $DIR1 ]; then
  mkdir $DIR1
fi
if [ ! -d $LOCAL_BLAST_DB ]; then
  mkdir $LOCAL_BLAST_DB
fi
cd $LOCAL_BLAST_DB
if [ $? -ne 0 ];then
  exit 1 # Can't cd to $LOCAL_BLAST_DB
fi


URL1="ftp://ftp.ncbi.nlm.nih.gov/blast/db/nr."
URL2=".tar.gz"
wget ${URL1}00${URL2}
for i in `seq 37`
  do
  if [ $i -lt 10 ]; then
    wget ${URL1}0$i${URL2}
  else
    wget ${URL1}$i${URL2}
  fi
  sleep 5
done

NAME1="./nr."
NAME2=".tar.gz"
tar xvzf ${NAME1}00${NAME2}
for i in `seq 37`
  do
  if [ $i -lt 10 ]; then
    tar xvzf ${NAME1}0$i${NAME2}
  else
    tar xvzf ${NAME1}$i${NAME2}
  fi
done
