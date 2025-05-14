sudo cp src/monitor-test.service /etc/systemd/system/
sudo cp src/monitor-test.timer /etc/systemd/system/
sudo cp src/monitor-test.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/monitor-test.sh

sudo systemctl daemon-reload
sudo systemctl enable monitor-test.timer
sudo systemctl start monitor-test.timer