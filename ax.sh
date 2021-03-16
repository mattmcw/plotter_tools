#!/bin/bash

#wrapper script for controlling my RobotHouse A3 plotter with
#the AxiDraw CLI : https://axidraw.com/doc/cli_api/
#use the config from this repo and place this script in your path
#chmod +x and all that
#I just call it "ax"

axicli -f ./axidraw_conf_robothouse_a3.py \
	--report_time \
	--model 2 \
	--pen_pos_up 20 \
	--pen_pos_down 60 \
	-o ~/progress.svg \
	"${@}"