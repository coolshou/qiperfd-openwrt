#!/bin/sh

killall qiperfd
opkg remove -o /tmp/qiperf qiperfd
