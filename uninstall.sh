#!/bin/bash


sudo systemctl stop monitor_test.timer
sudo systemctl disable monitor_test.timer
sudo rm /etc/systemd/system/monitor_test.*
sudo rm /usr/local/bin/monitor_test.sh
sudo rm /var/log/monitoring.log
sudo rm /var/tmp/monitor_test.pid
sudo systemctl daemon-reload
