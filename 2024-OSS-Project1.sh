#!/bin/bash
 file(){
	if [ $# -lt 3 ];then
		echo"usage: ./prj1_12214178_songjaemin.sh file1 file2 file3"
		exit 1
	fi
	file1=$1
	file2=$2
	file3=$3
}
menu1() {
	read -p "Do you want to get the Heung-Min Son's data? (y/n) :" answer
	if [ "$answer" = "y" ]; then
	  	 cat $file2 | awk -F ',' '$1~"Heung" {print "Team:"  $4,", Apperence:"  $6,", Goal:"  $7,", Assist:"  $8}'
	fi
}
menu2() {
	read -p "What do you want to get the team data of leage_position[1~20] :" answer
	cat $file1 | awk -F ',' -v answer=$answer '$6==answer {print $6, $1, $2/($2+$3+$4)}'
}
menu3() {
	read -p "Do you want to know Top-3 attendence data? (y/n) :" answer
	if ["$answer" = "y"]; then
		cat $file3

	fi
}
menu4() {
	echo "4"
}
menu5() {
	
	cat $file3 | awk -F ',' 'NR>1 {print $1}' | sed -E 's/([a-Z]{3}) ([0-9]{2}) ([0-9]{4})/\3\/\1\/\2/' | \
	sed -E 's/Jan/01/;s/Feb/02/;s/Mar/03/;s/Apr/04/;s/May/05/;s/Aug/08/;s/Sep/09/;s/Oct/10/;s/Nov/11/;s/Dec/12/' | head -n 10
}
menu6() {
	echo "6"
}
menu7() {
	echo "Bye!"
	exit 0
}

main() {
	file "$@"
	echo "************OSS1-Project1************"
	echo "*        StudentID: 12214178        *"
	echo "*        Name: Jaemin Song          *"
	echo "*************************************"

	while true; do
		echo "[MENU]"
		echo "1. Get the data of Heung-Min Son's Current Ciub, Appearances, Goals, Assists in players.csv"
		echo "2. Get the team data to enter a league position in team.csv"
		echo "3. Get the Top-3 Attendance matches in matches.csv"
		echo "4. Get the team's league position and team's top scorer in team.csv & players.csv"
		echo "5. Get the modified format of date_GMT in matches.csv"
		echo "6. Get the data of the winning team by the largest difference on home stadium in team.csv & matches.csv"
		echo "7. Exit"
		read -p "Enter your CHOICE (1~7) :" choice

		case $choice in
			1) menu1 ;;
			2) menu2 ;;
			3) menu3 ;;
			4) menu4 ;;
			5) menu5 ;;
			6) menu6 ;;
			7) menu7 ;;
		esac
	done
}

main "$@"
