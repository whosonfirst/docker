FROM  nginx:1.9.7

ENV ENVIRONMENT     ${ENVIRONMENT:-development}
ENV REVISION        ${REVISION:-master}
ENV SPELUNKER_REPO  https://github.com/whosonfirst/whosonfirst-www-spelunker.git

RUN mkdir /wof
WORKDIR /wof

RUN   rm /etc/nginx/conf.d/default.conf
COPY  proxy_${ENVIRONMENT}.conf /etc/nginx/conf.d/wof-proxy.conf
