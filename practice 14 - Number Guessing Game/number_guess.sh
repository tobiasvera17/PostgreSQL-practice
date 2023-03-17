#! /bin/bash
#Program that randomly generates a number that users have to guess

PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

echo "Enter your username:"
read USERNAME

# function to play game
PLAY_GAME(){
  echo "Guess the secret number between 1 and 1000:"
  # generate random number
  NUMBER=$(( $RANDOM % 1000 + 1))
  # read first guess and increase the number_of_guesses variable
  read GUESS
  NUMBER_OF_GUESSES=1

  # until the guess is correct 
  until [[ $GUESS == $NUMBER ]]
  do
    # check if the guess is a number
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
      # check if the guess is less than the random number
      if [[ $GUESS -lt $NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi
    else
      echo "That is not an integer, guess again:"
    fi

    # read guess and increase the number_of_guesses variable
    read GUESS 
    (( NUMBER_OF_GUESSES++ ))
  done
  
  # when the user guesses correctly, insert data to the games table
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
  INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
}

# if no username was entered
if [[ -z $USERNAME ]]
then
  echo "You should enter a username to play."
else
  # if the username lenght > 22 characters
  if [[ $(echo "$USERNAME" | wc -m) -gt 23 ]]
  then
    echo "Username lenght should be less or equal to 22 characters." 
  else
    # get user_id from username
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    # if the user is not registered
    if [[ -z $USER_ID ]]
    then
      # insert new user
      INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
      if [[ $INSERT_USER == "INSERT 0 1" ]]
      then
        echo "Welcome, $USERNAME! It looks like this is your first time here."
        USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
        PLAY_GAME    
      else
        echo "There was a problem with your registration. Make sure your username lenght is less or equal to 22 characters."
      fi
    # if the user is already registered
    else
      USER_INFO=$($PSQL "SELECT COUNT(game_id), MIN(number_of_guesses) FROM users LEFT JOIN games USING(user_id) WHERE username='$USERNAME'") 
      echo $USER_INFO | while read COUNT_GAMES BAR MIN_GUESSES
      do
        echo "Welcome back, $USERNAME! You have played $COUNT_GAMES games, and your best game took $MIN_GUESSES guesses."
      done
      PLAY_GAME
    fi
  fi
fi