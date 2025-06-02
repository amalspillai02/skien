#!/bin/bash

LOG_FILE="/var/log/setup.log"
WEB_CONTENT_DIR="/var/www/html"
INDEX_FILE="$WEB_CONTENT_DIR/index.html"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | sudo tee -a "$LOG_FILE"
}

log "Starting web server setup"

yum install httpd -y
log "Apache installed."

firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
log "Port 80 opened."

systemctl start httpd
systemctl enable httpd
log "Apache service started."

echo "Hello from PowerShell!" > "$INDEX_FILE"
log "Created index.html with greeting text."

log "Web server setup completed."

