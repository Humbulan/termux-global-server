#!/bin/bash
# Service Status Check
echo "=== 🏆 TERMUX GLOBAL SERVER STATUS ==="
echo "🌐 Nginx:         $(pgrep nginx | wc -l) processes"
echo "💻 ttyd:          $(pgrep ttyd | wc -l) processes" 
echo "🔐 SSH Server:    $(pgrep sshd | wc -l) processes"
echo "🛡️ SOCKS Proxy:   $(pgrep -f 'ssh -D 1080' | wc -l) processes"
echo "🌍 Web Tunnel:    $(pgrep -f 'ssh -R 80:localhost:8080' | wc -l) processes"
echo "⚡ Service Manager: $(pgrep -f server-manager | wc -l) processes"
echo ""
echo "📊 Public URLs:"
echo "   Web Dashboard: https://42f2c388e88812.lhr.life/"
echo "   Web Terminal:  https://42f2c388e88812.lhr.life/terminal/"
