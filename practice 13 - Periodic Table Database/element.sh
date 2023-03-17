#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# if no argument is passed
if [[ -z $1 ]]
then
  echo -e "Please provide an element as an argument."
else
  # search for the element matching the atomic number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    TABLE_INFO=$($PSQL "SELECT elements.atomic_number,symbol,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE elements.atomic_number=$1")
  # search for the element matching the symbol or name
  elif [[ $1 =~ [a-z]* ]]
  then
    TABLE_INFO=$($PSQL "SELECT elements.atomic_number,symbol,name,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE elements.symbol='$1' OR elements.name='$1'")
    # echo "$TABLE_INFO"
  fi

  # if no matching element
  if [[ -z $TABLE_INFO ]]
  then
    echo -e "I could not find that element in the database."
  else
    #print the message containing the information of the element
    echo "$TABLE_INFO" | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
    do
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi