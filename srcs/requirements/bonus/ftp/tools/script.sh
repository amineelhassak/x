#!/bin/bash

echo "Starting FTP setup..."

cat << EOF >> /etc/vsftpd.conf
anonymous_enable=NO
local_enable=YES
write_enable=YES
local_root=/var/www/html
pasv_min_port=10000
pasv_max_port=10100
EOF

echo "Creating user: $FTP_USER"

useradd -m -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

echo "User created successfully"

mkdir -p /var/www/html
mkdir -p /var/run/vsftpd/empty

chown -R www-data:www-data /var/www/html
chmod 755 /var/www/html

echo "Starting vsftpd..."


exec vsftpd /etc/vsftpd.conf