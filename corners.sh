#!/bin/bash

#script for testing pen positions across a rectangle
#used to test for pen drag

SCALE=1.255
XPOS=`echo "scale=5;$1*$SCALE" | bc`
YPOS=`echo "scale=5;$2*$SCALE" | bc`

touch () {
	paxi down
	sleep 1
	paxi up
	paxi home
}

touch

paxi move 0 ${YPOS}
touch

paxi move ${XPOS} 0
touch

paxi move ${XPOS} ${YPOS}
touch
