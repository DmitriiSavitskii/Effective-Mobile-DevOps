#!/bin/bash


sudo systemctl stop monitor-test.timer
sudo systemctl disable monitor-test.timer
sudo rm /etc/systemd/system/monitor-test.*
sudo rm /usr/local/bin/monitor-test.sh
if [[ -f "/var/log/monitoring.log" ]]; then
    sudo rm /var/log/monitoring.log
fi
if [[ -f "/var/tmp/monitor_test.pid" ]]; then
    sudo rm /var/tmp/monitor_test.pid
fi
sudo systemctl daemon-reload
