# Create the complete README.md file
cat > README.md << 'EOF'
# 🌐 Termux Global Server

**Enterprise-grade server infrastructure on Android Termux - Zero Cost, Global Access**

![Platform](https://img.shields.io/badge/Platform-Android_Termux-green)
![Cost](https://img.shields.io/badge/Cost-100%25_FREE-success)
![Status](https://img.shields.io/badge/Status-PRODUCTION_READY-brightgreen)

## 🎯 Project Overview
Transform your Android device into a global server with zero costs. This project deploys a complete web infrastructure using Termux without root access.

## 🚀 Live Demo
- **🌐 Web Dashboard**: https://42f2c388e88812.lhr.life/
- **💻 Web Terminal**: https://42f2c388e88812.lhr.life/terminal/
- **🔐 SSH Access**: 192.168.8.26:8022
- **🛡️ SOCKS Proxy**: 192.168.8.26:1080

## 🏗️ Architecture
- **Nginx Web Server** (Port 8080)
- **ttyd Web Terminal** (Port 3000)
- **OpenSSH Server** (Port 8022)
- **SOCKS5 Proxy** (Port 1080)
- **Auto-Recovery System**
- **Global Tunnels** via localhost.run

## ⚡ Quick Start
```bash
git clone https://github.com/Humbulan/termux-global-server.git
cd termux-global-server
chmod +x scripts/*.sh
./scripts/start-services.sh
