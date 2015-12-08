FROM python:2.7.10

ENV ENVIRONMENT  ${ENVIRONMENT:-development}
ENV REVISION     ${REVISION:-master}
ENV WOF_DATA     ${WOF_DATA:-/wof/data}
ENV IAMHERE_REPO https://github.com/whosonfirst/whosonfirst-www-iamhere.git

EXPOSE 8001
EXPOSE 8080
EXPOSE 9999

RUN mkdir /wof
WORKDIR /wof

RUN apt-get update && apt-get install git -y
RUN git clone ${IAMHERE_REPO} iamhere && cd iamhere && git checkout ${REVISION}
CMD cd iamhere && ./bin/start.py -d \
  ${WOF_DATA}/data \
  ${WOF_DATA}/meta/wof-neighbourhood-latest.csv \
  ${WOF_DATA}/meta/wof-locality-latest.csv
