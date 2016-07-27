#EASY SHAIRPORT SCRIPT
#WRITTEN BY PUPDAD
#YOU MAY HAVE TO CHANGE LINE 58 DEPENDING ON HOW YOU INSTALLED SHAIRPORT

#!/bin/bash
#Shairport execute with naming

echo "Welcome to the Easy Shairport Script!"
echo "Written by pupdad"
echo " "
echo "Leave this process running in the background and connect your device!"
echo "Control+C to exit"

echo " "
echo " "

#Checks for name save
[ -e ~/spn.dat ] && action=0 || action=1

#Finds value of action
case $action in
#If file exists
 0 )
 #Checks for flag
  while getopts 'r' flag; do
   case "${flag}" in
    r ) rename=true
    ;;
    * ) echo "Error, invalid flag!"
        echo "Quitting..."
        exit
    ;;
   esac
  done
  #Checks whether to rename
  if [ "$rename" = true ] ; then
   read -p "What should it be named?: " input
   echo "Saving name" $input "..."
   echo $input > ~/spn.dat
   file="~/spn.dat"
   name=$(cat "$file")
   (cd ~/projects/airplay/shairport && exec shairport --name=$name)
  else
   file="~/spn.dat"
   name=$(cat "$file")
   (cd ~/projects/airplay/shairport && exec shairport --name=$name)
  fi
 ;;
#If file doesn't exist
 1 )
  echo "Name save not found."
  echo " "
  read -p "What should it be named?: " input
  echo "Saving name" $input "..."
  echo $input > ~/spn.dat
  file="~/spn.dat"
  name=$(cat "$file")
#YOU MAY HAVE TO CHANGE THIS DEPENDING ON HOW YOU INSTALLED SHAIRPORT (Just change "~/projects/airplay/shairport" to whatever your shairport directory is (the one that has the main shairport script on the top level))
  (cd ~/projects/airplay/shairport && exec shairport --name=$name)
 ;;
esac

exit 0
