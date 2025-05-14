#!/bin/bash


sudo cp src/monitor_test.service /etc/systemd/system/
sudo cp src/monitor_test.timer /etc/systemd/system/
sudo cp src/monitor_test.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/monitor_test.sh
sudo systemctl daemon-reload
sudo systemctl enable monitor_test.timer
sudo systemctl start monitor_test.timer