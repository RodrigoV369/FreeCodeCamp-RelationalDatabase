#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
	if [[ $1 ]]
	then
		echo -e "\n$1"
	else
		echo -e "Welcome to My Salon, how can I help you?\n"
	fi

	SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
	echo "$SERVICES" | while read SERVICE_ID BAR NAME
	do
			echo -e "$SERVICE_ID) $NAME"
	done

	#Ask for selection
	read SERVICE_ID_SELECTED

	if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
	then
		MAIN_MENU "I could not find that service. What would you like today?"
	else
		SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

		if [[ -z $SERVICE_NAME ]]
		then
			MAIN_MENU "I could not find that service. What would you like today?"
		else
			#Ask for number
			echo -e "\nWhat's your phone number?"
			read CUSTOMER_PHONE
			CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
			if [[ -z $CUSTOMER_NAME ]]
			then
				#get name
				echo -e "\nI don't have a record for that phone number, what's your name?"
				read CUSTOMER_NAME
				#insert
				INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
			fi

			CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

			echo -e "\nWhat time would you like your$SERVICE_NAME,$CUSTOMER_NAME?"
			read SERVICE_TIME

			INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED);")

			if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
			then
				echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
			fi

		fi
	fi
}
MAIN_MENU
