


cat $0
exit 0;

//
VARIABLES()
#!/bin/bash
millennium_text="Years since the millennium:"
current_time=$( date '+%H:%M:%S' )
todays_date=$( date '+%F' )
year=$( date '+%Y' )
echo "Current time:" $current_time
echo "Today's date:" $todays_date
years_since_Y2K=$(( year - 2000 ))
echo $millennium_text $years_since_Y2K


//
INPUT()
#!/bin/bash
echo "Enter a number and hit \"Enter\""
read user_number1;
echo "Enter another number and hit \"Enter\""
read user_number2;
printf "You entered: %d and %d\n" $user_number1 $user_number2
printf "Added together they make: %d\n" $(( user_number1 + user_number2))

# We can combine the prompts into the read commands using the -p (prompt) option.
read -p "Enter a number and hit \"Enter\" " user_number1;
read -p "Enter another number and hit \"Enter\" " user_number2;
printf "You entered: %d and %d\n" $user_number1 $user_number2
printf "Added together they make: %d\n" $(( user_number1 + user_number2))

* capture keyboard input without having it echoed to the terminal window -s (silent) 
read -s -p "Enter your secret PIN and hit \"Enter\" " secret_PIN;
printf "\nShhh ... it is %d\n" $secret_PIN



//
PARAMETERS()
#!/bin/bash
printf "This script is called: %s\n" $0
printf "You used %d command line parameters\n" $#
# loop through the variables
for param in "$@"; do
  echo "$param"
done
echo "Parameter 2 was:" $2


//
FILES()
* read data from a file
#!/bin/bash
LineCount=0
while IFS='' read -r LinefromFile || [[ -n "${LinefromFile}" ]]; do
  ((LineCount++))
  echo "Reading line $LineCount: ${LinefromFile}"
done < "$1"


//
* -qe, -gt, -le, ...
* also support familiar  == , >= , <=  notation

FLOW()
#!/bin/bash
price=$1
if [[ price -ge 15 ]];
then
  echo "Too expensive."
else
  echo "Buy it!"
fi


//
LOOPS()
#!/bin/bash
for (( i=0; i<=$1; i++ ))
do
  echo "C-style for loop:" $i
done

for i in {1..4}
do
  echo "For loop with a range:" $i
done

for i in "zero" "one" "two" "three"
do
  echo "For loop with a list of words:" $i
done

for i in $website
do
  echo "For loop with a collection of words:" $i
done



//
FUNCTIONS()
#!/bin/bash
LineCount=0
function count_words() {
  printf "%d words in line %d\n" $(echo $1 | wc -w) $2
}

while IFS='' read -r LinefromFile || [[ -n "${LinefromFile}" ]]; do

  ((LineCount++))
  count_words "$LinefromFile" $LineCount

done < "$1"

count_words "This isn't in the loop" 99



