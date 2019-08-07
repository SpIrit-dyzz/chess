#!/bin/bash

while :  
do
        clear
        cpu=$(uptime |awk '{print $8,$9,$10}')
        echo -e "cpu负载为 \033[36m$cpu\033[0m"
        free -m | awk '/Mem/{print "内存剩余" ,$4, "MB"}'
        ifconfig  eth0| awk '/RX p/{print "eth0网卡接收数据量",$5,"字节"}'
        ifconfig  eth0| awk '/TX p/{print "eth0网卡发送数据量",$5,"字节"}'
        df -h|awk '/vda1/{print "硬盘剩余存储量",$4}'
        bao=$(rpm -qa |wc -l)
        echo -e "已安装包数量为 \033[36m$bao\033[0m 个"
        ps=$(ps aux|wc -l)
        echo -e "总进程数为 \033[36m$ps\033[0m 个"
        user=$(cat /etc/passwd | wc -l)
        echo -e "用户总数量为 \033[36m$user\033[0m 个"
        load=$(who | wc -l)
        echo -e "当前用户登录数量为 \033[36m$load\033[0m 个"
   sleep 20
done
