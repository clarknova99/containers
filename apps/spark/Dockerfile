FROM eclipse-temurin:11-jre-focal

ARG spark_uid=1000

RUN groupadd --system --gid=${spark_uid} spark && \
    useradd --system --uid=${spark_uid} --gid=spark spark

RUN set -ex && \
    apt-get update && \
    ln -s /lib /lib64 && \
    apt install -y gnupg2 wget bash tini libc6 libpam-modules krb5-user libnss3 procps net-tools gosu curl && \
    apt install -y python3 python3-pip && \
    rm /bin/sh && \
    ln -sv /bin/bash /bin/sh


RUN pip3 install --upgrade pip
RUN pip3 install pyspark awswrangler boto3 findspark gimme-aws-creds keyrings.alt virtualenv ipychart thrift pyhive

RUN apt install -y mc lsof inetutils-ping netcat

ENV SPARK_VERSION 3.3.1
ENV HADOOP_VERSION 3
ENV DELTA_CORE 2.4.0
ENV DELTA_VERSION 3.0.0
ENV SCALA_VERSION 2.13

WORKDIR /opt
# Spark
ENV SPARK_ARCHIVE spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN wget "https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/${SPARK_ARCHIVE}" && \
#    tar -xf $SPARK_ARCHIVE && \
    tar xvf $SPARK_ARCHIVE --one-top-level=/opt/spark --strip-components 1 && \
    rm $SPARK_ARCHIVE
ENV SPARK_DIR /opt/spark
ENV SPARK_HOME /opt/spark
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# DeltaLake
RUN wget https://repo1.maven.org/maven2/io/delta/delta-core_$SCALA_VERSION/$DELTA_CORE/delta-core_$SCALA_VERSION-$DELTA_CORE.jar -P $SPARK_DIR/jars/ && \
    wget https://repo1.maven.org/maven2/io/delta/delta-storage/$DELTA_VERSION/delta-storage-$DELTA_VERSION.jar -P $SPARK_DIR/jars/

# Spark port
EXPOSE 7077
EXPOSE 4040
# Spark master web ui port
EXPOSE 8060
# Spark worker1 web ui port
EXPOSE 8061
# Spark worker2 web ui port
EXPOSE 8062
 # Thrift ODBC/JDBC port
EXPOSE 10000
# Kyuubi JDBC port
# EXPOSE 10009
# Spark history web ui port
EXPOSE 18080
# Metastore thrift
EXPOSE 9083

#Spark notebook port
EXPOSE 8888


COPY ./apps/spark/entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
