cp -p ./install/* /opt/dnsinterceptor

cp ./dnsnterceptor.service /etc/systemd/system/dnsinterceptor.service
chmod 644 /etc/systemd/system/dnsinterceptor.service

systemctl enable dnsinterceptor
systemctl start dnsinterceptor
systemctl status dnsinterceptor
