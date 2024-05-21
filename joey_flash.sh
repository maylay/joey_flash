#!/bin/bash

# Terminal script to flash using Joey Jr from linux


for drives in a b c d e f g h 
do
	rdisk=`echo sda$drives`
	dd if=/dev/$rdisk bs=512 skip=0 count=1 > check.txt 2> /dev/null
	
	if grep -q BENNVENN check.txt ; then
		echo Joey Jr Found at /dev/$rdisk
		
		if [ $1 = "ROM" ]
		then
			echo Writing Rom... This may take minutes
			dd if=$2 of=/dev/$rdisk bs=512 seek=37
			break
		fi
		
		if [ $1 = "FLASH" ]
		then
			echo Writing Flash Save... 
			dd if=$2 of=/dev/$rdisk bs=512 seek=65573
			break
		fi
		
		if [ $1 = "SRAM" ]
		then
			echo Writing SRAM... 
			dd if=$2 of=/dev/$rdisk bs=512 seek=65829
			break
		fi
		
		if [ $1 = "EEPROM" ]
		then
			echo Writing EEPROM... 
			dd if=$2 of=/dev/$rdisk bs=512 seek=66085
			break
		fi
		
		if [ $1 = "ROMLIST" ] 
		then
			dd if=$2 of=/dev/$rdisk bs=512 seek=66341 
			echo ROMLIST Update Complete
			break
		fi		

		if [ $1 = "MODE" ] 
		then
			echo $2 > mode.txt
			cnt=`echo $2 | wc -c`
			let cnt=cnt-1
			let cnt=512-cnt
			head -c $cnt < /dev/zero >> mode.txt	
			dd if=mode.txt of=/dev/$rdisk bs=512 seek=66725 2>/dev/null
			echo Mode set to $2
			sleep 1

			if [ $2 = "UPDATE" ] 
			then
				dd if=$3 of=/dev/$rdisk bs=512 seek=66469 
				echo Update Complete
				break
			fi	
			break	
		fi


		break
	fi
done
