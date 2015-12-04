FROM  nginx:1.9.7

ENV ENVIRONMENT     ${ENVIRONMENT:-development}
ENV REVISION        ${REVISION:-master}
ENV SPELUNKER_REPO  https://github.com/whosonfirst/whosonfirst-www-spelunker.git

RUN     mkdir /wof
WORKDIR /wof

RUN   apt-get update && apt-get install git -y
RUN   rm /etc/nginx/conf.d/default.conf
RUN   git clone ${SPELUNKER_REPO} spelunker && cd spelunker && git checkout ${REVISION}
COPY  proxy_${ENVIRONMENT}.conf /etc/nginx/conf.d/wof-proxy.conf
