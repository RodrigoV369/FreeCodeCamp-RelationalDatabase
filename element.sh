#!/bin/bash

# Info about an especific element from the periodic table

# Database conection
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Not found message
NOT_FOUND(){
	echo "I could not find that element in the database."
	exit
}

MAIN(){
	# Check sent parameters
	if [[ ! $1 ]]
	then
		echo "Please provide an element as an argument."
		exit
	fi

	SEARCH_PARAM=$1

	# Search depending on type of parameter sent
	if [[ $SEARCH_PARAM =~ ^[0-9]+$ ]]
	then
		ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $SEARCH_PARAM;")
	else
		ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$SEARCH_PARAM' OR name = '$SEARCH_PARAM' ;")
	fi
	
	# Check if not found
	if [[ -z $ATOMIC_NUMBER ]]
	then
		NOT_FOUND
	fi
	
	# Get element info
	ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER;")

	# Iterate through info
	echo $ELEMENT_INFO | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_C BOILING_POINT_C
	do
		# Print info with the especified format
		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_C celsius and a boiling point of $BOILING_POINT_C celsius."
	done

}

# Call MAIN function
MAIN $1
