#!/bin/sh

conffile=/etc/apache2/conf.d/conf_digest.conf


for hook in $HOOKS
do
echo "<Location \"/$hook\">
    Require all granted
</Location>" | tee -a $conffile
done

