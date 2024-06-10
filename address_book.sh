#!/bin/sh

create_addr_book(){
	while :
	do
	echo "Enter the name of the addressbook you want to create: "
	read fname

	res=`ls | grep $fname | wc -w`

	if [ $res -gt 0 ]
	then
		echo "File is present. Please enter another name!"
	else
		echo "Creating new file..."
		touch $fname
		echo "File is created succesfully!"
		echo 'Nfame Surname Email Phone' >> $fname
		break
	fi
	done

}

display(){
	echo "Enter the name of addressbook you want to see: "
	read fname
	res=`ls | grep $fname | wc -w`
	if [ $res -gt 0 ]
	then 
		echo " "
		echo "*************** $fname **************"
		echo " "
		cat $fname
		echo " "
		echo "*************** The End **************"
		echo " "
	else
		echo "No such adressbook is present. Sorry!"
	fi
}


add_entries(){
	
	echo "*********** ADD Data in this Format ********************"
	echo " "
	echo " Name     Surname       Email       Phone "

	echo "Enter the name of the addressbook: "
	read fname

	res=`ls | grep $fname | wc -w`

	if [ $res -gt 0 ]
	then
		echo "File is present."
		echo "Enter the name: "
		read name
		
		echo "Enter the surname: "
		read surname

		echo "Enter the email: "
		read email

		echo "Enter the phone number: "
		read phone
		
		`echo $name $surname $email $phone >> $fname`
			
	else
		echo "File is not available!"
		break
	fi
	
}



edit(){
	
	echo "**** Search for the record via phone number. if the record exits, editing begins.... ******"

	echo "Enter the name of the addressbook: "
	read fname

	res=`ls | grep $fname | wc -w`

	if [ $res -gt 0 ]
	then
		echo "Addressbook is present."
		echo "Enter the phone number: "
		read phone
		phoneres=`cat $fname | grep $phone | wc -w`
		
		if [ $phoneres -gt 0 ]
		then
			echo "Record is present"
			oldrecord=`cat $fname | grep $phone`
			echo "Old Record: $oldrecord"
			
			echo "Enter the name:"
			read name
			
			echo "Enter the surname:"
			read surname

			echo "Enter the new email:"
			read nemail
			
			echo "Enter the new phone number:"
			read nphone
			newrecord=`echo $name $surname $nemail $nphone`
			echo "New Record: $newrecord"

			sed -i s/"$oldrecord"/"$newrecord"/g $fname


		else
			echo "Sorry! Record in not available!"
		fi
		
			
	else
		echo "Adressbook is not available!"
	fi
	
}



remove(){
	
	echo "**** Search for the record via phone number. if the record exits, delete begins.... ******"

	echo "Enter the name of the addressbook: "
	read fname

	res=`ls | grep $fname | wc -w`

	if [ $res -gt 0 ]
	then
		echo "Addressbook is present."
		echo "Enter the phone number for deletion: "
		read phone
		phoneres=`cat $fname | grep $phone | wc -w`
		
		if [ $phoneres -gt 0 ]
		then
			echo "Record is present"
			oldrecord=`cat $fname | grep $phone`
			echo "Found Record: $oldrecord"

			sed -i s/"$oldrecord"//g $fname
			sed -i /^$/d $fname
			
			echo "Record is deleting...... Deleted Successfully"


		else
			echo "Sorry! Record in not available!"
		fi
		
			
	else
		echo "Adressbook is not available!"
	fi
	
}

list_book(){

	ls | grep ".txt"
	echo ""
	echo ""
}


while :
do
echo ""
echo "****************** M E N U *********************"
echo "1) Create Address Book "
echo "2) Add Entry "
echo "3) Edit Entry"
echo "4) Display Address Book"
echo "5) Remove Entry"
echo "6) List Available Address Book"
echo "7) Exit"



echo "What would you like to do: "
read choice
clear
case $choice in
	1) create_addr_book ;;
	2) add_entries ;;
	3) edit ;;
	4) display ;;
	5) remove ;;
	6) list_book ;;
	7) exit ;;
	*) echo "please enter a valid option"
esac
done

echo

echo "Quote for the day: The world will ask you who you are. And if you didn't know, the world will tell you!"







































