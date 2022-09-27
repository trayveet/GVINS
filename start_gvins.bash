#!/bin/bash
RUN_ROSCORE=0;
RUN_RVIZ=0;

if [ $RUN_ROSCORE ]
then
    gnome-terminal -- roscore;
fi

gnome-terminal -- roslaunch ublox_driver ublox_driver.launch;
gnome-terminal -- roslaunch rs4se intel_d435i.launch;
gnome-terminal -- roslaunch gvins visensor_f9p_d435i.launch;

if [ $RUN_RVIZ ]
then
    gnome-terminal -- rviz -d ~/catkin_ws/src/GVINS/config/gvins_rviz_config.rviz;
    gnome-terminal -- roslaunch mapviz mapviz.launch
fi
