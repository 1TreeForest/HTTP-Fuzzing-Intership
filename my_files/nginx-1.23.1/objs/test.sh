#!/bin/sh
SERVER_PORT=$1

pid=`lsof -i:$SERVER_PORT | grep "root" | grep -v "grep" | awk '{print $2}'`
echo $pid
gdb attach -q $pid <<__EOF__
p (size_t) __gcov_dump_one()
__EOF__
