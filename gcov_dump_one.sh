#!/bin/sh
pid=`sudo top | grep "testcode" | grep -v "grep" | awk '{print $2}'`
echo $pid
gdb -q attach $pid <<__EOF__
p (size_t) __gcov_dump_one()
__EOF__

