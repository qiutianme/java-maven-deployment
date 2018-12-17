#!/bin/sh

bin_dir=$(cd `dirname $0`;pwd)
source ${bin_dir}/env.sh

pid=`ps aux|grep "${JAR_NAME}"|grep -v grep|awk '{print $2}'`
echo "pid=$pid"
if [ "${pid}x" != "x" ];then
    kill -9 $pid
fi
