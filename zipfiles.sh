#!/bin/sh

# Authors: @lopadova
# https://github.com/lopadova
# https://github.com/padosoft

if [[ ($# < 3) ]]; then
  printf '%s\n%s\n' \
    'USAGE: zipfiles.sh PATHTOZIP ZIPNAME ZIPNAMEPATH MODE DAYCHANGES MAXRETENTIONDAYS' \
    'MODE=0 ONLY PARTIAL MODE=1 ONLY FULL MODE=2 PARTIAL+FULL'  \
    'DAYCHANGES: create zip for only files that was changed from ${DAYCHANGES} days. Default 1days. Valid ONLY for PARTIAL MODE'  \
    'MAXRETENTIONDAYS: clean file older than +${MAXRETENTIONDAYS} days. Default 20days.'  \
    'EXAMPLE: zipfiles.sh /my/dir/images/ images.zip /my/dir/archives/ 2' \
    'OR zipfiles.sh /my/dir/images/*2016/ imagesonly2016.zip /my/dir/archives/ 2'  >&2
  exit
fi

PATHTOZIP=$1
ZIPNAME=$2
DATASYNC=$(date +%Y-%m-%d" "%H:%M:%S)
DATASYNCSAFE=$(date +%Y-%m-%d)
ABSPATH=$3
TYPE=$4
DAYCHANGES=$5
MAXRETENTIONDAYS=$6
ZIPCOMMAND="zip -u -1"

if [ -z $TYPE ]; then
    TYPE=0
fi
if [ -z $DAYCHANGES ]; then
    DAYCHANGES=1 #yesterday
fi
if [ -z $MAXRETENTIONDAYS ]; then
    MAXRETENTIONDAYS=20 #20gg
fi

_now=$(date +%Y-%m-%d.%H.%M.%S)
echo "zipfiles start at ${_now}"

if [ $TYPE != 0 ]; then
	echo "create zip ${ZIPNAME}"
	find ${PATHTOZIP} -name "*" -type f -print | zip -u  -1 ${ABSPATH}${ZIPNAME} -@
fi

if [ $TYPE != 1 ]; then
	echo "create zip for only files that was changed from ${DAYCHANGES} ${DATASYNCSAFE}_${ZIPNAME}"
	find ${PATHTOZIP} -name "*" -type f -mtime -${DAYCHANGES} -print | zip -u -1 ${ABSPATH}${DATASYNCSAFE}_${ZIPNAME} -@
fi

echo "clean file older than +${MAXRETENTIONDAYS}gg"
find $ABSPATH -name "*${ZIPNAME}" -type f -mtime +${MAXRETENTIONDAYS} -exec rm {} \;

_end=$(date +%Y-%m-%d.%H.%M.%S)
echo "zipfiles finish at ${_end}"
