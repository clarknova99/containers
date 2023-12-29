#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail
#set -o xtrace


# Load Spark environment settings
#. /opt/spark/conf/spark-env.sh
SPARK_MODE=master


$SPARK_HOME/sbin/start-master.sh
#info "** Starting Spark in master mode **"
# if [ "$SPARK_MODE" == "master" ]; then
#     # Master constants
#     EXEC=$(command -v start-master.sh)
#     ARGS=()
#     info "** Starting Spark in master mode **"
# else
#     # Worker constants
#     EXEC=$(command -v start-worker.sh)
#     ARGS=("$SPARK_MASTER_URL")
#     info "** Starting Spark in worker mode **"
# fi
# if am_i_root; then
#     exec_as_user "$SPARK_DAEMON_USER" "$EXEC" "${ARGS[@]-}"
# else
#     exec "$EXEC" "${ARGS[@]-}"
# fi
