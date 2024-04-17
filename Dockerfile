FROM therealbfg/git_httpd_markdown

COPY conf.d /etc/apache2/conf.d
COPY entrypoint /entrypoint
