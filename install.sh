
# Check if root user
if [ `id -u` -ne 0 ]; then
 echo "Install as root user"
 exit 1;
fi

APPDIR=$(dirname "$0")

# Copy install files
mkdir /opt/dnsinterceptor
cp -a "$APPDIR/dnsinterceptor/." /opt/dnsinterceptor

# Copy service file 
cp "$APPDIR/systemd/dnsinterceptor.service" /etc/systemd/system/dnsinterceptor.service
chmod 644 /etc/systemd/system/dnsinterceptor.service

# Start service
systemctl daemon-reload
systemctl enable dnsinterceptor
systemctl start dnsinterceptor
systemctl status dnsinterceptor
