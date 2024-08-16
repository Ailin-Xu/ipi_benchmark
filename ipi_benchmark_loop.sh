#! /usr/bin/zsh

dmesg --clear
i=0
#LOOP=100
LOOP=10
#LOOP=1
while ((i < LOOP))
do
    echo ${i}/${LOOP}-loop
    insmod ipi_benchmark.ko
    ((i = i + 1))
done

dmesg
dmesg | sed  "s/\[.*\]//g" | ./average.awk

