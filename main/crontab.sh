
creat_crontab_jop (){
	read -p "Enter hour of day (0 - 23): " hour
	read -p "Enter minute of day (0 - 59): " min
	read -p "Enter day of month (1 - 31): " dom
	read -p "Enter month of the year (1 - 12) OR jan,feb,mar,apr ...: " monthoy
	read -p "Enter day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat: " dow
	read -p "Enter user who will run the crontab if you don't need add one press Enter: " runUser
	read -p "Enter command: " Cmd
	echo " $min $hour $dom $monthoy $dow $runUser $Cmd " >> /etc/crontab
}
