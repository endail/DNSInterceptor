
# Stop/disable the service
systemctl stop dnsinterceptor
systemctl disable dnsinterceptor

# Remove the service file
rm /etc/systemd/system/dnsinterceptor.service
systemctl daemon-reload

# Remove the app directory
rm -rf /opt/dnsinterceptor
