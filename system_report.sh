#!/bin/bash

# ---- Step 1: Greet the user ----
echo "Hello Himanshu Toshniwal, welcome to the system!"
echo ""

# ---- Step 2: Get and show date and time ----
date_time=$(date)
echo "Current date and time: $date_time"
echo ""

# ---- Step 3: Get uptime and last login info ----
uptime_info=$(uptime -p)
last_login=$(last -a | head -n 5)
echo "Uptime of the server: $uptime_info"
echo ""
echo "Last Login Details:"
echo "$last_login"
echo ""

# ---- Step 4: Show disk space and RAM utilization ----
disk_space=$(df -h)
RAM_utilization=$(free -h)
echo "Disk Space:"
echo "$disk_space"
echo ""
echo "RAM Utilization:"
echo "$RAM_utilization"
echo ""

# ---- Step 5: Show top CPU processes ----
cpu_processes=$(ps aux --sort=-%cpu | awk 'NR<=10')
echo "Top CPU consuming processes:"
echo "$cpu_processes"
echo ""

# ---- Step 6: Show logged-in users ----
echo "Currently logged-in users:"
who
echo ""

# ---- Step 7: Show CPU temperature and load average ----
echo "System Load and Temperature:"
if command -v sensors &> /dev/null; then
    sensors_output=$(sensors)
else
    sensors_output="sensors not installed. Install with: sudo apt install lm-sensors"
fi
load_avg=$(cat /proc/loadavg)
echo "Load Average: $load_avg"
echo "CPU Temperature Info:"
echo "$sensors_output"
echo ""

# ---- Step 8: Show software updates ----
echo "Available Updates (if any):"
if command -v apt &> /dev/null; then
    updates=$(apt list --upgradable 2>/dev/null | tail -n +2)
    echo "$updates"
else
    echo "APT not available on this system."
fi
echo ""

# ---- Step 9: List installed packages count ----
if command -v dpkg &> /dev/null; then
    total_packages=$(dpkg -l | wc -l)
    echo "Total installed packages: $total_packages"
fi
echo ""

# ---- Step 10: Log report to a file ----
log_dir="$HOME/system_logs"
mkdir -p "$log_dir"
log_file="$log_dir/system_report_$(date +%Y-%m-%d_%H-%M-%S).log"

{
    echo "System Report - $date_time"
    echo "--------------------------------"
    echo "Uptime: $uptime_info"
    echo "Logged-in users:"
    who
    echo ""
    echo "Disk Space:"
    echo "$disk_space"
    echo ""
    echo "RAM:"
    echo "$RAM_utilization"
    echo ""
    echo "CPU Top Processes:"
    echo "$cpu_processes"
    echo ""
    echo "Load Average: $load_avg"
    echo "Temperature Info:"
    echo "$sensors_output"
    echo ""
    echo "Updates Available:"
    echo "$updates"
    echo ""
    echo "Total Installed Packages: $total_packages"
} >> "$log_file"

echo "System report saved to $log_file"
echo ""


# ---- Step 10: Real-time CLI Dashboard with htop-like output (using watch) ----
# You can add a real-time CLI dashboard using `watch`
echo "Monitoring system in real-time..."
watch -n 1 'df -h && free -h && uptime'


# ---- Step 11: Alert System for Disk Space or RAM Usage ----
# Check if disk space or RAM usage is above 80% and alert the user
disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
ram_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

if [ $disk_usage -gt 80 ]; then
    echo "Warning: Disk usage is above 80%!"
    # You can also send an email or Telegram notification here if required
fi

if (( $(echo "$ram_usage > 80" | bc -l) )); then
    echo "Warning: RAM usage is above 80%!"
    # You can also send an email or Telegram notification here if required
fi


echo "----THIS IS ALL ABOUT YOUR INFORMATION----"
