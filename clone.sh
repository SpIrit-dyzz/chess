#!/bin/bash
if [ -z $1 ];then
	echo "请输入参数"
	exit 1
fi

cd /var/lib/libvirt/images/
if [ -e ${1}.img ];then
	echo "文件存在"
	exit 1
else
	qemu-img create -b .node_base.qcow2 -f  qcow2 ${1}.img 20G
fi

cd /etc/libvirt/qemu
if [ -e ${1}.xml ];then
	echo "文件已存在"
	exit 1
else
	sed  "s,node_base,$1,g" /var/lib/libvirt/images/.node_base.xml > /etc/libvirt/qemu/${1}.xml
fi

virsh define /etc/libvirt/qemu/${1}.xml
virsh start ${1}
