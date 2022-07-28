
default:	build

clean:
	rm -rf Makefile objs

.PHONY:	default clean

build:
	$(MAKE) -f objs/Makefile

install:
	$(MAKE) -f objs/Makefile install

modules:
	$(MAKE) -f objs/Makefile modules

upgrade:
	/home/fuzz/Desktop/fuzz//sbin/nginx -t

	kill -USR2 `cat /home/fuzz/Desktop/fuzz//logs/nginx.pid`
	sleep 1
	test -f /home/fuzz/Desktop/fuzz//logs/nginx.pid.oldbin

	kill -QUIT `cat /home/fuzz/Desktop/fuzz//logs/nginx.pid.oldbin`

.PHONY:	build install modules upgrade
