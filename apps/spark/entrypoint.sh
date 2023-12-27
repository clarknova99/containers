#!/usr/bin/env bash

# start master
$SPARK_HOME/sbin/start-master.sh

#start workers
$SPARK_HOME/sbin/start-workers.sh spark://spark:7077
