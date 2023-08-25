#!/bin/bash

#asks user for name, surname, age, address, phone#
#at the end prints all the information

#NOTE: regex = regular expression
#NOTE: [\n# $&:\s\t] this can be used for text msgs, ex: ayoo hello there!

#regexs
name_regex='^([A-Z]{1})([a-z]*)$' #in the state of California is legal to have a single letter as a first name
surname_regex='^([A-Z]{1})([a-z]*)$'
age_regex='^([1-9][1-9])$'
address_regex='^([A-Z]{1})([a-z]*\s)([A-Z]{2}\s)([0-9]*)$'
phone_regex='^([0-9]{10})$'


#~functions~
function invalid_syntax {
    echo "Invalid syntax..."
    echo "Please try again and double check if you miss spelled something"
    echo ""
}
while [[ ! $u_name =~ $name_regex ]]; do
    read -p "Name: " u_name
    if [[ $u_name =~ $name_regex ]]; then
        break
    else
        invalid_syntax
    fi
done

while [[ ! $u_surname =~ $surname_regex ]]; do
    read -p "Surname: " u_surname
    if [[ $u_surname =~ $surname_regex ]]; then
        break
    else
        invalid_syntax
    fi
done

while [[ ! $u_age =~ $age_regex ]]; do
    read -p "Age: " u_age
    if [[ $u_age =~ $age_regex ]]; then
        break
    else
        invalid_syntax
    fi
done

while [[ ! $u_phone =~ $phone_regex ]]; do
    read -p "Phone number: " u_phone
    if [[ $u_phone =~ $phone_regex ]]; then
        break
    else
        invalid_syntax
    fi
done

echo ""

while [[ ! $u_address =~ $name_regex ]]; do
    echo "format: Town + State abreviation + ZIP code"
    read -p "Address: " u_address
    if [[ $u_address =~ $address_regex ]]; then
        break
    else
        invalid_syntax
    fi
done

read -p "Are you sure about the info above? [y/n]: " u_answer
if [ $u_answer == "y" ]; then
    echo "okay, printing results..."
    sleep 1s
    echo ""
elif [ $u_answer == "n" ]; then
    echo "okay, re-sending registration form..."
    sleep 1s
    clear
    bash b32.sh
else
    echo "You typed: $u_answer"
    echo -e "Sorry, but you can only type:\n'n' = no\n'y' = yes"
    echo ""
fi

#asks user for name, surname, age, address, phone#

echo "------RESULTS-----"
echo ""
echo "Name: $u_name"
echo "Surname: $u_surname"
echo "Age: $u_age"
echo "Address: $u_address"
echo "Phone number: $u_phone"