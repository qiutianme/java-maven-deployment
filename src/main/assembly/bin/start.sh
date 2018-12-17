#!/usr/bin/env bash

bin_dir=$(cd `dirname $0`;pwd)
root_dir=${bin_dir}/../
lib_dir=${root_dir}/lib
conf_dir=${root_dir}/conf
log_dir=${root_dir}/logs

source ${bin_dir}/env.sh

export ROOT_DIR=${root_dir}
export LD_LIBRARY_PATH=${lib_dir}:${lib_dir}/camera:$LD_LIBRARY_PATH
nohup java -server \
-XX:+PrintGCDateStamps -verbose:gc -XX:+PrintGCDetails -Xloggc:"${log_dir}/gc.log" \
-XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M \
-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=${log_dir}/`date +%Y-%m-%d_%H-%M-%S`.hprof \
-cp "${lib_dir}/${JAR_NAME}" ${MAIN_CLASS} &