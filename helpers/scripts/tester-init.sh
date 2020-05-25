#!/bin/bash

# cleanup workspace
rm -rf ~/catkin_ws
rm -rf /tmp/output
mkdir -p /tmp/output

# initialize workspace
source /opt/ros/melodic/setup.bash
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make
source devel/setup.bash

# checkout template git
cd ~/catkin_ws/src/
cp -ar /repo/src/* .

# build ros template packages
cd ~/catkin_ws/
catkin_make

# copy student submission
cd ~/catkin_ws/src/
rm -rf wall_follow
mkdir wall_follow
cd wall_follow
cp -arv /submission/* .

# build ros student packages
cd ~/catkin_ws/
catkin_make > /tmp/output/build.output 2> /tmp/output/build.error


