#!/bin/bash
# Start all Termux Global Server services
echo "🚀 Starting Termux Global Server..."

# Start Nginx
echo "🌐 Starting Nginx..."
nginx

# Start Web Terminal
echo "💻 Starting Web Terminal..."
nohup ttyd -p 3000 bash > /dev/null 2>&1 &

# Start SSH Server
echo "🔐 Starting SSH Server..."
sshd -p 8022

# Start SOCKS Proxy
echo "🛡️ Starting SOCKS Proxy..."
nohup ssh -D 1080 -N -f localhost -p 8022 > /dev/null 2>&1 &

# Start Web Tunnel
echo "🌍 Starting Global Tunnel..."
nohup ssh -o ServerAliveInterval=60 -R 80:localhost:8080 myserver.localhost.run > /dev/null 2>&1 &

# Start Service Manager
echo "⚡ Starting Auto-Recovery Manager..."
nohup ./scripts/server-manager.sh > /dev/null 2>&1 &

echo "✅ All services started!"
echo "📊 Check status: ./scripts/status.sh"
