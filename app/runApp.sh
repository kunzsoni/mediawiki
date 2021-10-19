#!/bin/sh
export LD_LIBRARY_PATH=$LD_LIBARARY_PATH:/opt/rh/httpd24/root/usr/lib64
/opt/rh/httpd24/root/usr/sbin/httpd -k  start
