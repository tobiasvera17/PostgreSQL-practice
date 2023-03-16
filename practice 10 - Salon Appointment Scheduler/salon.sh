#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT * FROM services")
  
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  
  # get service name
  RESULT_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  
  # if service not found 
  if [[ -z $RESULT_SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?\n"
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    
    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    # if doesn't exist
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi
    
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")
    
    # format service and customer names
    FORMATTED_SERVICE_NAME=$(echo $RESULT_SERVICE_NAME | sed 's/^* //')
    FORMATTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/^* //')

    echo -e "\nWhat time would you like your $FORMATTED_SERVICE_NAME, $FORMATTED_CUSTOMER_NAME?" 
    read SERVICE_TIME
    
    # insert appointment
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # if appointment inserted correctly
    if [[ $INSERT_APPOINTMENT == "INSERT 0 1" ]]
    then
      SERVICE_DETAILS=$($PSQL "SELECT ")
      echo -e "\nI have put you down for a $FORMATTED_SERVICE_NAME at $SERVICE_TIME, $FORMATTED_CUSTOMER_NAME."
    fi
  fi
}

MAIN_MENU "Welcome to My Salon, how can I help you?\n"