FROM python:2.7.10

ENV ENVIRONMENT  ${ENVIRONMENT:-development}
ENV REVISION     ${REVISION:-master}
ENV WOF_DATA     ${WOF_DATA:-/wof/data}
ENV IAMHERE_REPO https://github.com/whosonfirst/whosonfirst-www-iamhere.git

ENV IAMHERE_PIP_PORT  ${IAMHERE_PIP_PORT:-8080}
ENV IAMHERE_WWW_PORT  ${IAMHERE_WWW_PORT:-8001}
ENV IAMHERE_DATA_PORT ${IAMHERE_DATA_PORT:-9999}

ENV IAMHERE_PIP_HOST  ${IAMHERE_PIP_HOST:-0.0.0.0}
ENV IAMHERE_WWW_HOST  ${IAMHERE_WWW_HOST:-0.0.0.0}
ENV IAMHERE_DATA_HOST ${IAMHERE_DATA_HOST:-0.0.0.0}

EXPOSE ${IAMHERE_PIP_PORT}
EXPOSE ${IAMHERE_WWW_PORT}
EXPOSE ${IAMHERE_DATA_PORT}

RUN mkdir /wof
WORKDIR /wof

RUN apt-get update && apt-get install git -y
RUN git clone ${IAMHERE_REPO} iamhere && cd iamhere && git checkout ${REVISION}
CMD cd iamhere && ./bin/start.py \
  --pip-host ${IAMHERE_PIP_HOST} \
  --www-host ${IAMHERE_WWW_HOST} \
  --data-host ${IAMHERE_DATA_HOST} \
  --pip-port ${IAMHERE_PIP_PORT} \
  --www-port ${IAMHERE_WWW_PORT} \
  --data-port ${IAMHERE_DATA_PORT} \
  -d \
  ${WOF_DATA}/data \
  ${WOF_DATA}/meta/wof-neighbourhood-latest.csv \
  ${WOF_DATA}/meta/wof-locality-latest.csv
