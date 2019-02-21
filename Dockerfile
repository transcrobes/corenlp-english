# vim:set ft=dockerfile:
FROM openjdk:11-jre-slim

RUN apt update && apt -y install wget libarchive-tools && apt -y autoremove && apt -y clean && rm -rf /var/lib/apt/lists/* 

ARG CORENLP_DATE_VERSION='2018-10-05'

RUN wget -qO- "https://nlp.stanford.edu/software/stanford-corenlp-full-${CORENLP_DATE_VERSION}.zip" | bsdtar -xvf-

WORKDIR stanford-corenlp-full-${CORENLP_DATE_VERSION}

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV CORENLP_TIMEOUT=30000
ENV CORENLP_JAVA_XMX=300m
ENV CORENLP_PORT=9001

EXPOSE $CORENLP_PORT

CMD java -Xmx${CORENLP_JAVA_XMX} -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $CORENLP_PORT -timeout ${CORENLP_TIMEOUT}
