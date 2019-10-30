
# Check if root user
if [ `id -u` -ne 0 ]; then
 echo "Uninstall as root user"
 exit 1;
fi

# Stop/disable the service
systemctl stop dnsinterceptor
systemctl disable dnsinterceptor

# Remove the service file
rm /etc/systemd/system/dnsinterceptor.service
systemctl daemon-reload
systemctl reset-failed

# Remove the app directory
rm -rf /opt/dnsinterceptor
