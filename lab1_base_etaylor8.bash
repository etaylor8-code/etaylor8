#!/bin/bash

#OUTPUT="group4_matrix_base.txt"
OUTPUT="group4_gateway_base.txt"
#OUTPUT="group4_vm2_base.txt"
#OUTPUT="group4_vm3_base.txt"
#OUTPUT="group4_vm4_base.txt"

EMPTYSPACE=" "


yum install lshw -y

echo "Hostname:" >> $OUTPUT
hostname >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "disk/partition size, usage, and mount points:" >> $OUTPUT
df >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "IP address, broadcast, and netmask for each active device:" >> $OUTPUT
ip a >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "OS version/release level:" >> $OUTPUT
cat /etc/os-release >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "Kernel version:" >> $OUTPUT
uname -r >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "security mode (SELinux status):" >> $OUTPUT
getenforce >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "firewall configuration:" >> $OUTPUT
firewall-cmd --list-all >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "list of active repositories:" >> $OUTPUT
yum repolist enabled >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "number of software packages (rpm, deb, etc) installed:" >> $OUTPUT
yum list installed | wc -l  >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "name of software packages installed" >> $OUTPUT
yum list installed >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "dns server configured (which dns server(s) will be used for the local resolver):" >> $OUTPUT
cat /etc/resolv.conf >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "List of active shell users:" >> $OUTPUT
cat /etc/passwd  >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT
 
echo "hardware details: cpu, main memory size, swap memory configure, devices, etc:" >> $OUTPUT
lshw >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "date the os was first installed:" >> $OUTPUT
rpm -qi basesystem >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "list services currently running" >> $OUTPUT
systemctl >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT

echo "list services that are installed but not running" >> $OUTPUT
systemctl --all | grep inactive >> $OUTPUT
echo $EMPTYSPACE >> $OUTPUT


