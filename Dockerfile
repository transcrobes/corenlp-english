# vim:set ft=dockerfile:
FROM eclipse-temurin:17

RUN apt update && apt -y install wget libarchive-tools && apt -y autoremove && apt -y clean && rm -rf /var/lib/apt/lists/*

ARG CORENLP_VERSION='4.5.1'

# Stanford can't afford decent servers/bandwidth apparently...
RUN wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 --tries=100 -O- "https://huggingface.co/stanfordnlp/CoreNLP/resolve/v${CORENLP_VERSION}/stanford-corenlp-latest.zip" | bsdtar -xvf-

WORKDIR stanford-corenlp-${CORENLP_VERSION}

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV CORENLP_TIMEOUT=30000
ENV CORENLP_JAVA_XMX=700m
ENV CORENLP_PORT=9001
ENV CORENLP_THREADS=2

EXPOSE $CORENLP_PORT

CMD java -Xmx${CORENLP_JAVA_XMX} -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $CORENLP_PORT -timeout ${CORENLP_TIMEOUT} -threads $CORENLP_THREADS
