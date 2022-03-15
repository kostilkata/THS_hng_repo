#!/bin/bash

echo "session required pam_exec.so /opt/ths/bin/email_notifications-login.sh" >> /etc/pam.d/sshd 2>/dev/null || echo "Oops, something happen. Setup not completed!" 
