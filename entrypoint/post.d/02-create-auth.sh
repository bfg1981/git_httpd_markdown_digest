#!/bin/bash

mkdir -p /var/www/localhost/auth/

IFS=";" read -ra entries <<< "$ACCESS"

for e in ${!entries[@]}
do
    entry=${entries[$e]}
    user=$(echo $entry| cut -d: -f1)
    realm=$(echo $entry| cut -d: -f2)
    pass=$(echo $entry| cut -d: -f3)
    (echo -n "$user:$realm:" && echo -n "$user:$realm:$pass" | md5sum | cut -d- -f1 ) >> /var/www/localhost/auth/digest_pw
done
