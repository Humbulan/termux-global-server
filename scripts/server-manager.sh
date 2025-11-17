#!/bin/bash
# Auto-Recovery Service Manager
SERVER_LOG="$HOME/server-manager.log"

log() {
    echo "$(date): $1" >> "$SERVER_LOG"
}

ensure_service() {
    local service_name="$1"
    local check_cmd="$2"
    local start_cmd="$3"
    
    if ! eval "$check_cmd" > /dev/null 2>&1; then
        log "Starting $service_name..."
        eval "$start_cmd"
        log "$service_name started"
    fi
}

# Main management loop
while true; do
    # Ensure Nginx is running
    ensure_service "Nginx" "pgrep nginx" "nginx"
    
    # Ensure ttyd is running
    ensure_service "Web Terminal" "pgrep ttyd" "nohup ttyd -p 3000 bash > /dev/null 2>&1 &"
    
    # Ensure SSH server is running
    ensure_service "SSH Server" "pgrep sshd" "sshd -p 8022"
    
    # Ensure web tunnel is running
    ensure_service "Web Tunnel" "pgrep -f 'ssh -R 80:localhost:8080'" "nohup ssh -o ServerAliveInterval=60 -R 80:localhost:8080 myserver.localhost.run > /dev/null 2>&1 &"
    
    sleep 30
done
