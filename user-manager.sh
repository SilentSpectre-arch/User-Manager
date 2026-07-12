#/bin/bash
echo "=============================="
echo
echo "	   User Manager Program     "
echo
echo "=============================="
echo
echo "1)Add User"
echo
echo "2)Delete User"
echo
echo "3)Lock User"
echo
echo "4)Unlock User"
echo
echo "5)Change Password"
echo
echo "6)User Info"
echo
echo "7)Lists User"
echo
echo "8)Exit"

read -p "Select an option: " select

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

