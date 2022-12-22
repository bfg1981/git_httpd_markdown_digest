FROM therealbfg/git_httpd_markdown

COPY auth /var/www/localhost/auth
COPY conf.d /etc/apache2/conf.d
COPY entrypoint /entrypoint
