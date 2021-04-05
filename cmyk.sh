#!/bin/bash

FILEPATH=`realpath "${1}"`
DIR=`dirname "${FILEPATH}"`
FILENAME=`basename "${FILEPATH}"`
NAME=`echo "${FILENAME}" | cut -d'.' -f1`
#EXTENSION=`echo "${FILENAME}" | cut -d'.' -f2`
EXTENSION="png"
CHANNELS=("c" "m" "y")

convert "${FILENAME}" \
	-set colorspace CMYK \
	-channel CMY \
	-separate \
	"${DIR}/${NAME}_%d.${EXTENSION}"

convert "${FILENAME}" \
	-color-threshold 'sRGB(0,0,0)-sRGB(20,20,20)' \
	"${DIR}/${NAME}_tmp.${EXTENSION}"

convert "${DIR}/${NAME}_tmp.${EXTENSION}" -negate "${DIR}/${NAME}_k.${EXTENSION}"

for ((i=0;i<${#CHANNELS[@]};++i)); do
	CHANNEL="${CHANNELS[i]}"
	mv "${DIR}/${NAME}_${i}.${EXTENSION}" "${DIR}/${NAME}_${CHANNEL}.${EXTENSION}"
	composite -compose screen "${DIR}/${NAME}_tmp.${EXTENSION}" "${DIR}/${NAME}_${CHANNEL}.${EXTENSION}" "${DIR}/${NAME}_${CHANNEL}.${EXTENSION}"
done

rm "${DIR}/${NAME}_tmp.${EXTENSION}"