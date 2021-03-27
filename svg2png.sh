#!/bin/bash

INPUT="${1}"
OUTPUT="${4}"
WIDTH=${2}
HEIGHT=${3}

inkscape -z -w ${WIDTH} -h ${HEIGHT} "${INPUT}" -e "${OUTPUT}"