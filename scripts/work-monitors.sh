#!/usr/bin/env bash
# Monitor setup for triple external monitors and laptop screen

# Disable the laptop screen if not needed
# hyprctl keyword monitor eDP-1,disable

# Configure laptop screen (eDP-1) with workspace 9
hyprctl keyword monitor "eDP-1,1920x1080@60,0x1080,1"
hyprctl keyword workspace 9 monitor eDP-1

# Configure the main middle monitor (DP-3) with workspace 2
hyprctl keyword monitor "DP-3,1920x1080@60,1920x0,1"
hyprctl keyword workspace 2 monitor DP-3

# Configure the left monitor (DP-4) with workspace 1
hyprctl keyword monitor "DP-4,1920x1080@60,0x0,1"
hyprctl keyword workspace 1 monitor DP-4

# Configure the right monitor (DP-5) with workspace 3
hyprctl keyword monitor "DP-5,1920x1080@60,3840x0,1"
hyprctl keyword workspace 3 monitor DP-5

