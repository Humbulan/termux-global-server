#!/bin/bash
# Backup all configurations
BACKUP_DIR="backups/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "💾 Backing up configurations to $BACKUP_DIR..."

# Backup config files
cp configs/* "$BACKUP_DIR/" 2>/dev/null
cp scripts/*.sh "$BACKUP_DIR/" 2>/dev/null

# Backup service status
./scripts/status.sh > "$BACKUP_DIR/status.txt"

# Create backup info
cat > "$BACKUP_DIR/backup-info.txt" << INFO
Termux Global Server Backup
Date: $(date)
Services: Nginx, ttyd, SSH, SOCKS, Tunnel
Public URL: https://42f2c388e88812.lhr.life/
Backup contains: Configs, Scripts, Status
INFO

echo "✅ Backup completed: $BACKUP_DIR"
echo "📁 Files backed up: $(ls "$BACKUP_DIR" | wc -l) files"
