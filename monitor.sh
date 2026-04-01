#!/bin/bash
# =============================================
# System Health Monitor
# Author: Your Name
# Description: Monitors CPU, RAM, Disk usage
# =============================================

echo "========================================"
echo "       SYSTEM HEALTH REPORT"
echo "  Date: $(date)"
echo "========================================"

# CPU Usage
echo ""
echo "📊 CPU USAGE:"
top -bn1 | grep "Cpu(s)" | awk '{print "  Used: " $2 "%  |  Idle: " $8 "%"}'

# RAM Usage
echo ""
echo "🧠 MEMORY USAGE:"
free -h | awk 'NR==2{printf "  Used: %s / Total: %s (%.1f%%)\n", $3, $2, $3/$2*100}'

# Disk Usage
echo ""
echo "💾 DISK USAGE:"
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print "  " $6 " → Used: " $3 " / Total: " $2 " (" $5 ")"}'

# Top 5 Processes
echo ""
echo "🔥 TOP 5 PROCESSES (by CPU):"
ps aux --sort=-%cpu | awk 'NR<=6{printf "  %-20s %s%%\n", $11, $3}'

echo ""
echo "========================================"
echo "  ✅ Report Complete"
echo "========================================"
