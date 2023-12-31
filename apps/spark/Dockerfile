FROM eclipse-temurin:17-jre-jammy

ARG spark_uid=185

RUN groupadd --system --gid=${spark_uid} spark && \
    useradd --system --uid=${spark_uid} --gid=spark spark

RUN set -ex; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y dialog apt-utils gnupg2 wget bash tini libc6 libpam-modules krb5-user libnss3 procps net-tools gosu libnss-wrapper mc lsof inetutils-ping netcat; \
    apt install -y python3 python3-pip && \
    mkdir -p /opt/spark; \
    mkdir /opt/spark/python; \
    mkdir -p /opt/spark/examples; \
    mkdir -p /opt/spark/work-dir; \
    chmod g+w /opt/spark/work-dir; \
    touch /opt/spark/RELEASE; \
    chown -R spark:spark /opt/spark; \
    echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su;

RUN pip3 install --upgrade pip
RUN pip3 install pyspark awswrangler boto3 findspark gimme-aws-creds keyrings.alt virtualenv ipychart thrift pyhive

# Install Apache Spark
# https://downloads.apache.org/spark/KEYS

ENV SPARK_VERSION 3.5.0
ENV HADOOP_VERSION 3
ENV SPARK_ARCHIVE spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN set -ex; \
    export SPARK_TMP="$(mktemp -d)"; \
    cd $SPARK_TMP; \
    wget -nv -O spark.tgz "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_ARCHIVE}"; \
    tar -xf spark.tgz --strip-components=1; \
    chown -R spark:spark .; \
    mv jars /opt/spark/; \
    mv bin /opt/spark/; \
    mv sbin /opt/spark/; \
    mv kubernetes/dockerfiles/spark/decom.sh /opt/; \
    mv examples /opt/spark/; \
    mv kubernetes/tests /opt/spark/; \
    mv data /opt/spark/; \
    mv python/pyspark /opt/spark/python/pyspark/; \
    mv python/lib /opt/spark/python/lib/; \
    mv R /opt/spark/; \
    chmod a+x /opt/decom.sh; \
    cd ..; \
    rm -rf "$SPARK_TMP";

ENV DELTA_CORE 2.4.0
ENV DELTA_VERSION 3.0.0
ENV SCALA_VERSION 2.12
ENV SPARK_HOME /opt/spark
ENV JAVA_HOME=/opt/java/openjdk

RUN wget https://repo1.maven.org/maven2/io/delta/delta-core_$SCALA_VERSION/$DELTA_CORE/delta-core_$SCALA_VERSION-$DELTA_CORE.jar -P $SPARK_HOME/jars/ && \
    wget https://repo1.maven.org/maven2/io/delta/delta-storage/$DELTA_VERSION/delta-storage-$DELTA_VERSION.jar -P $SPARK_HOME/jars/


COPY ./apps/spark/entrypoint.sh /opt/
COPY ./apps/spark/run.sh /opt/
COPY ./apps/spark/scripts /scripts

WORKDIR /opt/spark/work-dir

USER spark

ENTRYPOINT [ "/opt/entrypoint.sh" ]
CMD [ "/opt/run.sh" ]
