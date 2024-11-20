#!/usr/bin/env bash
# Monitor setup for triple external monitors and laptop screen

# Disable the laptop screen if not needed
# hyprctl keyword monitor eDP-1,disable

# Configure laptop
hyprctl keyword monitor eDP-1,1920x1080@60,0x1080,1

# Configure the main middle monitor (DP-3)
hyprctl keyword monitor DP-3,1920x1080@60,1920x0,1

# Configure the left monitor (DP-4)
hyprctl keyword monitor DP-4,1920x1080@60,0x0,1

# Configure the right monitor (DP-5)
hyprctl keyword monitor DP-5,1920x1080@60,3840x0,1
