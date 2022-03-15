#!/bin/bash
HN=`hostname`
FQDN=`hostname --fqdn`
LOGFILE="/tmp/auth.log"
HISTFILE="/root/.bash_history"
EMAIL_TO="admins@telehouse.solutions"
EMAIL_FROM="root@$FQDN"


#if [ "${PAM_TYPE}" = "open_session" ]; then
#if [ -x $SHELL ];then
 SUBJECT="$HN: SSH Login: ${PAM_USER}@${PAM_RHOST}"
 MESSAGE="
	A user ${PAM_USER} signed into server $HN through SSH.
	--------------------------------------------------------------
	Username: ${PAM_USER}
	IP Address: ${PAM_RHOST}
	DateTime: `date`
	--------------------------------------------------------------

	Who is logged:
	`w`
	--------------------------------------------------------------

	Last logged users:
	`last | head -n10`
	--------------------------------------------------------------

	Exported ENV:
	`export | grep -wv 'LS_COLORS\|bg_BG.UTF-8'`
	--------------------------------------------------------------
  "

 tail -1000 /var/log/auth.log > $LOGFILE
 
 echo "${MESSAGE}" | mail -A $LOGFILE -A $HISTFILE -n -r "${EMAIL_FROM}" -s "${SUBJECT}" "${EMAIL_TO}"


exit 0
