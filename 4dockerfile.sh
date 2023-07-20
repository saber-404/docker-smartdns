#!/bin/sh
export URL=https://api.github.com/repos/pymumu/smartdns/releases/latest
export OS="linux"
apk --no-cache --update add curl
cd /
urls=$(curl -s $URL | grep browser_download_url | egrep -o 'http.+\.\w+' | grep -i "$(echo $OS)")
echo $urls > smartdns_url.txt
sed -i 's/\(https\{0,1\}:\/\/[^[:space:]]\+\)/\n\1\n/g' smartdns_url.txt

if [ "$TARGETARCH" = "386" ]; then
    durl=$(grep -m 1 -i "x86" smartdns_url.txt)

elif [ "$TARGETARCH" = "amd64" ]; then
    durl=$(grep -m 1 -i "x86_64" smartdns_url.txt)

elif [ "$TARGETARCH" = "arm" ]; then
    durl=$(grep -m 1 -i "arm" smartdns_url.txt)

elif [ "$TARGETARCH" = "arm64" ]; then
    durl=$(grep -m 1 -i "aarch64" smartdns_url.txt)
else
    echo "Error: 'TARGETARCH' is not provided." && exit 1;      
fi

wget --tries=3 $durl
tar zxvf smartdns.*.tar.gz
cp /smartdns/usr/sbin/smartdns /bin/smartdns
chmod +x /bin/smartdns

# clear
rm -rf /smartdns*
rm -rf /pre.sh

# final
# mkdir -p /smartdns
# mv config.conf /smartdns/smartdns.conf