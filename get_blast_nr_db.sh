#!/bin/bash

LOCAL_BLAST_DB="/blast/db"
if [ ! -d $LOCAL_BLAST_DB ]; then
  mkdir $LOCAL_BLAST_DB
fi
cd $LOCAL_BLAST_DB

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
