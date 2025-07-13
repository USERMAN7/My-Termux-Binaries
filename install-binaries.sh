#!/bin/bash
# Authour USERMAN7. Purpose of script
# to make installation of binaries easier.

 IFS=',' read -r -a fields < .conf
 for i in "${!fields[@]}"; do
     eval "parse$i='${fields[$i]}'"
     done

echo "This is a setting up utility for"
echo "Installation of programms in this repo"

# Achieved of picky install :)

echo "Would you like to install chdman,flips,librespeed-cli,ytcast?"
echo "Y/n ?" # I actually removed \n because in most cases it would be better to eye,
		# And with small screen res it would just resize automatically
read -r install # input -r flag for avoiding weird symbols from backspace
if [ $install == "Y" ]; then # Putting ALL binaries to termux default bin
	chmod +x *
	for i in "${!fields[@]}"; do
		mv ${fields[$i]} /data/data/com.termux/files/usr/bin
	done
elif [ $install == "y" ]; then # Same thing 
	chmod +x *
	for i in "${!fields[@]}"; do
		mv ${fields[$i]} /data/data/com.termux/files/usr/bin
	done
elif [ $install == "N" ]; then # BRAND NEW PICKY INSTALL!
	echo "Whould you like to select which binaries you want to install?"
	echo "Y/n ?"
	read -r install2 # Man that's a mangle of elif,ifs.. Should change to cases 
	if [ $install2 == "Y" ]; then
		chmod +x *
	       for i in "${!fields[@]}"; do
			echo "Would you like to install ${fields[$i]}? (Y/n)"
			read -r install3
			case "$install3" in # added cases
			 [Yy])
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin || {
					 echo "Failed to move binary: ${fields[$i]}"
					 exit 1 # || that code under || triggers only if something fails
				 }
				 ;;
			 [Nn])
				 echo "Skipping ${fields[$i]}" # picky install!
				 ;;
			      *)
				 echo "Invalid input. Skipping ${fields[$i]}" # still skipping
			        ;;
			esac
		done		
	elif [ $install2 == "y" ]; then
		chmod +x *
		for i in "${!fields[@]}"; do
			echo "Would you like to install ${fields[$i]}? (Y/n)"# Literal copy of code above
			read -r install3
			case "$install3" in
			 [Yy])
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin || {
					 echo "Failed to move binary: ${fields[$i]}"
					 exit 1
				 }
				 ;;
			 [Nn])
				 echo "Skipping ${fields[$i]}"
				 ;;
			      *)
				 echo "Invalid input. Skipping ${fields[$i]}"
			        ;;
			esac
		done
	else
		echo "Exit!"; exit 
	fi		
elif [ $install == "n" ]; then
	echo "Whould you like to select which binaries you want to install?"
	echo "Y/n ?"
	read -r install2
	if [ $install2 == "Y" ]; then
	       for i in "${!fields[@]}"; do
			echo "Would you like to install ${fields[$i]}? (Y/n)"
			read -r install3
			case "$install3" in
			 [Yy])
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin || {
					 echo "Failed to move binary: ${fields[$i]}"
					 exit 1
				 }
				 ;;
			 [Nn])
				 echo "Skipping ${fields[$i]}"
				 ;;
			      *)
				 echo "Invalid input. Skipping ${fields[$i]}"
			        ;;
			esac
		done		
	elif [ $install2 == "y" ]; then
		for i in "${!fields[@]}"; do
			echo "Would you like to install ${fields[$i]}? (Y/n)"
			read -r install3
			case "$install3" in
			 [Yy])
				 mv "${fields[$i]}" /data/data/com.termux/files/usr/bin || {
					 echo "Failed to move binary: ${fields[$i]}"
					 exit 1
				 }
				 ;;
			 [Nn])
				 echo "Skipping ${fields[$i]}"
				 ;;
			      *)
				 echo "Invalid input. Skipping ${fields[$i]}"
			        ;;
			esac
		done
	else
		echo "Exit!"; exit 
	fi	
else
       echo "Exiting!"; exit 1
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
