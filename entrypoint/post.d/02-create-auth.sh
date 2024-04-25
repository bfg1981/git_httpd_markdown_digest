#!/bin/bash

AUTH_FILE=/var/www/localhost/auth/digest_pw

if [ -s $AUTH_FILE ]
then
  echo "Authorization file is already present, will not override"
  exit 0
else
  echo "Creating authorization file"
fi

if [ -n "$DEFAULT_REALM" ]
then
  sed -i -e "s/General/${DEFAULT_REALM}/g" /etc/apache2/conf.d/conf_digest.conf
fi

mkdir -p $(dirname $AUTH_FILE)

IFS=";" read -ra entries <<< "$ACCESS"

for e in ${!entries[@]}
do
    entry=${entries[$e]}
    user=$(echo $entry| cut -d: -f1)
    realm=$(echo $entry| cut -d: -f2)
    pass=$(echo $entry| cut -d: -f3)
    (echo -n "$user:$realm:" && echo -n "$user:$realm:$pass" | md5sum | cut -d- -f1 ) >> $AUTH_FILE
done
