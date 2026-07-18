#!/bin/bash

#==================================
#			User Manager
#===================================

add_user() {
	while true;do
		read -p "Enter Username: " username
		
		if id "$username" > dev/null 2>&1;then
			echo "Error: "$username" already exist"
			break
		else
			sudo adduser "$username"
			echo "Success: User $username created successfully"
			break
		fi

	done
}
			
delete_user() {
	while true;do
		read -p "Enter Username: " username

		if ! id "$username">/dev/null 2>&1;then
			echo "Error: User does not exist"
			break
		else
			sudo userdel $username
			echo "Success: $username eliminated"
			break
		fi
	done
}

lock_user() {
	while true;do
		read -p "Enter Username: " username

		if ! id >dev/null 2>&1;then
			echo "Error: Username does not exist"
			break
		else
			usermod -L $username
			echo "Success: The user account has been locked"
			break
		fi
	done
}

unlock_user() {
	while true;do
		read -p "Enter Username: " username

		if ! id "$username">/dev/null 2>&1;then
			echo "Error: User does not exist"
			break
		else
			sudo usermod -U "$username"
			echo "Success: User unlock"
			break
		fi
	done
}

change_password() {
	read -p "Enter Username:" username

	if ! id "$username" > /dev/null 2>&1;then
		echo "Error: User does not exist"
		exit 1
	else
		sudo passwd "$username"
		echo "Success: Password changed"
		exit 0
	fi
}

user_info() {
	read -p "Enter Username:" username
	
	if ! id > /dev/null 2>&1;then
		echo "Error: User does not exist"
		exit 1
	else
		sudo id "$username"
		exit 0
	fi
}

list_users() {
	if [[ $EUID -ne 0 ]];then
		echo "Error: Please run this script with sudo"
		exit 1
	else
		getent passwd | less
	
	fi
}


while true
do
	echo
	echo "1) Add User"
	echo
	echo "2) Delete User"
	echo
	echo "3) Lock User"
	echo
	echo "4) Unlock User"
	echo
	echo "5) Change Password"
	echo
	echo "6) User Information"
	echo
	echo "7) Users List"
	echo
	echo "0)Exit"

	read -p "Enter Your Choice: " choice

	case "$choice" in
		1)
			echo
			echo "Add User: $(add_user)"
			exit 0
			;;
		2)	
			echo
			echo "Delete User: $(delete_user)"
			exit 0
			;;

		3)
			echo
			echo "Lock User: $(lock_user)"
			exit 0
			;;

		4)
			echo
			echo "Unlock User: $(unlock_user)"
			exit 0
			;;

		5)
			echo
			echo "Change Pass: $(change_password)"
			exit 0
			;;

		6)
			echo
			echo "User Info: $(user_info)"
			exit 0
			;;

		7)
			echo
			echo "List Users: $(list_users)"
			exit 0
			;;
		
		0)
			echo
			echo "Exit"
			exit 0
			;;

		*)
			echo
			echo "Error: Enter a Valid Option"
			exit 2
			;;
	esac
done
