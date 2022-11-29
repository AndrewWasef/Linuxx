#!/bin/bash

creat_report_of_year (){
	read -p "Enter the path you want to creat report of the year the path end without / : " PrYear
	read -p "Enter the year of reports: " rYear
	mkdir -p $PrYear
	chmod 1660 $PrYear
	echo "please note user and group can read and write the reports but no one else can view or edit them and only owned by the user"
	touch $PrYear/$rYear-{01,03,05,07,08,10,12}-{01..31}.xls
	touch $PrYear/$rYear-{04,06,09,11}-{01..30}.xls
	touch $PrYear/$rYear-02-{01..28}.xls
	mkdir -p /home/manager/audit/reports/
	mkdir -p /root/backups/
	echo "00 02 * * 1-5 rsync -a $PrYear/ /home/manager/audit/reports/"  >> /etc/crontab
	echo "00 01 * * 1-5 tar cvf /root/backups/reports-\`date +%U-%u\`.tar $PrYear/"  >> /etc/crontab
	echo "plz note the reports will sync daily 02AM from MON to FRI to /home/manager/audit/reports"
	echo "plz note Backup the reports directory will be every day at 01 AM from MON to FRI to /root/backups/"
}

export -f creat_report_of_year


###########mkdir -p /home/USER/reports
###########touch /home/USER/reports/2021-{01,03,05,07,08,10,12}-{01..31}.xls
###########touch /home/USER/reports/2021-{04,06,09,11}-{01..30}.xls
###########touch /home/USER/reports/2021-02-{01..28}.xls
###########mkdir -p /home/manager/audit/reports/
###########00 02 * * 1-5 rsync -a /home/manager/audit/reports/ /home/manager/audit/reports/  >> /etc/crontab

