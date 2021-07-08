get_object() {
    out_file=$1
    os_uri=$2
    success=1
    for i in $(seq 1 9); do
        echo "trying ($i) $2"
        http_status=$(curl -w '%%{http_code}' -L -s -o $1 $2)
        if [ "$http_status" -eq "200" ]; then
            success=0
            echo "saved to $1"
            break 
        else
             sleep 15
        fi
    done
    return $success
}

# get artifacts from object storage
get_object /root/wallet.64 ${wallet_par}
# Setup ATP wallet files
base64 --decode /root/wallet.64 > /root/wallet.zip
unzip -o /root/wallet.zip -d /usr/lib/oracle/21/client64/lib/network/admin/


mkdir -p tmp
# Get binaries
get_object /tmp/lab-resource.tar.xz ${lab_resource_par}

tar xvf /tmp/lab-resource.tar.xz -C /tmp

su opc

sudo chmod a+x /tmp/lab-resources/*.sh

/tmp/lab-resources/ocd_vnc_server.sh ${vncpasswd} 2>&1 | tee -a /home/opc/vnc.log

