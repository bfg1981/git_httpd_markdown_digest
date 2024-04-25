FROM therealbfg/git_httpd_markdown

#This is required as bash will be removed in final build of git_httpd
RUN apk --no-cache add bash
COPY conf.d /etc/apache2/conf.d
COPY entrypoint /entrypoint
