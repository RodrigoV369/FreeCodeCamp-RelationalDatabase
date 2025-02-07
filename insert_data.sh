#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "Iniciando insercion de datos"

echo $($PSQL "TRUNCATE games, teams;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do
	if [[ $YEAR != year ]]
		then
		#Search winner_id
		WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")	

		if [[ -z $WINNER_ID ]]
		then
			INSERT_WINNER_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")

			if [[ $INSERT_WINNER_ID == "INSERT 0 1" ]]
			then
				echo "Inserted $WINNER in teams table"
			fi
			WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")	

		fi

		#Search opponent_id
		OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")	

		if [[ -z $OPPONENT_ID ]]
		then
			INSERT_OPPONENT_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")

			if [[ $INSERT_OPPONENT_ID == "INSERT 0 1" ]]
			then
				echo "Inserted $OPPONENT in teams table"
			fi
			OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")	

		fi

		# Insert games

		INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WIN_GOALS, $OPP_GOALS);")

		if [[ $INSERT_GAME == "INSERT 0 1" ]]
		then
			echo "ok"
		fi

	fi
done	
