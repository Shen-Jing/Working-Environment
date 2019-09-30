#! /bin/bash
# NIS domain name
cat <<- EOF >> /etc/sysconfig/network
    NISDOMAIN=jhhlabnis
    YPSERV_ARGS="-p 1011"   # NIS starts at fixed port each time
EOF

# Main setting
echo "* : * : * : none" >> /etc/ypserv.conf

# host ⇔ IP


