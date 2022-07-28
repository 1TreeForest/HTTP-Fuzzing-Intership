#!/bin/sh
SERVER_PORT=$1

pid=`lsof -i:$SERVER_PORT | grep "root" | grep -v "grep" | awk '{print $2}'`
echo $pid
gdb -q attach $pid <<__EOF__
p (size_t) __gcov_dump()
__EOF__

