#!/bin/bash
# =====================================================
# Script Name: run_commands.sh
# Author: Srushti Dave
# Task: Setup and Use a Firewall on Linux (UFW)
# Description: Automates UFW configuration and testing
# =====================================================

echo "-------------------------------------------"
echo "🔍 Checking current UFW status..."
echo "-------------------------------------------"
sudo ufw status verbose

echo ""
echo "-------------------------------------------"
echo "🟢 Enabling UFW firewall..."
echo "-------------------------------------------"
sudo ufw enable

echo ""
echo "-------------------------------------------"
echo "🛡️ Allowing SSH (Port 22)..."
echo "-------------------------------------------"
sudo ufw allow 22/tcp

echo ""
echo "-------------------------------------------"
echo "⛔ Blocking Telnet (Port 23)..."
echo "-------------------------------------------"
sudo ufw deny 23/tcp

echo ""
echo "-------------------------------------------"
echo "📜 Listing all active rules..."
echo "-------------------------------------------"
sudo ufw status numbered

echo ""
echo "-------------------------------------------"
echo "🧪 Testing Telnet connection (Expected to fail)..."
echo "-------------------------------------------"
nc -vz localhost 23 || echo "✅ Connection refused as expected (Telnet blocked)."

echo ""
echo "-------------------------------------------"
echo "🧹 Removing Telnet rule (Restoring state)..."
echo "-------------------------------------------"
sudo ufw delete deny 23/tcp

echo ""
echo "-------------------------------------------"
echo "📤 Exporting final UFW rules to ufw_rules.txt..."
echo "-------------------------------------------"
sudo ufw status numbered | sudo tee ufw_rules.txt

echo ""
echo "✅ Firewall configuration complete."
echo "Check 'ufw_rules.txt' for exported rules."
echo "-------------------------------------------"
