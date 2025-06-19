# 🖥️ System Monitoring Script

A Bash script that provides a detailed system health report and real-time resource monitoring in Linux (especially Ubuntu). It logs all critical information like uptime, resource usage, disk, RAM, CPU load, active users, and available updates in a formatted log file. Also alerts if RAM or disk usage exceeds 80%.

---

## 📌 Objectives

- To automate the collection of essential system information.
- To provide a real-time overview of system health using the CLI.
- To alert users when resources cross critical thresholds.
- To save a timestamped system report for future reference.

---

## 🛠️ Technologies Used

- **Bash Scripting**
- **Linux CLI Commands**:
  - `uptime`, `free`, `df`, `who`, `ps`, `sensors`, `watch`, etc.
- **System Utilities**:
  - `htop` or `watch` (for real-time monitoring)
  - `lm-sensors` (for CPU temperature)
  - `apt`, `dpkg` (for software updates and installed packages)
  - `bc` (for floating-point comparison)

---

## 🚀 Features

- 👋 Greets user and displays current time.
- 📅 Shows uptime and last login history.
- 💽 Displays disk usage and available space.
- 💾 Shows RAM utilization.
- 🔥 Lists top 10 CPU-consuming processes.
- 👤 Shows all currently logged-in users.
- 🌡️ Displays CPU temperature (if `lm-sensors` is installed).
- ⚙️ Checks and lists available package updates.
- 📦 Counts total installed packages.
- 🧾 Saves the report in a `system_logs` folder with timestamp.
- 📊 Provides real-time dashboard using `watch`.
- 🚨 Alerts user if RAM or disk usage crosses 80%.

---


