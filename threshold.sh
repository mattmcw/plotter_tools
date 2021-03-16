#!/bin/bash

# bash threshold.sh input value output

convert "${1}" -monochrome -white-threshold ${2} +matte -colors 4 -depth 2 "${3}"