FROM python:2.7.10

ENV BASEDIR           /wof
ENV ENVIRONMENT       ${ENVIRONMENT:-development}
ENV GUNICORN_PORT     ${GUNICORN_PORT:-8000}
ENV GUNICORN_VERSION  ${GUNICORN_VERSION:-19.4.1}
ENV GEVENT_VERSION    ${GEVENT_VERSION:-1.0.2}
ENV FLASK_VERSION     ${FLASK_VERSION:-0.10.1}
ENV WOF_SPATIAL_DSN   dbname=${POSTGRES_DB} user=${POSTGRES_USER} password=${POSTGRES_PASSWORD} host=${POSTGRES_HOST} # this isn't working... ?

ENV REVISION        ${REVISION:-master}
ENV SPELUNKER_REPO  https://github.com/whosonfirst/whosonfirst-www-spelunker.git
ENV PLACETYPES_REPO https://github.com/whosonfirst/py-mapzen-whosonfirst-placetypes.git
ENV SPATIAL_REPO    https://github.com/whosonfirst/py-mapzen-whosonfirst-spatial.git
ENV SEARCH_REPO     https://github.com/whosonfirst/py-mapzen-whosonfirst-search.git

RUN mkdir ${BASEDIR}
WORKDIR ${BASEDIR}

RUN apt-get update && apt-get install \
  git \
  python-pip \
  libgeos-dev \
  libpq-dev \
  postgresql-client \
  -y

RUN pip install -I flask==${FLASK_VERSION}
RUN pip install -I gevent==${GEVENT_VERSION}
RUN pip install -I gunicorn==${GUNICORN_VERSION}

RUN git clone ${PLACETYPES_REPO} placetypes && cd placetypes && git checkout ${REVISION} && \
  python setup.py install
RUN git clone ${SPATIAL_REPO} spatial && cd spatial && git checkout ${REVISION} && \
  python setup.py install
RUN git clone ${SEARCH_REPO} search && cd search && git checkout ${REVISION} && \
  python setup.py install
RUN git clone ${SPELUNKER_REPO} spelunker && cd spelunker && git checkout ${REVISION} && \
  pip install -U -r requirements.txt

COPY wof-setup.sh /usr/local/bin/wof-setup.sh 
COPY wof_${ENVIRONMENT}.cfg /wof/wof.cfg

CMD sleep 10 && /usr/local/bin/wof-setup.sh && \
  cd spelunker/www && gunicorn -b 0.0.0.0:${GUNICORN_PORT} server:app
