#!/bin/bash

echo "===== Server Performance Stats ====="

# Total CPU Usage
echo -e "\nCPU Usage:"
top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

# Total Memory Usage
echo -e "\nMemory Usage:"
free -m | awk 'NR==2 {printf "Used: %sMB, Free: %sMB, Percentage Used: %.2f%%\n", $3, $4, $3/$2 * 100}'

# Total Disk Usage
echo -e "\nDisk Usage:"
df -h | awk '$NF=="/"{printf "Used: %s, Free: %s, Percentage Used: %s\n", $3, $4, $5}'

# Top 5 Processes by CPU Usage
echo -e "\nTop 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -6

# Top 5 Processes by Memory Usage
echo -e "\nTop 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -6