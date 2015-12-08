FROM python:2.7.10

ENV ENVIRONMENT  ${ENVIRONMENT:-development}
ENV REVISION     ${REVISION:-master}
ENV WOF_DATA     ${WOF_DATA:-/wof/data}
ENV IAMHERE_REPO https://github.com/whosonfirst/whosonfirst-www-iamhere.git

ENV IAMHERE_PIP_PORT  ${IAMHERE_PIP_PORT:-8080}
ENV IAMHERE_FILE_PORT ${IAMHERE_FILE_PORT:-8001}
ENV IAMHERE_DATA_PORT ${IAMHERE_DATA_PORT:-9999}

EXPOSE ${IAMHERE_PIP_PORT}
EXPOSE ${IAMHERE_DATA_PORT}
EXPOSE ${IAMHERE_FILE_PORT}

RUN mkdir /wof
WORKDIR /wof

RUN apt-get update && apt-get install git -y
RUN git clone ${IAMHERE_REPO} iamhere && cd iamhere && git checkout ${REVISION}
CMD cd iamhere && ./bin/start.py -d \
  ${WOF_DATA}/data \
  ${WOF_DATA}/meta/wof-neighbourhood-latest.csv \
  ${WOF_DATA}/meta/wof-locality-latest.csv
