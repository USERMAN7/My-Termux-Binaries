#!/bin/bash
# Authour USERMAN7. Purpose of script
# to make installation of binaries easier.
red='\033[0;31m' # Red color -- for errors!
yel='\033[1;33m' # Yellow -- idk using for text..
green='\033[0;32m' # Green color -- for everything that ends with succes!
lblue='\033[1;34m' # Light blue -- for name of packages!
nc='\033[0m' # NO COLOR -- to return the text to original color!

 IFS=',' read -r -a fields < .conf
 for i in "${!fields[@]}"; do
     eval "parse$i='${fields[$i]}'"
     done

echo -e "$yel"This is a setting up utility for"$nc"
echo -e "$yel"Installation of programms in this repo"$nc"

# Achieved of picky install :)

echo -e "$yel""Would you like to install"$nc" "$lblue"chdman,flips,librespeed-cli,ytcast?"$nc""
echo -e "$green"Y"$nc"/"$red"n"$nc"? # I actually removed \n because in most cases it would be better to eye,
		# And with small screen res it would just resize automatically
read -r install # input -r flag for avoiding weird symbols from backspace
if [ $install == "Y" ]; then # Putting ALL binaries to termux default bin
	chmod +x *
	for i in "${!fields[@]}"; do
		mv ${fields[$i]} /data/data/com.termux/files/usr/bin 2> error.log || { echo -e "$red""Failed to put binaries to /bin! Exiting! $nc";
	       	exit 1; }
		
	done
elif [ $install == "y" ]; then # Same thing 
	chmod +x *
	for i in "${!fields[@]}"; do
		mv ${fields[$i]} /data/data/com.termux/files/usr/bin 2> error.log || { echo -e "$red""Failed to put binaries to /bin! Exiting! $nc";
	       	exit 1; }

	done
elif [ $install == "N" ]; then # BRAND NEW PICKY INSTALL!
	echo -e "$yel""Would you like to select which binaries you want to install?"$nc
	echo -e "$green"Y"$nc"/"$red"n"$nc"?"$nc"
	read -r install2 # Man that's a mangle of elif,ifs.. Should change to cases 
	if [ $install2 == "Y" ]; then
	       for i in "${!fields[@]}"; do
			echo -e "$yel""Would you like to install"$lblue" ${fields[$i]}"$nc"? ("$green"Y"$nc"/"$red"n"$nc")"
			read -r install3
			case "$install3" in # added cases
			 [Yy])
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin 2> error.log || {
					 echo -e "$red"Failed to move binary:"$lblue ${fields[$i]}";
					 exit 1; # || that code under || triggers only if something fails
				 }
				 ;;
			 [Nn])
				 echo -e "Skipping"$lblue" ${fields[$i]}" # picky install!
				 ;;
			      *)
				 echo -e ""$red"Invalid input."$nc" Skipping "$lblue"${fields[$i]}" # still skipping
			        ;;
			esac
		done		
	elif [ $install2 == "y" ]; then
		for i in "${!fields[@]}"; do
			echo -e "$yel""Would you like to install"$lblue" ${fields[$i]}"$nc"? ("$green"Y"$nc"/"$red"n"$nc")" # Literal copy of code above.
			read -r install3
			case "$install3" in
			 [Yy])
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin 2> error.log || {
					 echo -e "$red"Failed to move binary:"$lblue ${fields[$i]}";
					 exit 1;
				 }
				 ;;
			 [Nn])
				 echo -e "Skipping"$lblue" ${fields[$i]}"
				 ;;
			      *)
				 echo -e ""$red"Invalid input."$nc" Skipping "$lblue"${fields[$i]}"
			        ;;
			esac
		done
	else
		echo -e "$red"Exit!"$nc"; exit 
	fi		
elif [ $install == "n" ]; then
	echo -e "$yel""Whould you like to select which binaries you want to install?"$nc
	echo -e "$green"Y"$nc"/"$red"n"$nc"?
	read -r install2
	if [ $install2 == "Y" ]; then
	       for i in "${!fields[@]}"; do
			echo -e "$yel""Would you like to install"$lblue" ${fields[$i]}"$nc"? ("$green"Y"$nc"/"$red"n"$nc""
			read -r install3
			case "$install3" in
			 [Yy])
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin 2> error.log || {
					 echo -e "$red"Failed to move binary:"$lblue ${fields[$i]}";
					 exit 1;
				 }
				 ;;
			 [Nn])
				 echo -e "Skipping"$lblue" ${fields[$i]}"
				 ;;
			      *)
				 echo -e "$red""Invalid input."$nc" Skipping "$lblue"${fields[$i]}";
			        ;;
			esac
		done		
	elif [ $install2 == "y" ]; then
		for i in "${!fields[@]}"; do
			echo -e "$yel""Would you like to install"$lblue" ${fields[$i]}"$nc"? ("$green"Y"$nc"/"$red"n"$nc")"
			read -r install3
			case "$install3" in
			 [Yy])
				 chmod +x *
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin 2> error.log || {
					 echo -e "$red""Failed to move binary:$lblue ${fields[$i]}";
					 exit 1;
				 }
				 ;;
			 [Nn])
				 echo -e "Skipping "$lblue"${fields[$i]}"
				 ;;
			      *)
				 echo -e "$red""Invalid input."$nc" Skipping"$lblue" ${fields[$i]}"
			        ;;
			esac
		done
	else
		echo -e "$red""Exit!"$nc; exit 
	fi	
else
       echo -e "$red""Exiting!"$nc; exit 1
fi

#read install
#if [ $install == "y" ]; then
#	echo "Putting binaries to $PATH"
#	chmod +x *
#	mv flips chdman librespeed-cli ytcast /data/data/com.termux/files/usr/bin
#	echo "done"
#else
#	echo "aborting script."; exit
#fi
# Some old code here. It will be here for the reference
